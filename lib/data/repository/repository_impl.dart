
import 'package:dartz/dartz.dart';
import 'package:flutter/material.dart';
import 'package:weather_app_windows/app/extensions.dart';
import 'package:weather_app_windows/data/data_source/remote_data_source.dart';
import 'package:weather_app_windows/data/network/error_handler.dart';
import 'package:weather_app_windows/data/network/failure.dart';
import 'package:weather_app_windows/domain/repository/repository.dart';

import '../network/network_info.dart';
import '../request/request.dart';


class RepositoryImpl implements Repository {
  @override
  Future<Locale> appLocale(Locale? locale) {
    RemoteDataSourceImpl remoteDataSourceImpl = RemoteDataSourceImpl();
    return remoteDataSourceImpl.appLocale(locale);
  }

  @override
  Future<ThemeMode> appTheme(ThemeMode? themeMode) async {
    RemoteDataSourceImpl remoteDataSourceImpl = RemoteDataSourceImpl();
    return remoteDataSourceImpl.appTheme(themeMode);
  }

  @override
  Future<bool> isUserRegistered(bool? registered) {
    RemoteDataSourceImpl remoteDataSourceImpl = RemoteDataSourceImpl();
    return remoteDataSourceImpl.isUserRegistered(registered);
  }
  @override
  Future<Either<Failure, String>> signUp({required CompleteSignUpRequest completeSignUpRequest}) async{
    if (await NetWorkInfoImpl().isConnected) {
      try {
        // the user have connection to the internet
        String token = await RemoteDataSourceImpl().signUp(completeSignUpRequest: completeSignUpRequest);
        await RemoteDataSourceImpl().isUserRegistered(true);
        return Right(token);
      } catch (error) {
        return Left(ErrorHandler.handle(error).failure);
      }
    } else {
      // no connection to the internet
      return Left(ResponseMessage.NO_INTERNET_CONNECTION.getFailure());
    }
  }

  @override
  Future<Either<Failure, String>> login({required LoginDetailsRequest loginDetailsRequest}) async{
    if (await NetWorkInfoImpl().isConnected) {
      try {
        // the user have connection to the internet
        String token = await RemoteDataSourceImpl().login(loginDetailsRequest: loginDetailsRequest);
        await RemoteDataSourceImpl().isUserRegistered(true);
        return Right(token);
      } catch (error) {
        return Left(ErrorHandler.handle(error).failure);
      }
    } else {
      // no connection to the internet
      return Left(ResponseMessage.NO_INTERNET_CONNECTION.getFailure());
    }
  }
}
