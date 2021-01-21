import 'package:bell_delivery_hub/authentication_bloc/authentication_bloc.dart';
import 'package:bell_delivery_hub/components/Button.dart';
import 'package:bell_delivery_hub/components/permissions/permission_checker.dart';
import 'package:bell_delivery_hub/globals/throttle.dart';
import 'package:bell_delivery_hub/theme/app_icons.dart';
import 'package:bell_delivery_hub/utils/dependency_injection.dart';
import 'package:bell_delivery_hub/utils/theme.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter/foundation.dart';
import 'package:bell_delivery_hub/extensions/context_extension.dart';
import 'package:bell_delivery_hub/extensions/number_extensions.dart';

class ConnectStoreScreen extends StatefulWidget {
  final bool fromManageWebsite;

  ConnectStoreScreen({Key key, this.fromManageWebsite = false})
      : super(key: key);

  @override
  _ConnectStoreScreenState createState() => _ConnectStoreScreenState();
}

class _ConnectStoreScreenState extends State<ConnectStoreScreen> {
  final _formKey = GlobalKey<FormState>();

  TextEditingController websiteUrlController = TextEditingController(text: "");
  TextEditingController consumerKeyController = TextEditingController(text: "");
  TextEditingController consumerSecretController =
      TextEditingController(text: "");

  FocusNode websiteUrlFocusNode = FocusNode();
  FocusNode consumerKeyFocusNode = FocusNode();
  FocusNode consumerSecretFocusNode = FocusNode();

  bool switchValue = false;
  bool passwordVisible = false;

  final String https = 'https://';

  String hintText = "";

  bool hasHint = true;

  @override
  void initState() {
    SystemChannels.textInput.invokeMethod('TextInput.hide');
    super.initState();
  }

