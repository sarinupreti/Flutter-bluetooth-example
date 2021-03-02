import 'package:bots_demo/blocs/authentication_bloc/authentication_bloc.dart';
import 'package:bots_demo/blocs/authentication_bloc/authentication_state.dart';
import 'package:bots_demo/blocs/login_bloc/login_bloc.dart';
import 'package:bots_demo/blocs/login_bloc/login_event.dart';
import 'package:bots_demo/blocs/login_bloc/login_state.dart';
import 'package:bots_demo/components/button.dart';
import 'package:bots_demo/globals/exveptions/login_error_modal.dart';
import 'package:bots_demo/globals/throttle.dart';
import 'package:bots_demo/globals/validators/field_validators.dart';
import 'package:bots_demo/utils/dependency_injection.dart';
import 'package:bots_demo/utils/theme.dart';
import 'package:clippy_flutter/clippy_flutter.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter/foundation.dart';
import 'package:bots_demo/extensions/context_extension.dart';
import 'package:bots_demo/extensions/number_extensions.dart';

class ConnectStoreScreen extends StatefulWidget {
  final BuildContext context;

  ConnectStoreScreen({Key key, this.context}) : super(key: key);

  @override
  _ConnectStoreScreenState createState() => _ConnectStoreScreenState();
}

class _ConnectStoreScreenState extends State<ConnectStoreScreen> {
  final _formKey = GlobalKey<FormState>();

  TextEditingController consumerKeyController = TextEditingController(
      text: kReleaseMode ? "" : "sarin.upreti01@gmail.com");
  TextEditingController consumerSecretController =
      TextEditingController(text: kReleaseMode ? "" : "sarin123");

  FocusNode consumerKeyFocusNode = FocusNode();
  FocusNode consumerSecretFocusNode = FocusNode();

  bool switchValue = true;
  bool passwordVisible = false;

  bool hasHint = true;

  @override
  void initState() {
    SystemChannels.textInput.invokeMethod('TextInput.hide');
    super.initState();
  }

