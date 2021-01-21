import 'package:flutter/material.dart';
import 'package:flutter/cupertino.dart';
import './init.dart';

void main() async {
  await AppInit.initialize();
  runApp(MyApp());
}

class MyApp extends StatefulWidget {
  @override
  _MyAppState createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> with WidgetsBindingObserver {
  // ignore: unused_field
  // Timer _timerLink;

  // @override
  // void initState() {
  //   WidgetsBinding.instance.addObserver(this);
  //   super.initState();
  // }

  // void _retrieveDynamicLink() async {
  //   DynamicLinksService.initDynamicLinks(context);
  // }

  // @override
  // void didChangeAppLifecycleState(AppLifecycleState state) {
  //   if (state == AppLifecycleState.resumed) {
  //     _timerLink = new Timer(const Duration(milliseconds: 850), () {
  //       _retrieveDynamicLink();
  //     });
  //   }
  // }

  // @override
  // void dispose() {
  //   WidgetsBinding.instance.removeObserver(this);
  //   super.dispose();
  // }

  @override
  Widget build(BuildContext context) {
    //   return BlocProvider(
    //     create: (context) => inject<ThemeCubit>()..fetchTheme(),
    //     child: ScreenUtilSetup(
    //       child: BlocListener<AuthenticationBloc, AuthenticationState>(
    //         cubit: inject<AuthenticationBloc>(),
    //         listener: (context, state) async {
    //           switch (state.status) {
    //           //   case AuthenticationStatus.isFirstTime:
    //           //     ExtendedNavigator.root.pushAndRemoveUntilIfNotCurrent(
    //           //       Routes.onBoardingScreen,
    //           //       // ModalRoute.withName(Routes.loginScreen),
    //           //     );
    //           //     break;

    //           //   case AuthenticationStatus.authenticated:
    //           //     ExtendedNavigator.root.pushAndRemoveUntilIfNotCurrent(
    //           //       Routes.indexPage,
    //           //       // ModalRoute.withName(Routes.indexPage),
    //           //     );

    //           //     break;
    //           //   case AuthenticationStatus.unauthenticated:
    //           //     ExtendedNavigator.root.pushAndRemoveUntilIfNotCurrent(
    //           //       Routes.signUpScreen,
    //           //       // ModalRoute.withName(Routes.loginScreen),
    //           //     );
    //           //     break;

    //           //   case AuthenticationStatus.connectedWebsites:
    //           //     ExtendedNavigator.root.isCurrent(Routes.connectStoreScreen
    //           //         // ModalRoute.withName(Routes.loginScreen),
    //           //         );
    //           //     break;

    //           //   case AuthenticationStatus.connectedWebsites:
    //           //     ExtendedNavigator.root.isCurrent(Routes.manageWebsiteScreen);
    //           //     break;

    //           //   case AuthenticationStatus.isLogin:
    //           //     ExtendedNavigator.root
    //           //         .pushAndRemoveUntilIfNotCurrent(Routes.loginScreen
    //           //             // ModalRoute.withName(Routes.loginScreen),
    //           //             );
    //           //     break;

    //           //   case AuthenticationStatus.isSignUp:
    //           //     ExtendedNavigator.root
    //           //         .pushAndRemoveUntilIfNotCurrent(Routes.signUpScreen
    //           //             // ModalRoute.withName(Routes.loginScreen),
    //           //             );
    //           //     break;

    //           //   case AuthenticationStatus.isResetPassword:
    //           //     ExtendedNavigator.root.isCurrent(Routes.passwordResetScreen
    //           //         // ModalRoute.withName(Routes.loginScreen),
    //           //         );
    //           //     break;
    //           //   case AuthenticationStatus.isEmailVerified:
    //           //     ExtendedNavigator.root.pushAndRemoveUntilIfNotCurrent(
    //           //         Routes.emailVerficationScreen,
    //           //         arguments:
    //           //             EmailVerficationScreenArguments(isVerified: false));

    //           //     // ModalRoute.withName(Routes.loginScreen),
    //           //     break;

    //           //   case AuthenticationStatus.selectADefaultWebsite:
    //           //     ExtendedNavigator.root.pushAndRemoveUntilIfNotCurrent(
    //           //       Routes.selectWebsiteScreen,
    //           //       // ModalRoute.withName(Routes.loginScreen),
    //           //     );
    //           //     break;

    //           //   case AuthenticationStatus.passwordChanged:
    //           //     ExtendedNavigator.root.isCurrent(
    //           //       Routes.changePasswordScreen,
    //           //       // ModalRoute.withName(Routes.loginScreen),
    //           //     );
    //           //     break;

    //           //   default:
    //           // }
    //         },
    //         child: Builder(
    //           builder: (context) {
    //             return ThemeBuilder(
    //               builder: (BuildContext context, ThemePalatte palatte) {
    //                 return MaterialApp(
    //                   debugShowCheckedModeBanner: false,
    //                   builder: ExtendedNavigator.builder(
    //                     navigatorKey: globalNavigatorKey,
    //                     router: SwipeCommRouter(),
    //                     initialRoute: Routes.splashScreen,
    //                     builder: (context, child) => Theme(
    //                       data: ThemeData(
    //                         scaffoldBackgroundColor: palatte.background,
    //                         primaryColor: palatte.corePalatte.primaryColor,
    //                         accentColor: palatte.corePalatte.secondaryColor,
    //                         canvasColor: palatte.background,
    //                         brightness: palatte.brightness,
    //                         textTheme: TextTheme(
    //                           headline1: TextStyle(
    //                               fontFamily: "Poppins",
    //                               color: palatte.onBackground,
    //                               fontSize: 30.flexibleFontSize,
    //                               fontWeight: FontWeight.w700),
    //                           headline2: TextStyle(
    //                               fontFamily: "Poppins",
    //                               color: palatte.onBackground,
    //                               fontSize: 24.flexibleFontSize,
    //                               fontWeight: FontWeight.w700),
    //                           headline3: TextStyle(
    //                               fontFamily: "Poppins",
    //                               color: palatte.onBackground,
    //                               fontSize: 22.flexibleFontSize,
    //                               fontWeight: FontWeight.w700),
    //                           headline4: TextStyle(
    //                               fontFamily: "Poppins",
    //                               color: palatte.onBackground,
    //                               fontSize: 20.flexibleFontSize,
    //                               fontWeight: FontWeight.w700),
    //                           headline5: TextStyle(
    //                               fontFamily: "Poppins",
    //                               color: palatte.onBackground,
    //                               fontSize: 18.flexibleFontSize,
    //                               fontWeight: FontWeight.w700),
    //                           headline6: TextStyle(
    //                               fontFamily: "Poppins",
    //                               color: palatte.onBackground,
    //                               fontSize: 16.flexibleFontSize,
    //                               fontWeight: FontWeight.w700),
    //                           subtitle1: TextStyle(
    //                               fontFamily: "Poppins",
    //                               color: palatte.onBackground,
    //                               fontSize: 16.flexibleFontSize,
    //                               fontWeight: FontWeight.w500),
    //                           subtitle2: TextStyle(
    //                               fontFamily: "Poppins",
    //                               color: palatte.onBackground,
    //                               fontSize: 14.flexibleFontSize,
    //                               fontWeight: FontWeight.w500),
    //                           bodyText1: TextStyle(
    //                               fontFamily: "Poppins",
    //                               color: palatte.onBackground,
    //                               fontSize: 12.flexibleFontSize,
    //                               fontWeight: FontWeight.w500),
    //                           bodyText2: TextStyle(
    //                               fontFamily: "Poppins",
    //                               color: palatte.onBackground,
    //                               fontSize: 10.flexibleFontSize,
    //                               fontWeight: FontWeight.w500),
    //                           button: TextStyle(
    //                               fontFamily: "Poppins",
    //                               color: palatte.onBackgroundDark,
    //                               fontWeight: FontWeight.w700,
    //                               fontSize: 14.flexibleFontSize),
    //                           caption: TextStyle(
    //                               fontFamily: "Poppins",
    //                               color: palatte.onBackgroundLight),
    //                           overline: TextStyle(
    //                               fontFamily: "Poppins",
    //                               color: palatte.onBackgroundLight),
    //                         ),
    //                         appBarTheme: AppBarTheme(
    //                           brightness: palatte.brightness,
    //                           color: palatte.surface,
    //                           iconTheme: IconThemeData(
    //                             color: palatte.onSurface,
    //                           ),
    //                         ),
    //                       ),
    //                       child: child,
    //                     ),
    //                   ),
    //                 );
    //               },
    //             );
    //           },
    //         ),
    //       ),
    //     ),
    //   );
    // }

    return Container(
      child: Text("HELLO WORLD"),
    );
  }
}
