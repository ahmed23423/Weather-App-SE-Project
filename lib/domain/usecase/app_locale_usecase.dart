import 'package:flutter/material.dart';
import 'package:weather_app_windows/data/repository/repository_impl.dart';
import 'package:weather_app_windows/domain/usecase/base_usecase.dart';

class AppLocaleUseCase implements BaseUseCaseOne<Locale?, Locale> {
  @override
  Future<Locale> execute(Locale? input) {
    RepositoryImpl repositoryImpl = RepositoryImpl();
    return repositoryImpl.appLocale(input);
  }
}
