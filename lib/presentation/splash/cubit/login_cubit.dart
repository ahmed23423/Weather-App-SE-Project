// ignore_for_file: use_build_context_synchronously

import 'dart:async';

import 'package:bloc/bloc.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:weather_app_windows/domain/usecase/app_locale_usecase.dart';
import 'package:weather_app_windows/domain/usecase/app_theme_usecase.dart';
import 'package:weather_app_windows/presentation/resources/theme_manager.dart';
import 'package:weather_app_windows/presentation/splash/cubit/login_state.dart';


class LoginCubit extends Cubit<LoginState> implements LoginCycle {
  LoginCubit() : super(LoginInitial());

  @override
  Future<void> initialize(BuildContext context) async {
    await _initThemeMode(context);
    await _initLocalization(context);
    // await _initLoginTimer(context);
  }

  Future<void> _initThemeMode(BuildContext context) async {
    /// Handle Theme Mode
    ThemeMode appThemeMode = await AppThemeUseCase().execute(null);
    AppTheme.of(context)!.changeTheme(appThemeMode);
    if (kDebugMode) {
      print(appThemeMode);
    }
  }

  Future<void> _initLocalization(BuildContext context) async {
    /// Handle localization
    Locale locale = await AppLocaleUseCase().execute(null);
    AppTheme.of(context)!.changeLocale = locale;
    if (kDebugMode) {
      print(locale);
    }
  }

  // Future<void> _initLoginTimer(BuildContext context) async {
  //   Future.delayed(const Duration(seconds: ConstantsManager.LoginDelayInSeconds), () async => await _handleNavigation(context));
  // }

  // // Future<void> _handleNavigation(BuildContext context) async {
  // //   (await OnBoardingCompletedUseCase().execute(null)) ? /* OnBoarding Completed */
  // //     (await IsUserRegisteredUseCase().execute(null)) ? /* User Registered Completed */
  // //         _pushNamedAndRemoveUntil(context, AppRoutes.home)
  // //             :
  // //         _pushNamedAndRemoveUntil(context, AppRoutes.login)
  // //         :
  // //     _pushNamedAndRemoveUntil(context, AppRoutes.onBoarding);
  // // }
  // void _pushNamedAndRemoveUntil(BuildContext context, String viewName){
  //   Navigator.of(context).pushNamedAndRemoveUntil(viewName, (_) => false);
  // }

  @override
  Future<void> close() async {
    dispose();
    return super.close();
  }

  @override
  Future<void> dispose() async {
  }
}
