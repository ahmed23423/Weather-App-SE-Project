import 'dart:math';

import 'package:flutter/material.dart';

class ShimmerComponents {
  static Widget show({
    double? height,
    double? width,
    Duration duration = const Duration(seconds: 1),
    BoxShape? boxShape,
    required Color background,
    required Color animationColor,
    BorderRadius borderRadius = BorderRadius.zero,
    int? index,
    Widget? child
  })=> _ShimmerView(
    height: height,
    width: width,
    duration: duration,
    borderRadius: borderRadius,
    background: background,
    animationColor: animationColor,
    boxShape: boxShape,
    index: index,
    child: child,
  );
}


class _ShimmerView extends StatefulWidget {
  double? width ;
  double? height;
  Duration duration;
  BoxShape? boxShape;
  BorderRadius borderRadius;
  Color? background;
  Color? animationColor;
  int? index;
  Widget? child;
  _ShimmerView({
    required this.height,
    required this.width,
    required this.duration,
    required this.boxShape,
    this.background,
    this.animationColor,
    this.borderRadius = BorderRadius.zero,
    this.index,
    this.child
  });

  @override
  State<_ShimmerView> createState() => _ShimmerViewState();
}

class _ShimmerViewState extends State<_ShimmerView> with SingleTickerProviderStateMixin{
  late AnimationController _animationController;
  late Animation<double> _curvedAnimation;

  @override
  void initState() {
    _animationController = AnimationController(vsync: this, duration: widget.duration);
    _curvedAnimation = Tween<double>(begin: -1, end: 1).animate(CurvedAnimation(parent: _animationController, curve: Curves.easeInBack));
    // _animationController.repeat();
    super.initState();
  }

  @override
  void dispose() {
    _animationController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Transform.rotate(
      angle: (0 * pi/180),
      child: LayoutBuilder(
        builder: (context, size) {
          return AnimatedBuilder(
            animation: _curvedAnimation,
              builder: (_,w){
                return Container(
                  key: widget.key,
                  clipBehavior: Clip.none,
                  width: widget.width,
                  height: widget.height,
                  decoration: BoxDecoration(
                    shape: widget.boxShape ?? BoxShape.rectangle,
                    borderRadius: widget.boxShape == null ? widget.borderRadius : null,
                    gradient: LinearGradient(
                      // begin: Alignment.topCenter,
                      // end: Alignment.bottomCenter,
                      transform: MyGradientTranslate((_curvedAnimation.value * size.maxWidth).toDouble(),),
                      colors: [
                        widget.background!,
                        widget.animationColor!,
                        widget.background!,
                      ]
                    )
                  ),
                  child: widget.child,
                );
              });
        }
      ),
    );
  }
}


class MyGradientTranslate extends GradientTransform{
  double x;
  double y;
  double z;
  MyGradientTranslate(
      this.x,
      [
        this.y = 0.0,
        this.z = 0.0,

      ]);
  @override
  Matrix4? transform(Rect bounds, {TextDirection? textDirection}) {

    return Matrix4
        .translationValues(x, y, z);
  }

}

abstract class DisposeAnimation{
  void dispose();
}
