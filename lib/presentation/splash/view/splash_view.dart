import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:weather_app_windows/presentation/resources/color_manager.dart';
import 'package:weather_app_windows/presentation/splash/cubit/login_cubit.dart';

class LoginView extends StatefulWidget {
  const LoginView({super.key});

  @override
  State<LoginView> createState() => _LoginViewState();
}

class _LoginViewState extends State<LoginView> {
  late LoginCubit loginCubit;

  @override
  void initState() {
    loginCubit = BlocProvider.of<LoginCubit>(context)..initialize(context);
    super.initState();
  }

  @override
  void dispose() {
    loginCubit.close();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return const Scaffold(
      backgroundColor: ColorManager.transparent,
      body: SafeArea(
          child: Center(
              child: Text('Splash Screen')
            )
        ),
    );
  }
}
