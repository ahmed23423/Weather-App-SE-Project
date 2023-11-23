import 'package:dartz/dartz.dart';
import 'package:flutter/material.dart';

import '../../data/network/failure.dart';
import '../../data/request/request.dart';
import '../../data/response/response.dart';
import '../models/models.dart';

abstract class Repository {
  Future<ThemeMode> appTheme(ThemeMode? appThemeMode);
  Future<Locale> appLocale(Locale? locale);
  Future<bool> isUserRegistered(bool? registered);
  Future<Either<Failure, String>> signUp({required CompleteSignUpRequest completeSignUpRequest});
  Future<Either<Failure, String>> login({required LoginDetailsRequest loginDetailsRequest});
}
