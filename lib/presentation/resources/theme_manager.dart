import 'package:flutter/material.dart';
import 'package:weather_app_windows/app/app.dart';
import 'package:weather_app_windows/presentation/resources/buttonStyle_manager.dart';
import 'package:weather_app_windows/presentation/resources/color_manager.dart';
import 'package:weather_app_windows/presentation/resources/font_manager.dart';
import 'package:weather_app_windows/presentation/resources/textStyle_manager.dart';
import 'package:weather_app_windows/presentation/resources/values_manager.dart';

class AppTheme {
  static ThemeData get lightTheme => ThemeData(
      useMaterial3: true,
      scaffoldBackgroundColor: ColorManager.whiteGray,
      colorScheme: const ColorScheme.light(
        primary: ColorManager.white,
        inversePrimary: ColorManager.primaryHavyBrown
      ),
      fontFamily: FontManager.cairo,
      textTheme: TextTheme(
          displayLarge: TextStyleManager.displayLarge(),
          displayMedium: TextStyleManager.displayMedium(),
          labelLarge: TextStyleManager.labelLarge(),
          labelMedium: TextStyleManager.labelMedium(),
          labelSmall:  TextStyleManager.labelSmall()),
      textButtonTheme: TextButtonThemeData(
          style: ButtonStyleManager.textButton(ColorManager.primaryHavyBrown,
              ColorManager.white.withOpacity(OpacitySize.o20), BorderRadiusSize.dynamicSize(9999),forgroundColor: ColorManager.white,textStyle: TextStyleManager.textButton(switchColor: true))),
      iconButtonTheme: IconButtonThemeData(
          style: ButtonStyleManager.textButton(ColorManager.primaryHavyBrown,
              ColorManager.white.withOpacity(OpacitySize.o30), BorderRadiusSize.dynamicSize(9999),forgroundColor: ColorManager.white)),
  progressIndicatorTheme: const ProgressIndicatorThemeData(color: ColorManager.black),
    iconTheme: IconThemeData(color: ColorManager.black,size: AppSize.dynamicSize(5)),
    textSelectionTheme: TextSelectionThemeData(
      cursorColor: ColorManager.black,
      selectionColor: ColorManager.black.withOpacity(OpacitySize.o15),
      selectionHandleColor: ColorManager.black
    ),
    snackBarTheme: SnackBarThemeData(
      backgroundColor: ColorManager.primaryHavyBrown,
      contentTextStyle: TextStyleManager.snakBarTextStyle(fontSize: FontSize.dynamicSize(8)),
        elevation: ElevationSize.e10,
    ),
  );

  static ThemeData get darkTheme => ThemeData(
      useMaterial3: true,
      colorScheme: const ColorScheme.dark(
          primary: ColorManager.primaryHavyBrown,
          inversePrimary: ColorManager.white
      ),
      scaffoldBackgroundColor: ColorManager.primaryHavyBrown,
      fontFamily: FontManager.cairo,
      textTheme: TextTheme(
          displayLarge: TextStyleManager.displayLarge(isDark: true),
          displayMedium: TextStyleManager.displayMedium(isDark: true),
          labelLarge: TextStyleManager.labelLarge(isDark: true),
          labelMedium: TextStyleManager.labelMedium(isDark: true),
          labelSmall:  TextStyleManager.labelSmall(isDark: true)),
      iconButtonTheme: IconButtonThemeData(
          style: ButtonStyleManager.textButton(ColorManager.white,
              ColorManager.primaryHavyBrown.withOpacity(OpacitySize.o10), BorderRadiusSize.dynamicSize(9999),forgroundColor: ColorManager.black)),
      textButtonTheme: TextButtonThemeData(
          style: ButtonStyleManager.textButton(ColorManager.white,
              ColorManager.primaryHavyBrown.withOpacity(OpacitySize.o30), BorderRadiusSize.dynamicSize(9999),forgroundColor: ColorManager.primaryHavyBrown,textStyle: TextStyleManager.textButton(isDark: true, switchColor: true))),
      progressIndicatorTheme: const ProgressIndicatorThemeData(color: ColorManager.white),
      iconTheme: IconThemeData(color: ColorManager.white,size: AppSize.dynamicSize(5)),
      textSelectionTheme: TextSelectionThemeData(
          cursorColor: ColorManager.white,
          selectionColor: ColorManager.white.withOpacity(OpacitySize.o15),
          selectionHandleColor: ColorManager.white
      ),
      snackBarTheme: SnackBarThemeData(
          backgroundColor: ColorManager.white,
          contentTextStyle: TextStyleManager.snakBarTextStyle(fontSize: FontSize.dynamicSize(8), isDark: true),
        elevation: ElevationSize.e10
      )
  );

  static MyAppState? of(BuildContext context) => context.findAncestorStateOfType<MyAppState>();
}