  @override
  void dispose() {
    websiteUrlController.dispose();
    consumerKeyController.dispose();
    consumerSecretController.dispose();
    websiteUrlFocusNode.dispose();
    consumerKeyFocusNode.dispose();
    consumerSecretFocusNode.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    websiteUrlFocusNode.addListener(() {
      if (websiteUrlFocusNode.hasFocus) {
        setState(() {
          hintText = 'www.example.com';
          hasHint = false;
        });
      } else {
        setState(() {
          hintText = 'www.example.com';
          hasHint = true;
        });
      }
    });

    final screenHeight = MediaQuery.of(context).size.height;
    final screenWidth = MediaQuery.of(context).size.width;
    return Scaffold(
        backgroundColor: context.theme.surface,
        body: BlocBuilder<AuthenticationBloc, AuthenticationState>(
            cubit: inject<AuthenticationBloc>(),
            builder: (context, state) {
              return SingleChildScrollView(
                  child: Container(
                width: MediaQuery.of(context).size.width,
                color: context.theme.surface,
                child: Form(
                  key: _formKey,
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.start,
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      50.verticalSpace,
                      widget.fromManageWebsite
                          ? GestureDetector(
                              onTap: () => Navigator.pop(context),
                              child: Padding(
                                padding:
                                    const EdgeInsets.symmetric(horizontal: 20),
                                child: CircleAvatar(
                                  backgroundColor: context.theme.themeType
                                      ? context.theme.corePalatte.greyColor
                                          .withOpacity(0.4)
                                      : Colors.grey[200],
                                  child: Icon(
                                    Icons.arrow_back,
                                    color: Colors.grey[400],
                                  ),
                                ),
                              ),
                            )
                          : SizedBox(),
                      Padding(
                        padding: EdgeInsets.only(
                            top: widget.fromManageWebsite
                                ? screenHeight / 20.flexibleFontSize
                                : screenHeight / 8.flexibleFontSize,
                            left: 20,
                            right: 20),
                        child: Center(
                            child: context.theme.themeType
                                ? Image.asset("assets/images/connect_dark.png")
                                : Image.asset(
                                    "assets/images/connect_light.png")),
                      ),
                      30.verticalSpace,
                      Center(
                        child: Text("Let’s connect your WooCommerce store.",
                            textAlign: TextAlign.center,
                            style: Theme.of(context)
                                .textTheme
                                .headline6
                                .copyWith(
                                    color: context.theme.textColor,
                                    fontSize: 25.flexibleFontSize,
                                    fontWeight: FontWeight.w600)),
                      ),
                      30.verticalSpace,
                      networkSwitch(screenWidth),
                      20.verticalSpace,
                      // name(),
                      // 20.verticalSpace,
                      // email(),
                      // 20.verticalSpace,
                      websiteUrl(),
                      20.verticalSpace,
                      consumerKey(),
                      20.verticalSpace,
                      consumerSecret(),
                      20.verticalSpace,
                      connectButton(state),
                      termsAndCondition(),
                    ],
                  ),
                ),
              ));
            }));
  }

  termsAndCondition() {
    return InkWell(
      onTap: () {
        // ExtendedNavigator.of(context).push(Routes.alternateConnectStoreScreen);
      },
      child: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 25, vertical: 10),
        child: RichText(
            textAlign: TextAlign.center,
            text: TextSpan(
                text: "By connecting you agree to our ",
                style: AppTextTheme.normal12Text.copyWith(
                    color: AppColors.greyColor, fontWeight: FontWeight.normal),
                children: [
                  TextSpan(
                    text: "Privacy policy",
                    style: AppTextTheme.normal12Text.copyWith(
                        color: AppColors.primaryColor,
                        fontWeight: FontWeight.normal),
                  ),
                  TextSpan(
                    text: " and ",
                    style: AppTextTheme.normal12Text.copyWith(
                        color: AppColors.greyColor,
                        fontWeight: FontWeight.normal),
                  ),
                  TextSpan(
                    text: "Terms and Conditions",
                    style: AppTextTheme.normal12Text.copyWith(
                        color: AppColors.primaryColor,
                        fontWeight: FontWeight.normal),
                  ),
                ])),
      ),
    );
  }

  connectButton(AuthenticationState state) {
    final _throttle = Throttling(duration: Duration(seconds: 2));

    websiteUrlController.addListener(() {
      if (websiteUrlController.text.startsWith("https://")) {
        final value = websiteUrlController.text.replaceAll("https://", "");

        websiteUrlController.clear();

        setState(() {
          websiteUrlController.text = value;
        });
      }
    });

    return Padding(
      padding: EdgeInsets.symmetric(horizontal: 20),
      child: Hero(
        tag: "home",
        child: Button(
          isLoading: state.isLoading,
          message: "Connect",
          style: AppTextTheme.normal15Text,
          onPressed: () async {
            if (_formKey.currentState.validate()) {
              final websiteValidatedUrl = websiteUrlController.text
                          .substring(websiteUrlController.text.length - 1) ==
                      "/"
                  ? websiteUrlController.text
                  : websiteUrlController.text + "/";

              _throttle.throttle(() => inject<AuthenticationBloc>().add(
                    AuthenticationEvent.connectAWebsite(
                      // name: nameController.text,
                      // email: emailController.text,
                      websiteUrl: https + websiteValidatedUrl,
                      consumerKey: consumerKeyController.text,
                      consumerSecret: consumerSecretController.text,
                      isLegacy: switchValue,
                      isFromManageWebsite: widget.fromManageWebsite,
                      context: context,
                    ),
                  ));
            }

            // _showCupertinoAlert();
          },
        ),
      ),
    );
  }

  networkSwitch(double width) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 20),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Column(
            mainAxisAlignment: MainAxisAlignment.start,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Row(
                children: [
                  Text("Legacy login",
                      style: Theme.of(context).textTheme.subtitle1.copyWith(
                          fontWeight: FontWeight.w500,
                          fontSize: 14.flexibleFontSize)),
                  5.horizontalSpace,
                  Icon(
                    Icons.info,
                    color: context.theme.corePalatte.greyColor,
                  ),
                ],
              ),
              4.verticalSpace,
              SizedBox(
                width: width / 1.5,
                child: Text(
                    "Enable this only when you have  WordPress version below 5.5",
                    style: Theme.of(context).textTheme.subtitle1.copyWith(
                        fontWeight: FontWeight.normal,
                        color: context.theme.corePalatte.greyColor,
                        fontSize: 14.flexibleFontSize)),
              ),
            ],
          ),
          Switch.adaptive(
            value: switchValue,
            onChanged: (value) {
              setState(() {
                switchValue = !switchValue;
              });
            },
            activeColor: context.theme.corePalatte.primaryColor,
          )
        ],
      ),
    );
  }

  websiteUrl() {
    final urlPattern =
        r'^(http:\/\/www\.|https:\/\/www\.|http:\/\/|https:\/\/)[a-z0-9]+([\-\.]{1}[a-z0-9]+)*\.[a-z]{2,5}(:[0-9]{1,5})?(\/.*)?$';

    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 20),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.start,
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text("Website URL",
              style: Theme.of(context).textTheme.subtitle1.copyWith(
                  fontWeight: FontWeight.w500, fontSize: 14.flexibleFontSize)),
          4.verticalSpace,
          Text(
            "Enter your website URL",
            style: Theme.of(context).textTheme.subtitle1.copyWith(
                fontSize: 13.flexibleFontSize,
                color: AppColors.greyColor,
                fontWeight: FontWeight.normal),
          ),
          SizedBox(
            height: 6,
          ),
          TextFormField(
            controller: websiteUrlController,
            focusNode: websiteUrlFocusNode,
            style: Theme.of(context).textTheme.subtitle1.copyWith(
                fontWeight: FontWeight.normal, fontSize: 15.flexibleFontSize),
            validator: (String value) {
              if (value.isEmpty) {
                return 'website url cannot be empty.';
              } else if (RegExp(urlPattern, caseSensitive: false)
                      .firstMatch(https + value) ==
                  null) {
                return "Invalid url. ";
              } else
                return null;
            },
            onFieldSubmitted: (value) {
              websiteUrlFocusNode.unfocus();
              FocusScope.of(context).requestFocus(consumerKeyFocusNode);
            },
            textInputAction: TextInputAction.next,
            inputFormatters: [FilteringTextInputFormatter.deny(" ")],
            autovalidateMode: AutovalidateMode.onUserInteraction,
            decoration: InputDecoration(
              prefixText: websiteUrlController.text.isNotEmpty
                  ? https
                  : websiteUrlController.text.isEmpty && !hasHint
                      ? https
                      : "",
              prefixStyle: Theme.of(context).textTheme.subtitle2.copyWith(
                  color: websiteUrlController.text.isEmpty && hasHint
                      ? context.theme.corePalatte.greyColor
                      : context.theme.corePalatte.seaGreenColor),
              prefixIcon: Padding(
                padding: const EdgeInsets.only(left: 10, bottom: 5),
                child: Icon(Icons.lock,
                    size: 18.flexibleFontSize,
                    color: websiteUrlController.text.isEmpty && hasHint
                        ? context.theme.corePalatte.greyColor
                        : context.theme.corePalatte.seaGreenColor),
              ),
              prefixIconConstraints: BoxConstraints(minWidth: 0, minHeight: 0),
              border: OutlineInputBorder(
                  borderSide: BorderSide(color: AppColors.primaryColor)),
              enabledBorder: OutlineInputBorder(
                  borderSide: BorderSide(
                      width: 2, color: AppColors.primaryColorAccent)),
              focusedBorder: OutlineInputBorder(
                  borderSide: BorderSide(color: AppColors.primaryColor)),
              hintText: websiteUrlController.text.isEmpty && !hasHint
                  ? "example.com"
                  : !hasHint
                      ? "example.com"
                      : "https://example.com",
              hintStyle: Theme.of(context).textTheme.subtitle2.copyWith(
                  color: websiteUrlController.text.isNotEmpty && hasHint
                      ? context.theme.corePalatte.seaGreenColor
                      : AppColors.greyColor),
            ),
          ),
        ],
      ),
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
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Text(!switchValue ? "Username" : "Consumer Key",
                  style: Theme.of(context).textTheme.subtitle1.copyWith(
                      fontWeight: FontWeight.w500,
                      fontSize: 14.flexibleFontSize)),
              Text(
                "Where to find?",
                style: AppTextTheme.normal12Text
                    .copyWith(color: AppColors.primaryColor),
              ),
            ],
          ),
          6.verticalSpace,
          TextFormField(
            controller: consumerKeyController,
            focusNode: consumerKeyFocusNode,
            style: Theme.of(context).textTheme.subtitle1.copyWith(
                fontWeight: FontWeight.normal, fontSize: 15.flexibleFontSize),
            validator: (String value) {
              if (value.isEmpty) {
                return !switchValue
                    ? "username cannot be empty"
                    : 'consumer key cannot be empty.';
              } else if (switchValue &&
                  !value.toLowerCase().startsWith("ck_")) {
                return "Invalid consumer key format. ";
              } else
                return null;
            },
            inputFormatters: [FilteringTextInputFormatter.deny(" ")],
            onFieldSubmitted: (value) {
              consumerKeyFocusNode.unfocus();
              FocusScope.of(context).requestFocus(consumerSecretFocusNode);
            },
            textInputAction: TextInputAction.next,
            autovalidateMode: AutovalidateMode.onUserInteraction,
            decoration: InputDecoration(
              suffixIcon: !switchValue
                  ? SizedBox.shrink()
                  : IconButton(
                      onPressed: () async {
                        onQrScannerPressed(context);
                      },
                      icon: Icon(
                        AppIcons.scan,
                        color: AppColors.primaryColor,
                      ),
                    ),
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
              hintText: !switchValue
                  ? "Enter your WordPress username"
                  : 'Type or scan your consumer Key',
              hintStyle: AppTextTheme.normal15Text
                  .copyWith(color: AppColors.greyColor),
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
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Text(!switchValue ? "Application Password" : "Consumer Secret",
                  style: Theme.of(context).textTheme.subtitle1.copyWith(
                      fontWeight: FontWeight.w500,
                      fontSize: 14.flexibleFontSize)),
              Text(
                "Where to find?",
                style: AppTextTheme.normal12Text
                    .copyWith(color: AppColors.primaryColor),
              ),
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
            validator: (String value) {
              if (value.isEmpty) {
                return !switchValue
                    ? "Enter your application password"
                    : 'consumer secret cannot be empty.';
              } else if (switchValue &&
                  !value.toLowerCase().startsWith("cs_")) {
                return "Invalid consumer secret format.";
              } else if (!switchValue && value.length != 24) {
                return "Application password should be 24 character long..";
              } else
                return null;
            },
            onFieldSubmitted: (value) {
              consumerSecretFocusNode.unfocus();
            },
            textInputAction: TextInputAction.done,
            inputFormatters: [
              // if (!switchValue) LengthLimitingTextInputFormatter(20),
              FilteringTextInputFormatter.deny(" ")
            ],
            autovalidateMode: AutovalidateMode.onUserInteraction,
            obscureText: switchValue ? false : !passwordVisible,
            decoration: InputDecoration(
              suffixIcon: !switchValue
                  ? IconButton(
                      icon: Icon(
                        passwordVisible
                            ? Icons.visibility
                            : Icons.visibility_off,
                        color: context.theme.corePalatte.primaryColor,
                        size: 20.flexibleFontSize,
                      ),
                      onPressed: () {
                        setState(() {
                          passwordVisible = !passwordVisible;
                        });
                      },
                    )
                  : IconButton(
                      onPressed: () async {
                        onQrScannerPressed(context);
                      },
                      icon: Icon(
                        Icons.scanner,
                        color: AppColors.primaryColor,
                      ),
                    ),
              border: OutlineInputBorder(
                  borderSide: BorderSide(color: AppColors.primaryColor)),
              enabledBorder: OutlineInputBorder(
                  borderSide: BorderSide(
                      width: 2, color: AppColors.primaryColorAccent)),
              focusedBorder: OutlineInputBorder(
                  borderSide: BorderSide(color: AppColors.primaryColor)),
              hintText: !switchValue
                  ? "Enter your application password"
                  : 'Type or scan your consumer Key',
              hintStyle: AppTextTheme.normal15Text
                  .copyWith(color: AppColors.greyColor),
            ),
          ),
        ],
      ),
    );
  }

  onQrScannerPressed(BuildContext context) async {
    await SystemChannels.textInput.invokeMethod('TextInput.hide');

    final bool hasCameraPermission =
        await PermissionChecker.hasCameraPermission(context);

    if (hasCameraPermission) {
      // final result = await ExtendedNavigator.of(context).push(
      //   Routes.qRScannerPage,
      // );

      // if (result != null) {
      //   final qrData = result as String;

      //   if (qrData.contains("ck_") && qrData.contains("cs_")) {
      //     final List<String> keys = qrData.split("|");
      //     setState(() {
      //       consumerKeyController.text = keys[0];
      //       consumerSecretController.text = keys[1];
      //     });
      //   } else {
      //     context.showStatusBar(
      //         icon: Icon(
      //           Icons.error,
      //           color: context.theme.error,
      //         ),
      //         message: "The scanned qr code does not matches the format.");
      //   }
      // }
    }
  }
}
