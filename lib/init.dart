import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:bluetooth_demo/globals/swipcomm_bloc_observer.dart';
import 'package:bluetooth_demo/theme/themes/theme_cubit.dart';
import 'package:bluetooth_demo/utils/dependency_injection.dart';
import 'package:bluetooth_demo/data/hive/hive_setup.dart';

class AppInit {
  static Future<void> initialize() async {
    WidgetsFlutterBinding.ensureInitialized();

    SystemChrome.setPreferredOrientations([DeviceOrientation.portraitUp]);
    await HiveSetup.initHive;
    await _externalSetup();
    await inject<ThemeCubit>().fetchTheme();
  }

  /// Startup initialization
  static Future<void> _externalSetup() async {
    WidgetsFlutterBinding.ensureInitialized();
    await initDependencyInjection();
    Bloc.observer = CustomBlocObserver();
  }
}
