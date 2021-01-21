import 'package:bell_delivery_hub/authentication_bloc/authentication_bloc.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:bell_delivery_hub/globals/swipcomm_bloc_observer.dart';
import 'package:bell_delivery_hub/theme/themes/theme_cubit.dart';
import 'package:bell_delivery_hub/utils/dependency_injection.dart';
import 'package:bell_delivery_hub/data/hive/hive_setup.dart';

class AppInit {
  static Future<void> initialize() async {
    WidgetsFlutterBinding.ensureInitialized();

    SystemChrome.setPreferredOrientations([DeviceOrientation.portraitUp]);
    await Firebase.initializeApp();
    await HiveSetup.initHive;
    await _externalSetup();
    await inject<ThemeCubit>().fetchTheme();
    inject<AuthenticationBloc>().add(AuthenticationEvent.isSignedIn());
  }

  /// Startup initialization
  static Future<void> _externalSetup() async {
    WidgetsFlutterBinding.ensureInitialized();
    await initDependencyInjection();
    Bloc.observer = SwipeCommBlocObserver();
  }
}
