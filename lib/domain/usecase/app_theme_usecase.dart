import 'package:flutter/material.dart';
import 'package:weather_app_windows/data/repository/repository_impl.dart';
import 'package:weather_app_windows/domain/usecase/base_usecase.dart';

class AppThemeUseCase implements BaseUseCaseOne<ThemeMode?,ThemeMode> {
  @override
  Future<ThemeMode> execute(ThemeMode? themeMode) {
    RepositoryImpl repositoryImpl = RepositoryImpl();
    return repositoryImpl.appTheme(themeMode);
  }
}
