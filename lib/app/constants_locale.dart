import 'package:flutter/material.dart';

class Language {
  Locale locale;
  final String string;
  String cuntryName;
  String languageName;
  Language(this.cuntryName, this.languageName, this.locale, this.string);
}

class LocalesConstants {
  static Language en_US = Language('United State', 'English', const Locale('en', 'US'), 'en_US');
  static Language ar_EG = Language('Egypt', 'Arabic', const Locale('ar', 'EG'), 'ar_EG');
  static List<Language> get values => [en_US,ar_EG];
}
