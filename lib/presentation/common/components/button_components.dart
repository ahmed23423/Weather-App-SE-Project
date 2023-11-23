import 'package:flutter/material.dart';
import 'package:weather_app_windows/presentation/resources/color_manager.dart';
import 'package:weather_app_windows/presentation/resources/values_manager.dart';

class ButtonComponents {
  static Widget animatedTextButton({
    required Widget child,
    required Function()? onTap,
    Size? fixedSize,
    double? borderRadius,
    Color? backgroundColor,
    BoxShadow? boxShadow,
    int? durationInMilliseconds,
    Color? splashColor,
    Gradient? gradient,
    EdgeInsets? padding,
    AlignmentGeometry alignmentGeometry = Alignment.center,
    Curve curve = Curves.linear,
    DecorationImage? imageBackground,
    BoxBorder? border
  }) =>
      AnimatedContainer(
        width: fixedSize?.width,
        height: fixedSize?.height,
        clipBehavior: Clip.antiAliasWithSaveLayer,
        alignment: alignmentGeometry,
        curve: curve,
        decoration: BoxDecoration(
          image: imageBackground,
            borderRadius: BorderRadius.circular(borderRadius ?? 0),
            color: backgroundColor,
            gradient: gradient,
            border: border,
            boxShadow: boxShadow != null ? [ boxShadow ] : null),
        duration: Duration(milliseconds: durationInMilliseconds ?? 0),
        child: Stack(
          children: [
            Padding(
              padding: padding ?? EdgeInsets.zero,
              child: Align(alignment: alignmentGeometry, child: child),
            ),
            Material(
              color: ColorManager.transparent,
              child: InkWell(
                onTap: onTap,
                splashColor: splashColor,
                child: Padding(
                  padding: padding ?? EdgeInsets.zero,
                    child: const SizedBox.expand(child: SizedBox())),
              ),
            ),
          ],
        ),
      );

  static Widget CustomTextButton(BuildContext context,bool isLoading, String label, Function() onPressed){
    return ElevatedButton(
        style: Theme.of(context).textButtonTheme.style!.copyWith(
            minimumSize: MaterialStatePropertyAll(Size(double.infinity, AppSize.dynamicSize(10))),
            shape: MaterialStatePropertyAll(RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(BorderRadiusSize.dynamicSize(5))
            ))
        ),
        onPressed: isLoading ? null : onPressed,
        child: isLoading ?
        Center(
          child: CircularProgressIndicator(
            color: Theme.of(context).textButtonTheme.style!.textStyle!.resolve({})!.color,
          ),
        )
            : Text(label, style: Theme.of(context).textButtonTheme.style!.textStyle!.resolve({}),)
    );
  }
}
