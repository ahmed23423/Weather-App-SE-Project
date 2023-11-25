import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:weather_app_windows/presentation/home/cubit/cubit/home_cubit.dart';
import 'package:weather_app_windows/presentation/home/view/home_view.dart';
import 'package:weather_app_windows/presentation/login/view/login_view.dart';
import 'package:weather_app_windows/presentation/signUp/view/signUp_view.dart';

class AppRoutes {
  static const String home = 'home/';
  static const String login = 'login/';
  static const String signUp = 'signUp/';
}

class AppRoutesGenerator {
  static Route<dynamic> getRoute(RouteSettings settings) {
    switch (settings.name) {
      case AppRoutes.login:
        return MaterialPageRoute(
            builder: (_) => const LoginView(),
            settings: settings);
      case AppRoutes.home:
        return MaterialPageRoute(
            builder: (_) => BlocProvider(
                  create: (context) => HomeCubit(),
                  child: const HomeView(),
                ),
            settings: settings);
      case AppRoutes.signUp:
        return MaterialPageRoute(
            builder: (_) => const SignUpView(),
            settings: settings);
      default:
        return MaterialPageRoute(
            builder: (_) => const Scaffold(
                  body: Text('None'),
                ));
    }
  }
}
