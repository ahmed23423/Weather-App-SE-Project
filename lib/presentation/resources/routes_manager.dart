import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:weather_app_windows/presentation/home/cubit/cubit/home_cubit.dart';
import 'package:weather_app_windows/presentation/home/view/home_view.dart';
import 'package:weather_app_windows/presentation/splash/cubit/login_cubit.dart';
import 'package:weather_app_windows/presentation/splash/view/splash_view.dart';

class AppRoutes {
  static const String login = 'splash/';
  static const String home = 'home/';
}

class AppRoutesGenerator {
  static Route<dynamic> getRoute(RouteSettings settings) {
    switch (settings.name) {
      case AppRoutes.login:
        return MaterialPageRoute(
            builder: (_) => BlocProvider(
                  create: (context) => LoginCubit(),
                  child: const LoginView(),
                ),
            settings: settings);
      case AppRoutes.home:
        return MaterialPageRoute(
            builder: (_) => BlocProvider(
                  create: (context) => HomeCubit(),
                  child: const HomeView(),
                ),
            settings: settings);
      default:
        return MaterialPageRoute(
            builder: (_) => const Scaffold(
                  body: Text('None'),
                ));
    }
  }
}
