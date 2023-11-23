import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:weather_app_windows/app/constants_locale.dart';

import 'constants.dart';

abstract class AppPreferences {
  Future<ThemeMode> appTheme(ThemeMode? themeMode);
  Future<Locale> appLocale(Locale? locale);
  Future<bool> isUserRegistered(bool? registered);
  Future<String?> tokin(String? tokin);

  /// check if it's the first time that user open the app
  Future<bool> onBoardingCompleted(bool? completed);
}

class AppPreferencesImpl extends AppPreferences {
  Future<SharedPreferences> preferences = SharedPreferences.getInstance();

  @override
  Future<ThemeMode> appTheme(ThemeMode? themeMode) async {
    SharedPreferences pref = await preferences;
    if (themeMode == null) {
      if (pref.containsKey(Constants.isDarkTheme)) {
        bool isDarkTheme = pref.getBool(Constants.isDarkTheme)!;
        if (isDarkTheme) return ThemeMode.dark;
      }
      return ThemeMode.light;
    } else {
      await pref.setBool(Constants.isDarkTheme, themeMode == ThemeMode.dark ? true : false);
      return themeMode;
    }
  }

  @override
  Future<bool> onBoardingCompleted(bool? completed) async {
    SharedPreferences pref = await preferences;
    if (completed == null) {
      if (pref.containsKey(Constants.isOnBoardingCompleted)) {
        return pref.getBool(Constants.isOnBoardingCompleted)!;
      }
      return false;
    } else {
      await pref.setBool(Constants.isOnBoardingCompleted, completed);
      return completed;
    }
  }

  @override
  Future<Locale> appLocale(Locale? locale) async {
    SharedPreferences pref = await preferences;
    if (locale == null) {
      if (pref.containsKey(Constants.appLocale)) {
        String locale = pref.getString(Constants.appLocale)!;
        for (Language lang in LocalesConstants.values) {
          if (lang.string == locale) return lang.locale;
        }
      }
      return LocalesConstants.en_US.locale;
    } else {
      await pref.setString(Constants.appLocale, locale.toString());
      return locale;
    }
  }

  @override
  Future<bool> isUserRegistered(bool? registered) async {
    SharedPreferences pref = await preferences;
    if (registered == null) {
      return pref.containsKey(Constants.isUserRegistered) ? pref.getBool(Constants.isUserRegistered)! : false;
    } else {
      await pref.setBool(Constants.isUserRegistered, registered);
      return registered;
    }
  }

  @override
  Future<String?> tokin(String? tokin) async {
    SharedPreferences pref = await preferences;
    if (tokin == null) {
      await pref.remove(Constants.userTokin);
      return pref.containsKey(Constants.userTokin) ? pref.getString(Constants.userTokin) : null;
    } else {
      await pref.setString(Constants.userTokin, tokin);
      return tokin;
    }
  }
}
