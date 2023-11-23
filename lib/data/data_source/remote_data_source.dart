import 'package:flutter/material.dart';
import 'package:weather_app_windows/app/app_pref.dart';
import 'package:weather_app_windows/data/request/request.dart';

import '../network/app_api/app_api.dart';
import '../response/response.dart';

/// in Remote Data Source i can do save for sql when get response from api XXXXXXXXXX
abstract class RemoteDataSource {
  Future<ThemeMode> appTheme(ThemeMode? appThemeMode);
  Future<Locale> appLocale(Locale? locale);
  Future<bool> isUserRegistered(bool? registered);
  Future<String> signUp({required CompleteSignUpRequest completeSignUpRequest});
  Future<String> login({required LoginDetailsRequest loginDetailsRequest});
}

class RemoteDataSourceImpl implements RemoteDataSource {

  @override
  Future<Locale> appLocale(Locale? locale) {
    AppPreferencesImpl appPreferencesImpl = AppPreferencesImpl();
    return appPreferencesImpl.appLocale(locale);
  }

  @override
  Future<ThemeMode> appTheme(ThemeMode? appThemeMode) {
    AppPreferencesImpl appPreferencesImpl = AppPreferencesImpl();
    return appPreferencesImpl.appTheme(appThemeMode);
  }
  @override
  Future<bool> isUserRegistered(bool? registered) {
    AppPreferencesImpl appPreferencesImpl = AppPreferencesImpl();
    return appPreferencesImpl.isUserRegistered(registered);
  }


  @override
  Future<String> signUp({required CompleteSignUpRequest completeSignUpRequest}) async{
   return AppServicesClientImpl().signUp(completeSignUpRequest: completeSignUpRequest);
  }

  @override
  Future<String> login({required LoginDetailsRequest loginDetailsRequest}) {
    return AppServicesClientImpl().login(loginDetailsRequest: loginDetailsRequest);
  }
}
