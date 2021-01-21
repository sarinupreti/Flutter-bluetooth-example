import 'dart:async';
import 'package:bell_delivery_hub/authentication_bloc/repository/authentication_repository.dart';
import 'package:bell_delivery_hub/authentication_bloc/repository/firebase_repository.dart';
import 'package:bell_delivery_hub/globals/exveptions/login_error_modal.dart';
import 'package:bell_delivery_hub/globals/exveptions/network_exceptions.dart';
import 'package:bell_delivery_hub/modal/user.dart';
import 'package:bell_delivery_hub/modal/website_data.dart';
import 'package:bloc/bloc.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:meta/meta.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:bell_delivery_hub/extensions/flash_util.dart';

part 'authentication_bloc.freezed.dart';
part 'authentication_event.dart';
part 'authentication_state.dart';

class AuthenticationBloc
    extends Bloc<AuthenticationEvent, AuthenticationState> {
  AuthenticationBloc({
    @required AuthenticationRepository authenticationRepository,
    @required FirebaseRepository firebaseRepository,
  })  : assert(authenticationRepository != null, firebaseRepository != null),
        _authenticationRepository = authenticationRepository,
        _firebaseRepository = firebaseRepository,
        super(AuthenticationState(
            status: AuthenticationStatus.isFirstTime,
            auth: null,
            errorMessageSignUp: null,
            errorMessageLogin: null,
            currentWebsiteData: null,
            isLoading: false));

  final AuthenticationRepository _authenticationRepository;
  final FirebaseRepository _firebaseRepository;

  @override
  Stream<AuthenticationState> mapEventToState(
    AuthenticationEvent event,
  ) async* {
    yield* event.map(
        connectAWebsite: (event) async* {
          yield state.copyWith(
            isLoading: true,
            status: AuthenticationStatus.connectedWebsites,
          );

          final localUserData =
              await _authenticationRepository.getUserFromLocal();

          // final encruptedCK = await event.consumerKey.encryptString();
          // final encruptedCS = await event.consumerSecret.encryptString();

          final encruptedCK = event.consumerKey;
          final encruptedCS = event.consumerSecret;

          final encryptedWebsiteData = WebsiteData(
              isLegacy: event.isLegacy,
              websiteUrl: event.websiteUrl,
              consumerKey: encruptedCK,
              consumerSecret: encruptedCS);

          await _authenticationRepository.saveAuth(encryptedWebsiteData, false);

          final loginResponse = await _authenticationRepository
              .connectWebsiteData(encryptedWebsiteData);

          if (loginResponse.isSuccessful) {
            await _authenticationRepository.saveUser(localUserData);

            CollectionReference users =
                FirebaseFirestore.instance.collection('users');

            final document = await FirebaseFirestore.instance
                .collection('users')
                .doc(localUserData.uId)
                .get()
                .then((DocumentSnapshot documentSnapshot) {
              if (documentSnapshot.exists) {
                return documentSnapshot.data();
              } else {
                print('Document does not exist on the database');
              }
            });

            final userData = User.fromJson(document);

            final bool alreadyRegisted = (userData.connectedWebsites.length >
                    0 &&
                userData.connectedWebsites.any(
                    (WebsiteData item) => item.websiteUrl == event.websiteUrl));

            print(alreadyRegisted);

            if (!alreadyRegisted) {
              await users.doc(localUserData.uId).update({
                "connectedWebsites":
                    FieldValue.arrayUnion([encryptedWebsiteData.toJson()]),
              }).then((value) {
                print("Website Added to firebase successfully");
              }).catchError((error) => print("Failed to add user: $error"));

              if (event.isFromManageWebsite) {
                if (document != null) {
                  await _authenticationRepository.saveUser(userData);

                  yield state.copyWith(
                      status: AuthenticationStatus.authenticated,
                      auth: userData,
                      isLoading: false);
                }
              } else
                await _authenticationRepository.saveUser(localUserData);

              if (localUserData.connectedWebsites.length == 1) {
                await _authenticationRepository.saveAuth(
                    encryptedWebsiteData, false);

                yield state.copyWith(
                    status: AuthenticationStatus.authenticated,
                    auth: localUserData,
                    isLoading: false);
              }
            } else {
              ConnectStoreErrorModal.showErrorModal(
                  context: event.context,
                  message: "Website already exists or linked with the account");

              yield state.copyWith(
                isLoading: false,
                status: AuthenticationStatus.connectedWebsites,
              );
            }
          } else {
            ConnectStoreErrorModal.showErrorModal(
                context: event.context,
                message:
                    NetworkExceptions.getErrorMessage(loginResponse.error));

            yield state.copyWith(
              isLoading: false,
              status: AuthenticationStatus.connectedWebsites,
            );
          }
        },
        isSignedIn: (event) async* {
          final String firstTimeWalkthrough = "isFirstTimeWalkthrough";

          SharedPreferences pref = await SharedPreferences.getInstance();

          final user = await _authenticationRepository.isLoggedIn();

          print(pref);
          if (!pref.containsKey(firstTimeWalkthrough)) {
            await pref.setBool(firstTimeWalkthrough, true);
          }

          yield user != null && user.uId != null && user.uId.isNotEmpty
              ? pref.get(firstTimeWalkthrough)
                  ? state.copyWith(
                      status: AuthenticationStatus.isFirstTime,
                      auth: null,
                      currentDateTime: DateTime.now().millisecondsSinceEpoch)
                  : user.connectedWebsites.length > 0
                      ? state.copyWith(
                          status: AuthenticationStatus.authenticated,
                          auth: user,
                          currentDateTime:
                              DateTime.now().millisecondsSinceEpoch)
                      : state.copyWith(
                          status: AuthenticationStatus.connectedWebsites,
                          auth: user,
                          currentDateTime:
                              DateTime.now().millisecondsSinceEpoch)
              : pref.get(firstTimeWalkthrough)
                  ? state.copyWith(
                      status: AuthenticationStatus.isFirstTime,
                      auth: null,
                      currentDateTime: DateTime.now().millisecondsSinceEpoch)
                  : state.copyWith(
                      status: AuthenticationStatus.unauthenticated,
                      auth: null,
                      currentDateTime: DateTime.now().millisecondsSinceEpoch);
        },
        logOut: (event) async* {
          await _authenticationRepository.logOut();
          yield state.copyWith(
              status: AuthenticationStatus.unauthenticated,
              auth: null,
              currentDateTime: DateTime.now().millisecondsSinceEpoch);
        },
        scanQR: (value) async* {},
        loginToFirebase: (event) async* {
          yield state.copyWith(
              errorMessageLogin: null,
              isLoading: true,
              status: AuthenticationStatus.isLogin,
              currentDateTime: DateTime.now().millisecondsSinceEpoch);

          final apiResult = await _firebaseRepository.loginWithCreds(
              email: event.email, password: event.password);

          if (apiResult.isSuccessful) {
            final data = apiResult.data.user;

            final document = await FirebaseFirestore.instance
                .collection('users')
                .doc(data.uid)
                .get()
                .then((DocumentSnapshot documentSnapshot) {
              if (documentSnapshot.exists) {
                // print('Document data: ${documentSnapshot.data()}');

                return documentSnapshot.data();
              } else {
                print('Document does not exist on the database');
              }
            });

            if (document != null) {
              final user = User.fromJson(document);

              await _authenticationRepository.saveUser(user);

              if (user.connectedWebsites.length == 1) {
                await _authenticationRepository.saveAuth(
                    user.connectedWebsites[0], false);
              }

              if (!user.emailVerified) {
                yield state.copyWith(
                    status: AuthenticationStatus.isEmailVerified,
                    auth: user,
                    isLoading: false,
                    errorMessageLogin: null,
                    currentDateTime: DateTime.now().millisecondsSinceEpoch);
              } else if (user != null &&
                  user.connectedWebsites != null &&
                  user.connectedWebsites.length == 0) {
                yield state.copyWith(
                    status: AuthenticationStatus.connectedWebsites,
                    isLoading: false,
                    auth: user,
                    errorMessageLogin: null,
                    currentDateTime: DateTime.now().millisecondsSinceEpoch);
              } else if (user != null &&
                  user.connectedWebsites != null &&
                  user.connectedWebsites.length > 1) {
                yield state.copyWith(
                    status: AuthenticationStatus.selectADefaultWebsite,
                    isLoading: false,
                    auth: user,
                    errorMessageLogin: null,
                    currentDateTime: DateTime.now().millisecondsSinceEpoch);
              } else {
                yield state.copyWith(
                    status: AuthenticationStatus.authenticated,
                    auth: user,
                    currentWebsiteData: user.connectedWebsites[0],
                    isLoading: false,
                    errorMessageLogin: null,
                    currentDateTime: DateTime.now().millisecondsSinceEpoch);
              }
            } else {
              event.context.showStatusBar(
                  message: NetworkExceptions.getErrorMessage(apiResult.error),
                  icon: null);
            }
          } else {
            final errorMessage =
                NetworkExceptions.getErrorMessage(apiResult.error);

            yield state.copyWith(
                status: AuthenticationStatus.isLogin,
                errorMessageLogin: errorMessage,
                isLoading: false,
                currentTime: DateTime.now().millisecondsSinceEpoch);
          }
        },
        registerToFirebase: (event) async* {
          yield state.copyWith(
              errorMessageSignUp: null,
              isLoading: true,
              status: AuthenticationStatus.isSignUp,
              currentDateTime: DateTime.now().millisecondsSinceEpoch);

          final apiResult = await _firebaseRepository.registration(
              email: event.email, password: event.password);

          if (apiResult.isSuccessful && apiResult.error == null) {
            final data = apiResult.data.user;

            final user = User(
              name: event.name,
              email: event.email,
              emailVerified: data.emailVerified,
              connectedWebsites: [],
              creationTime: data.metadata.creationTime,
              lastSignInTime: data.metadata.lastSignInTime,
              phoneNumber: data.phoneNumber,
              photoURL: data.photoURL,
              providerType: data.providerData.map((e) => e.providerId).toList(),
              uId: data.uid,
            );

            CollectionReference users =
                FirebaseFirestore.instance.collection('users');

            await users
                .doc(user.uId)
                .set(user.toJson())
                .then((value) => print("User Added"))
                .catchError((error) => print("Failed to add user: $error"));

            await _authenticationRepository.saveUser(user);

            if (!apiResult.data.user.emailVerified) {
              yield state.copyWith(
                  status: AuthenticationStatus.isEmailVerified,
                  isLoading: false,
                  auth: user,
                  errorMessageSignUp: null,
                  currentDateTime: DateTime.now().millisecondsSinceEpoch);
            } else if (user != null &&
                user.connectedWebsites != null &&
                user.connectedWebsites.length > 0) {
              yield state.copyWith(
                  status: AuthenticationStatus.connectedWebsites,
                  isLoading: false,
                  auth: user,
                  errorMessageSignUp: null,
                  currentDateTime: DateTime.now().millisecondsSinceEpoch);
            }
          } else {
            final errorMessage =
                NetworkExceptions.getErrorMessage(apiResult.error);

            if (errorMessage ==
                "The email address is already in use by another account.") {
              yield state.copyWith(
                  isLoading: false,
                  errorMessageSignUp: errorMessage,
                  status: AuthenticationStatus.isSignUp);
            } else {
              ConnectStoreErrorModal.showErrorModal(
                  context: event.context,
                  message: NetworkExceptions.getErrorMessage(apiResult.error));
            }
          }
        },
        resetPassword: (event) async* {
          yield state.copyWith(
              errorMessageResetPassword: null,
              isLoading: true,
              status: AuthenticationStatus.isResetPassword,
              currentDateTime: DateTime.now().millisecondsSinceEpoch);

          final response = await _firebaseRepository.resetPassword(
            event.email,
          );

          if (response.isSuccessful != null && response.isSuccessful) {
            Navigator.pop(event.context);

            yield state.copyWith(
                errorMessageResetPassword: null,
                isLoading: false,
                status: AuthenticationStatus.isResetPassword,
                currentDateTime: DateTime.now().millisecondsSinceEpoch);
            event.context.showStatusBar(
                message:
                    "A password reset email has been send to you. Please check your mail",
                icon: null,
                duration: Duration(seconds: 3));
          } else {
            final errorMessage =
                NetworkExceptions.getErrorMessage(response.error);

            yield state.copyWith(
                errorMessageResetPassword: errorMessage,
                isLoading: false,
                status: AuthenticationStatus.isResetPassword,
                currentDateTime: DateTime.now().millisecondsSinceEpoch);
          }
        },
        selectDefaultWebsite: (event) async* {
          final dencruptedCK = event.websiteData.consumerKey;
          final dencruptedCS = event.websiteData.consumerSecret;

          final decryptedData = WebsiteData(
              isLegacy: event.websiteData.isLegacy,
              websiteUrl: event.websiteData.websiteUrl.trim(),
              consumerKey: dencruptedCK.trim(),
              consumerSecret: dencruptedCS.trim());

          await _authenticationRepository.saveAuth(decryptedData, false);

          yield state.copyWith(
              status: event.isFromSettings
                  ? AuthenticationStatus.manageWebsite
                  : AuthenticationStatus.authenticated,
              isLoading: false,
              auth: event.user,
              currentWebsiteData: decryptedData,
              currentDateTime: DateTime.now().millisecondsSinceEpoch);
        },
        currentWebsite: (event) async* {
          final websiteData = await _authenticationRepository.getAuth();

          yield state.copyWith(
              currentWebsiteData: websiteData,
              currentDateTime: DateTime.now().millisecondsSinceEpoch);
        },
        changePassword: (event) async* {
          yield state.copyWith(
              errorMessageChangePassword: null,
              isLoading: true,
              status: AuthenticationStatus.passwordChanged,
              currentDateTime: DateTime.now().millisecondsSinceEpoch);

          final response = await _firebaseRepository.changePassword(
              oldPassword: event.oldPassword, newPassword: event.newPassword);

          print(response);

          if (response != null && response.isSuccessful) {
            yield state.copyWith(
                errorMessageChangePassword: null,
                isLoading: false,
                status: AuthenticationStatus.passwordChanged,
                currentDateTime: DateTime.now().millisecondsSinceEpoch);

            Navigator.pop(event.context);
            //
            event.context.showStatusBar(
                message: "Password changed succesfully.",
                icon: null,
                duration: Duration(seconds: 3));
          } else {
            final errorMessage =
                NetworkExceptions.getErrorMessage(response.error);

            yield state.copyWith(
                errorMessageChangePassword: errorMessage,
                isLoading: false,
                status: AuthenticationStatus.passwordChanged,
                currentDateTime: DateTime.now().millisecondsSinceEpoch);
          }
        });
  }
}
