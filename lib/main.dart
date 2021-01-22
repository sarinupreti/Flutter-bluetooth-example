import 'package:bell_delivery_hub/authentication_bloc/authentication.dart';
import 'package:bell_delivery_hub/authentication_bloc/repository/authentication_service.dart';
import 'package:bell_delivery_hub/connect_store_screen.dart';
import 'package:bell_delivery_hub/globals/scree_util_setup.dart';
import 'package:bell_delivery_hub/init.dart';
import 'package:bell_delivery_hub/routes/router.gr.dart';
import 'package:bell_delivery_hub/theme/theme_builder.dart';
import 'package:bell_delivery_hub/theme/themes/theme_cubit.dart';
import 'package:bell_delivery_hub/theme/themes/theme_palatte.dart';
import 'package:bell_delivery_hub/utils/dependency_injection.dart';
import 'package:flutter/material.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'authentication_bloc/authentication_bloc.dart';
import 'home_page.dart';
import 'package:auto_route/auto_route.dart';
import 'package:bell_delivery_hub/extensions/number_extensions.dart';

void main() async {
  await AppInit.initialize();
  runApp(
    RepositoryProvider(
      create: (context) {
        return AuthenticationRepository(
            networkApi: inject(), localDataSource: inject());
      },
      // Injects the Authentication BLoC
      child: BlocProvider<AuthenticationBloc>(
        create: (context) {
          final authService =
              RepositoryProvider.of<AuthenticationService>(context);
          return AuthenticationBloc(authService)..add(AppLoaded());
        },
        child: MaterialApp(home: MyApp()),
      ),
    ),
  );

  // runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    final _navKey = GlobalKey<NavigatorState>();

    return BlocProvider(
        create: (context) => inject<ThemeCubit>()..fetchTheme(),
        child: ScreenUtilSetup(
          child: BlocProvider(
            create: (context) => inject<AuthenticationBloc>(),
            child: Builder(
              builder: (context) {
                return ThemeBuilder(
                  builder: (BuildContext context, ThemePalatte palatte) {
                    return MaterialApp(
                      debugShowCheckedModeBanner: false,
                      builder: ExtendedNavigator.builder(
                          router: SwipeCommRouter(),
                          builder: (context, child) => Theme(
                                data: ThemeData(
                                  scaffoldBackgroundColor: palatte.background,
                                  primaryColor:
                                      palatte.corePalatte.primaryColor,
                                  accentColor:
                                      palatte.corePalatte.secondaryColor,
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
                                child: BlocBuilder<AuthenticationBloc,
                                    AuthenticationState>(
                                  builder: (context, state) {
                                    if (state is AuthenticationAuthenticated) {
                                      // show home page
                                      return HomePage(
                                        websiteData: state.websiteData,
                                      );
                                    }

                                    if (state is AuthenticationLoading) {
                                      return CircularProgressIndicator();
                                    }

                                    if (state
                                        is AuthenticationNotAuthenticated) {
                                      return ConnectStoreScreen(
                                        context: context,
                                      );
                                    }

                                    if (state is AuthenticationFailure) {
                                      return Text(state.message);
                                    }

                                    return ConnectStoreScreen(
                                      context: context,
                                    );

                                    // otherwise show login page
                                  },
                                ),
                              )),
                    );
                  },
                );
              },
            ),
          ),
        ));
  }
}
