import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';
import 'package:flutter_localizations/flutter_localizations.dart';
import 'package:weather_app_windows/app/constants_locale.dart';
import 'package:weather_app_windows/app/country_codes.dart';

class Constants {
  static const String weatherApiKey = '32b91933c56b32a4af1f26b65ae40a8b';
  static const String isOnBoardingCompleted = 'is-on-boarding-completed';
  static const String isDarkTheme = 'is-dark-theme';
  static const String appLocale = 'app-locale';
  static const String isUserRegistered = 'is-user-registered';
  static const String userTokin = 'user-tokin';
  static const Duration verificationTimeOut = Duration(minutes: 2);

  static const List<LocalizationsDelegate<dynamic>> localizationsDelegates = [
    AppLocalizations.delegate,
    GlobalMaterialLocalizations.delegate,
    GlobalWidgetsLocalizations.delegate,
    GlobalCupertinoLocalizations.delegate,
  ];

  static List<Locale> supportedLocales = [
    LocalesConstants.en_US.locale,
    LocalesConstants.ar_EG.locale,
  ];

  static List<String> countryCodesGroup = [...countryCodes.map((element) => '+${element['e164_cc']}')];

  static List<BlocProvider> providersGroup = [];
}
