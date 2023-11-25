import 'package:flutter/material.dart';
import 'package:flutter_acrylic/window.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:weather_app_windows/app/app.dart';
import 'package:window_manager/window_manager.dart';

void main() async {
  await _appInitializing();
  runApp(MyApp());
}

Future<void> _appInitializing() async {
  GoogleFonts.config.allowRuntimeFetching = true;
  _someConfigurations();
  await Window.initialize();
  await _firebaseInitializing();
  await initWindow();
}

Future<void> _firebaseInitializing() async {
  // await Firebase.initializeApp(
  //   options: DefaultFirebaseOptions.currentPlatform,
  // );
}

void _someConfigurations() {
  WidgetsFlutterBinding.ensureInitialized();
}

Future<void> initWindow() async {
  await windowManager.ensureInitialized();
  await windowManager.setTitle('ClearSky');
  // await windowManager.setMaximumSize(Size(Constants.windowSize.width, windowHeight));
  // await windowManager.setMinimumSize(const Size(1024, 700));
  await windowManager.setSize(Size(550, 550));
  await windowManager.setResizable(false);
  await windowManager.setHasShadow(false);
  await windowManager.setAlignment(Alignment.center);
  // await windowManager.setBackgroundColor(ColorManager.transparent);
  // await windowManager.setOpacity(1);
  // await windowManager.setTitleBarStyle(TitleBarStyle.normal);
  // await windowManager.setBackgroundColor(Colors.black);
  // await windowManager.setSkipTaskbar(true);
  // await windowManager.setAlwaysOnTop(true);
  // await windowManager.setMaximizable(false);
  await windowManager.focus();
  await windowManager.show();
  // windowsPosition = (await windowManager.getPosition());
}

//
// await windowManager.ensureInitialized();
// await windowManager.setTitle('ClearSky');
// // await windowManager.setMaximumSize(Size(Constants.windowSize.width, windowHeight));
// await windowManager.setMinimumSize(const Size(1024, 700));
// // await windowManager.setSize(Size(500, 500));
// // await windowManager.setResizable(false);
// await windowManager.setHasShadow(false);
// await windowManager.setAlignment(Alignment.center);
// // await windowManager.setBackgroundColor(ColorManager.transparent);
// // await windowManager.setOpacity(1);
// // await windowManager.setTitleBarStyle(TitleBarStyle.normal);
// // await windowManager.setBackgroundColor(Colors.black);
// // await windowManager.setSkipTaskbar(true);
// // await windowManager.setAlwaysOnTop(true);
// // await windowManager.setMaximizable(false);
// await windowManager.focus();
// await windowManager.show();
// // windowsPosition = (await windowManager.getPosition());