  @override
  void dispose() {
    consumerKeyController.dispose();
    consumerSecretController.dispose();
    consumerKeyFocusNode.dispose();
    consumerSecretFocusNode.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    // final screenHeight = MediaQuery.of(context).size.height;
    final screenWidth = MediaQuery.of(context).size.width;
    return Scaffold(
        backgroundColor: context.theme.surface,
        body: BlocConsumer<AuthenticationBloc, AuthenticationState>(
            cubit: inject<AuthenticationBloc>(),
            listener: (context, state) {},
            builder: (context, state) {
              return SingleChildScrollView(
                physics: NeverScrollableScrollPhysics(),
                child: Container(
                  width: MediaQuery.of(context).size.width,
                  decoration: BoxDecoration(color: context.theme.surface),
                  child: Form(
                    key: _formKey,
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Stack(
                          children: [
                            Arc(
                                arcType: ArcType.CONVEX,
                                edge: Edge.BOTTOM,
                                height: 100.flexibleHeight,
                                child: Container(
                                  height: 300.flexibleHeight,
                                  width: screenWidth,
                                  decoration: BoxDecoration(
                                      image: DecorationImage(
                                          fit: BoxFit.fitHeight,
                                          image: AssetImage(
                                            "assets/images/bots_bg.png",
                                          ))),
                                  // child:
                                )),
                            Positioned(
                              // top: 50.flexibleHeight,
                              left: 0,
                              right: 0,
                              bottom: 0,
                              child: Container(
                                height: 150.flexibleHeight,
                                alignment: Alignment(0.0, 2.5),
                                child: CircleAvatar(
                                  backgroundImage:
                                      AssetImage("assets/images/bots_logo.png"),
                                  radius: 50.0,
                                ),
                              ),
                            ),
                          ],
                        ),
                        60.verticalSpace,
                        Center(
                          child: Text("Welcome to Bots",
                              textAlign: TextAlign.center,
                              style: Theme.of(context)
                                  .textTheme
                                  .headline6
                                  .copyWith(
                                      color: context.theme.textColor,
                                      fontSize: 25.flexibleFontSize,
                                      fontWeight: FontWeight.w600)),
                        ),
                        Center(
                          child: Text("https://en.bots.io",
                              textAlign: TextAlign.center,
                              style: Theme.of(context)
                                  .textTheme
                                  .headline6
                                  .copyWith(
                                      color: context
                                          .theme.corePalatte.primaryColor,
                                      fontSize: 14.flexibleFontSize,
                                      fontWeight: FontWeight.normal)),
                        ),
                        20.verticalSpace,
                        consumerKey(),
                        20.verticalSpace,
                        consumerSecret(),
                        20.verticalSpace,
                        connectButton(state, context),
                        // termsAndCondition(),
                      ],
                    ),
                  ),
                ),
              );
            }));
  }

  connectButton(AuthenticationState state, BuildContext context) {
    final _throttle = Throttling(duration: Duration(seconds: 2));

    return BlocConsumer<LoginBloc, LoginState>(
      cubit: inject<LoginBloc>(),
      listener: (ctx, loginState) {
//
        if (loginState is LoginFailure)
          ConnectStoreErrorModal.showErrorModal(
              isCustom: false, context: context, message: loginState.error);
        //
      },
      builder: (ctx, loginState) {
        return Padding(
            padding: EdgeInsets.symmetric(horizontal: 20),
            child: Button(
              isLoading: loginState is LoginLoading,
              message: "Login",
              style: AppTextTheme.normal15Text,
              onPressed: () async {
                if (_formKey.currentState.validate()) {
                  _throttle.throttle(() => inject<LoginBloc>().add(
                        LoginInWithEmailButtonPressed(
                          email: consumerKeyController.text,
                          password: consumerSecretController.text,
                        ),
                      ));
                }

                // _showCupertinoAlert();
              },
            ));
      },
    );
  }

  consumerKey() {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 20),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.start,
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Row(
            mainAxisAlignment: MainAxisAlignment.start,
            children: [
              Text("Username/Email",
                  style: Theme.of(context).textTheme.subtitle1.copyWith(
                      fontWeight: FontWeight.w500,
                      fontSize: 14.flexibleFontSize)),
            ],
          ),
          6.verticalSpace,
          TextFormField(
            controller: consumerKeyController,
            focusNode: consumerKeyFocusNode,
            style: Theme.of(context).textTheme.subtitle1.copyWith(
                fontWeight: FontWeight.normal, fontSize: 15.flexibleFontSize),
            validator: FieldValidators.validateEmail,
            inputFormatters: [FilteringTextInputFormatter.deny(" ")],
            onFieldSubmitted: (value) {
              consumerKeyFocusNode.unfocus();
              FocusScope.of(context).requestFocus(consumerSecretFocusNode);
            },
            textInputAction: TextInputAction.next,
            autovalidateMode: AutovalidateMode.onUserInteraction,
            decoration: InputDecoration(
              hintText: 'Enter username',
              hintStyle: AppTextTheme.normal15Text
                  .copyWith(color: AppColors.greyColor),
              disabledBorder: OutlineInputBorder(
                borderSide: BorderSide(
                  color: context.theme.corePalatte.greyColor,
                ),
                borderRadius: BorderRadius.circular(5.0),
              ),
              border: OutlineInputBorder(
                  borderSide: BorderSide(color: AppColors.primaryColor)),
              enabledBorder: OutlineInputBorder(
                  borderSide: BorderSide(
                      width: 2, color: AppColors.primaryColorAccent)),
              focusedBorder: OutlineInputBorder(
                  borderSide: BorderSide(color: AppColors.primaryColor)),
            ),
          ),
        ],
      ),
    );
  }

  consumerSecret() {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 20),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.start,
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Row(
            mainAxisAlignment: MainAxisAlignment.start,
            children: [
              Text("Password",
                  style: Theme.of(context).textTheme.subtitle1.copyWith(
                      fontWeight: FontWeight.w500,
                      fontSize: 14.flexibleFontSize)),
            ],
          ),
          SizedBox(
            height: 6,
          ),
          TextFormField(
            controller: consumerSecretController,
            focusNode: consumerSecretFocusNode,
            style: Theme.of(context).textTheme.subtitle1.copyWith(
                fontWeight: FontWeight.normal, fontSize: 15.flexibleFontSize),
            validator: FieldValidators.validatePassword,
            onFieldSubmitted: (value) {
              consumerSecretFocusNode.unfocus();
            },
            textInputAction: TextInputAction.done,
            inputFormatters: [FilteringTextInputFormatter.deny(" ")],
            autovalidateMode: AutovalidateMode.onUserInteraction,
            obscureText: switchValue ? false : !passwordVisible,
            decoration: InputDecoration(
              border: OutlineInputBorder(
                  borderSide: BorderSide(color: AppColors.primaryColor)),
              enabledBorder: OutlineInputBorder(
                  borderSide: BorderSide(
                      width: 2, color: AppColors.primaryColorAccent)),
              focusedBorder: OutlineInputBorder(
                  borderSide: BorderSide(color: AppColors.primaryColor)),
              hintText: 'Enter your password',
              hintStyle: AppTextTheme.normal15Text
                  .copyWith(color: AppColors.greyColor),
            ),
          ),
        ],
      ),
    );
  }
}
