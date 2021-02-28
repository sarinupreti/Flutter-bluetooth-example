import 'package:bots_demo/blocs/authentication_bloc/authentication_bloc.dart';
import 'package:bots_demo/blocs/authentication_bloc/authentication_state.dart';
import 'package:bots_demo/components/error_screen.dart';
import 'package:bots_demo/globals/navigation.dart';
import 'package:bots_demo/globals/scree_util_setup.dart';
import 'package:bots_demo/init.dart';
import 'package:bots_demo/routes/router.dart';
import 'package:bots_demo/routes/router.gr.dart';
import 'package:bots_demo/theme/theme_builder.dart';
import 'package:bots_demo/theme/themes/theme_cubit.dart';
import 'package:bots_demo/theme/themes/theme_palatte.dart';
import 'package:bots_demo/utils/dependency_injection.dart';
import 'package:flutter/material.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:auto_route/auto_route.dart';
import 'package:bots_demo/extensions/number_extensions.dart';
import 'package:bots_demo/extensions/navigation_extension.dart';

void main() async {
  await AppInit.initialize();
  runApp(MyApp());
}

class MyApp extends StatefulWidget {
  @override
  _MyAppState createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> with WidgetsBindingObserver {
  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => inject<ThemeCubit>()..fetchTheme(),
      child: ScreenUtilSetup(
        child: BlocListener<AuthenticationBloc, AuthenticationState>(
          cubit: inject<AuthenticationBloc>(),
          listener: (context, state) async {
            if (state is AuthenticationAuthenticated) {
              ExtendedNavigator.root.pushAndRemoveUntilIfNotCurrent(
                Routes.homePage,
              );
            } else if (state is AuthenticationLoading) {
              return ExtendedNavigator.root.pushAndRemoveUntilIfNotCurrent(
                Routes.splashScreen,
              );
            } else if (state is AuthenticationNotAuthenticated) {
              return ExtendedNavigator.root.pushAndRemoveUntilIfNotCurrent(
                Routes.connectStoreScreen,
              );
            } else if (state is AuthenticationFailure) {
              return ExtendedNavigator.root
                  .pushAndRemoveUntilIfNotCurrent(Routes.errorScreen,
                      arguments: ErrorScreen(
                        context: context,
                        message: state.message,
                      ));
            } else
              return CircularProgressIndicator();
          },
          child: Builder(
            builder: (context) {
              return ThemeBuilder(
                builder: (BuildContext context, ThemePalatte palatte) {
                  return MaterialApp(
                    debugShowCheckedModeBanner: false,
                    builder: ExtendedNavigator.builder(
                      navigatorKey: globalNavigatorKey,
                      router: BotsDemomRouter(),
                      initialRoute: Routes.splashScreen,
                      builder: (context, child) => Theme(
                        data: ThemeData(
                          scaffoldBackgroundColor: palatte.background,
                          primaryColor: palatte.corePalatte.primaryColor,
                          accentColor: palatte.corePalatte.secondaryColor,
                          canvasColor: palatte.background,
                          brightness: palatte.brightness,
                          textTheme: TextTheme(
                            headline1: TextStyle(
                                fontFamily: "Poppins",
                                color: palatte.onBackground,
                                fontSize: 30.flexibleFontSize,
                                fontWeight: FontWeight.w700),
                            headline2: TextStyle(
                                fontFamily: "Poppins",
                                color: palatte.onBackground,
                                fontSize: 24.flexibleFontSize,
                                fontWeight: FontWeight.w700),
                            headline3: TextStyle(
                                fontFamily: "Poppins",
                                color: palatte.onBackground,
                                fontSize: 22.flexibleFontSize,
                                fontWeight: FontWeight.w700),
                            headline4: TextStyle(
                                fontFamily: "Poppins",
                                color: palatte.onBackground,
                                fontSize: 20.flexibleFontSize,
                                fontWeight: FontWeight.w700),
                            headline5: TextStyle(
                                fontFamily: "Poppins",
                                color: palatte.onBackground,
                                fontSize: 18.flexibleFontSize,
                                fontWeight: FontWeight.w700),
                            headline6: TextStyle(
                                fontFamily: "Poppins",
                                color: palatte.onBackground,
                                fontSize: 16.flexibleFontSize,
                                fontWeight: FontWeight.w700),
                            subtitle1: TextStyle(
                                fontFamily: "Poppins",
                                color: palatte.onBackground,
                                fontSize: 16.flexibleFontSize,
                                fontWeight: FontWeight.w500),
                            subtitle2: TextStyle(
                                fontFamily: "Poppins",
                                color: palatte.onBackground,
                                fontSize: 14.flexibleFontSize,
                                fontWeight: FontWeight.w500),
                            bodyText1: TextStyle(
                                fontFamily: "Poppins",
                                color: palatte.onBackground,
                                fontSize: 12.flexibleFontSize,
                                fontWeight: FontWeight.w500),
                            bodyText2: TextStyle(
                                fontFamily: "Poppins",
                                color: palatte.onBackground,
                                fontSize: 10.flexibleFontSize,
                                fontWeight: FontWeight.w500),
                            button: TextStyle(
                                fontFamily: "Poppins",
                                color: palatte.onBackgroundDark,
                                fontWeight: FontWeight.w700,
                                fontSize: 14.flexibleFontSize),
                            caption: TextStyle(
                                fontFamily: "Poppins",
                                color: palatte.onBackgroundLight),
                            overline: TextStyle(
                                fontFamily: "Poppins",
                                color: palatte.onBackgroundLight),
                          ),
                          appBarTheme: AppBarTheme(
                            brightness: palatte.brightness,
                            color: palatte.surface,
                            iconTheme: IconThemeData(
                              color: palatte.onSurface,
                            ),
                          ),
                        ),
                        child: child,
                      ),
                    ),
                  );
                },
              );
            },
          ),
        ),
      ),
    );
  }
}
