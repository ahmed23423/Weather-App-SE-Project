import 'package:flutter/material.dart';
import 'package:weather_app_windows/presentation/resources/color_manager.dart';
import 'package:weather_app_windows/presentation/resources/values_manager.dart';

class TextStyleManager {
  static TextStyle displayLarge({bool isDark = false, bool switchColor = false}) => TextStyle(
      fontSize: FontSize.dynamicSize(13),
      height: AppSize.textStyleHeight_1_2,
      fontWeight: FontWeight.w600,
      color: isDark || (isDark || switchColor) ? ColorManager.white : ColorManager.black);

  static TextStyle displayMedium({bool isDark = false, bool switchColor = false}) => TextStyle(
      fontSize: FontSize.dynamicSize(8),
      height: AppSize.textStyleHeight_1_2,
      color: (isDark || (isDark || switchColor) ? ColorManager.white : ColorManager.black));

  static TextStyle labelLarge({bool isDark = false, bool switchColor = false}) =>
      TextStyle(fontSize: FontSize.dynamicSize(10), color: (isDark || (isDark || switchColor) ? ColorManager.white : ColorManager.black));

  static TextStyle labelMedium({bool isDark = false, bool switchColor = false}) =>
      TextStyle(fontSize: FontSize.dynamicSize(8), color: (isDark || (isDark || switchColor) ? ColorManager.white : ColorManager.black));

  static TextStyle labelSmall({bool isDark = false, bool switchColor = false}) =>
      TextStyle(fontSize: FontSize.dynamicSize(6), color: (isDark || (isDark || switchColor) ? ColorManager.white : ColorManager.black));

  static TextStyle specific({double? fontSize, bool isDark = false, bool switchColor = false}) => TextStyle(
      fontSize: fontSize, color: (isDark || (isDark || switchColor) ? ColorManager.white : ColorManager.black));

  static TextStyle textButton({bool isDark = false, bool switchColor = false}) => labelMedium(isDark: isDark, switchColor: switchColor);

  static TextStyle snakBarTextStyle({double? fontSize, bool isDark = false, bool switchColor = false}) => TextStyle(
      fontSize: fontSize, color: (isDark || (isDark || switchColor) ? ColorManager.primaryHavyBrown : ColorManager.white));

}
