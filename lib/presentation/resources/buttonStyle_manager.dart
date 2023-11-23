import 'package:flutter/material.dart';

class ButtonStyleManager {
  static ButtonStyle textButton(
    Color backgroundColor,
    Color overlayColor,
    double borderRadius, {
    Color? forgroundColor,
    Size? fixedSize,
    Size? minimumSize,
    Size? maximumSize,
    TextStyle? textStyle,
  }) =>
      ButtonStyle(
          minimumSize: MaterialStatePropertyAll(minimumSize),
          maximumSize: MaterialStatePropertyAll(maximumSize),
          foregroundColor: MaterialStatePropertyAll(forgroundColor),
          fixedSize: MaterialStatePropertyAll(fixedSize),
          textStyle: MaterialStatePropertyAll(textStyle),
          backgroundColor: MaterialStatePropertyAll(backgroundColor),
          overlayColor: MaterialStatePropertyAll(overlayColor),
          shape: MaterialStatePropertyAll(RoundedRectangleBorder(borderRadius: BorderRadius.circular(borderRadius))));

  static themeCopyWith(
    BuildContext context, {
    TextStyle? textStyle,
    Color? backgroundColor,
    Color? foregroundColor,
    Color? overlayColor,
    Color? shadowColor,
    Color? surfaceTintColor,
    double? elevation,
    EdgeInsetsGeometry? padding,
    Size? minimumSize,
    Size? fixedSize,
    Size? maximumSize,
    Color? iconColor,
    double? iconSize,
    BorderSide? side,
    OutlinedBorder? shape,
    MouseCursor? mouseCursor,
    VisualDensity? visualDensity,
    MaterialTapTargetSize? tapTargetSize,
    Duration? animationDuration,
    bool? enableFeedback,
    AlignmentGeometry? alignment,
    InteractiveInkFeatureFactory? splashFactory,
  }) =>
      Theme.of(context).textButtonTheme.style!.copyWith(
            textStyle: MaterialStatePropertyAll(textStyle),
            backgroundColor: MaterialStatePropertyAll(backgroundColor),
            foregroundColor: MaterialStatePropertyAll(foregroundColor),
            overlayColor: MaterialStatePropertyAll(overlayColor),
            shadowColor: MaterialStatePropertyAll(shadowColor),
            surfaceTintColor: MaterialStatePropertyAll(surfaceTintColor),
            elevation: MaterialStatePropertyAll(elevation),
            padding: MaterialStatePropertyAll(padding),
            minimumSize: MaterialStatePropertyAll(minimumSize),
            fixedSize: MaterialStatePropertyAll(fixedSize),
            maximumSize: MaterialStatePropertyAll(maximumSize),
            iconColor: MaterialStatePropertyAll(iconColor),
            iconSize: MaterialStatePropertyAll(iconSize),
            side: MaterialStatePropertyAll(side),
            shape: MaterialStatePropertyAll(shape),
            mouseCursor: MaterialStatePropertyAll(mouseCursor),
            visualDensity: visualDensity,
            tapTargetSize: tapTargetSize,
            animationDuration: animationDuration,
            enableFeedback: enableFeedback,
            alignment: alignment,
            splashFactory: splashFactory,
          );
}
