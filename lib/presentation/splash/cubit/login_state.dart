
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

abstract class LoginCycle extends LoginState {
  Future<void> initialize(BuildContext context);
  Future<void> dispose();
}

abstract class LoginState {}

class LoginInitial extends LoginState {
  LoginInitial() {
    if (kDebugMode) {
      print('Login-Initial');
    }

    /// Hide The Status Bar
    // SystemChrome.setEnabledSystemUIMode(SystemUiMode.manual, overlays: [SystemUiOverlay.bottom]);

    /// set backgorund of status bar to transparent
    SystemChrome.setSystemUIOverlayStyle(const SystemUiOverlayStyle(statusBarColor: Colors.transparent));
  }
}

class LoginClose extends LoginState {
  LoginClose();
}
