import 'package:flutter/material.dart';
import 'package:flutter_acrylic/window.dart';
import 'package:flutter_acrylic/window_effect.dart';
import 'package:weather_app_windows/app/constants.dart';
import 'package:weather_app_windows/app/responsive_screen.dart';
import 'package:weather_app_windows/presentation/resources/color_manager.dart';
import 'package:weather_app_windows/presentation/resources/constants_manager.dart';
import 'package:weather_app_windows/presentation/resources/routes_manager.dart';
import 'package:weather_app_windows/presentation/resources/theme_manager.dart';
import 'package:weather_app_windows/presentation/resources/values_manager.dart';
import 'package:window_manager/window_manager.dart';

class MyApp extends StatefulWidget {
  const MyApp._internal();
  static const MyApp _instance = MyApp._internal();
  factory MyApp() => _instance;

  @override
  State<MyApp> createState() => MyAppState();
}

class MyAppState extends State<MyApp> implements PresentationManager {
  Future<void> initBlure() async {    
    await Window.setEffect(
      effect: WindowEffect.contentBackground,
      color: Colors.white54,
      dark: false
    );
  }

  @override
  void initState() {
    initBlure();
    super.initState();
  }

  @override
  Widget build(BuildContext context) => ResponsiveScreen(
    builder: (context, info) {
      return MaterialApp(
            themeMode: _themeMode,
            debugShowCheckedModeBanner: ConstantsManager.showBanner,
            theme: AppTheme.lightTheme,
            darkTheme: AppTheme.darkTheme,
            initialRoute: AppRoutes.home,
            onGenerateRoute: AppRoutesGenerator.getRoute,
            localizationsDelegates: Constants.localizationsDelegates,
            supportedLocales: Constants.supportedLocales,
            locale: _locale,
          );
    }
  );

  @override
  Locale _locale = const Locale('en', 'EG');

  @override
  ThemeMode _themeMode = ThemeMode.light;

  @override
  bool isDark = false;

  @override
  set changeLocale(Locale locale) {
    if (locale.toString() != _locale.toString()) {
      setState(() {
        _locale = locale;
      });
    }
  }

  @override
  Locale get local => _locale;

  @override
  void changeTheme(ThemeMode themeMode) {
    if (themeMode.name != _themeMode.name) {
      if (themeMode == ThemeMode.dark) {
        isDark = true;
      } else {
        isDark = false;
      }
      setState(() {
        _themeMode = themeMode;
      });
    }
  }
}

abstract class PresentationManager {
  late ThemeMode _themeMode;
  late Locale _locale;
  late bool isDark;
  void changeTheme(ThemeMode themeMode);
  set changeLocale(Locale locale);
  Locale get local;
}
