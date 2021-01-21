import 'package:bell_delivery_hub/data/local_data_source.dart';
import 'package:bell_delivery_hub/globals/exveptions/network_exceptions.dart';
import 'package:bell_delivery_hub/modal/api_response_status.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/services.dart';
import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:meta/meta.dart';
import 'package:firebase_auth/firebase_auth.dart' as auth;

class FirebaseRepository {
  // ignore: unused_field
  final LocalDataSource _localDataSource;
  // ignore: unused_field
  final FirebaseFirestore _firebaseFirestore;
  final FirebaseAuth _firebaseAuth;

  // ignore: unused_field

  FirebaseRepository({
    @required LocalDataSource localDataSource,
    @required FirebaseFirestore firebaseFirestore,
    @required FirebaseAuth firebaseAuth,
  })  : assert(localDataSource != null),
        assert(firebaseFirestore != null),
        assert(firebaseAuth != null),
        _localDataSource = localDataSource,
        _firebaseFirestore = firebaseFirestore,
        _firebaseAuth = firebaseAuth;

  Future<ApiResponseStatus<UserCredential>> registration(
      {String email, String password}) async {
    try {
      final response = await _firebaseAuth.createUserWithEmailAndPassword(
          email: email, password: password);

      await verifyUserEmail(response.user);

      return ApiResponseStatus(
        data: response,
        isSuccessful: true,
        error: null,
        fromLocal: false,
      );
    } on FirebaseAuthException catch (e) {
      return ApiResponseStatus(
          isSuccessful: false, error: NetworkExceptions.getDioException(e));
    }
  }

  Future<ApiResponseStatus<UserCredential>> loginWithCreds(
      {String email, String password}) async {
    try {
      final response = await _firebaseAuth.signInWithEmailAndPassword(
          email: email, password: password);

      await verifyUserEmail(response.user);

      return ApiResponseStatus(
        data: response,
        isSuccessful: true,
        fromLocal: false,
        error: null,
      );
    } on FirebaseAuthException catch (e) {
      return ApiResponseStatus(
          isSuccessful: false, error: NetworkExceptions.getDioException(e));
    }
  }

  Future<ApiResponseStatus<UserCredential>> changePassword(
      {String oldPassword, String newPassword}) async {
    try {
      auth.User user = _firebaseAuth.currentUser;

      final authCreds = EmailAuthProvider.credential(
          email: user.email, password: oldPassword);

      final reauthenticate = await user.reauthenticateWithCredential(authCreds);

      if (reauthenticate != null) {
        final updatePassword = await user.updatePassword(newPassword).then((_) {
          print("Your password changed Succesfully ");
          return true;
        }).catchError((err) {
          print("You can't change the Password" + err.toString());

          return false;
        });

        if (updatePassword) {
          return ApiResponseStatus(
            isSuccessful: true,
            fromLocal: false,
            error: null,
          );
        } else {
          return ApiResponseStatus(
            isSuccessful: false,
            fromLocal: false,
            // error: NetworkExceptions.getDioException(err),
          );
        }
      }
      return ApiResponseStatus(
        isSuccessful: false,
      );
    } on FirebaseAuthException catch (e) {
      return ApiResponseStatus(
          isSuccessful: false, error: NetworkExceptions.getDioException(e));
    }
  }

  Future resetPassword(String email) async {
    try {
      final data = await _firebaseAuth
          .sendPasswordResetEmail(
              email: email,
              actionCodeSettings: ActionCodeSettings(
                  url: "https://applink.swipecomm.com",
                  androidPackageName: "com.swipecomm",
                  iOSBundleId: "com.swipecomm",
                  dynamicLinkDomain: "applink.swipecomm.com",
                  handleCodeInApp: false,
                  androidInstallApp: true))
          .then((value) {
        return ApiResponseStatus(isSuccessful: true);
      }).catchError((e) {
        return ApiResponseStatus(
            error: NetworkExceptions.getDioException(e), isSuccessful: false);
      });

      // ignore: unrelated_type_equality_checks
      if (data != null && data.isSuccessful) {
        return ApiResponseStatus(isSuccessful: true);
      } else {
        return ApiResponseStatus(isSuccessful: false, error: data.error);
      }
    } on PlatformException catch (e) {
      return ApiResponseStatus(
          isSuccessful: false, error: NetworkExceptions.getDioException(e));
    } on FirebaseAuthException catch (e) {
      return ApiResponseStatus(
          isSuccessful: false, error: NetworkExceptions.getDioException(e));
    }
  }

  Future verifyUserEmail(User user) async {
    try {
      if (!user.emailVerified)
        await user.sendEmailVerification(ActionCodeSettings(
            url: "https://applink.swipecomm.com/verifyemail",
            androidPackageName: "com.swipecomm",
            iOSBundleId: "com.swipecomm",
            dynamicLinkDomain: "applink.swipecomm.com",
            handleCodeInApp: true,
            androidInstallApp: true));
      return user;
    } catch (e) {
      print("An error occured while trying to send email verification");
      print(e.message);
    }
  }
}
