import 'dart:async';
import 'dart:math';

import 'package:flutter/material.dart';
import 'package:flutter/scheduler.dart';

import '../ui_elements/custom_custompainter.dart';

class AnimatedStickTaps extends StatefulWidget {
  Widget child;
  double borderRadius;
  Size size;
  Color stickColor;
  double stickWidth;
  int tapsCount;
  int currentTap;
  AnimatedStickTaps({
    super.key,
    required this.child,
    required this.size,
    required this.tapsCount,
    required this.currentTap,
    this.borderRadius = 20,
    this.stickColor = Colors.white,
    this.stickWidth = 40
  });

  @override
  State<AnimatedStickTaps> createState() => _AnimatedStickTapsState();
}

class _AnimatedStickTapsState extends State<AnimatedStickTaps> with TickerProviderStateMixin {
  late double borderRadius;
  late Size size;
  late Random random;
  late AnimationController animationController;
  late Animation<double> curvedAnimation;
  double width = 0;

  @override
  void initState() {
    borderRadius = widget.borderRadius;
    size = widget.size;
    animationController = AnimationController(vsync: this,duration: const Duration(milliseconds: 200));
    curvedAnimation = CurvedAnimation(parent: animationController, curve: Curves.linear);
    animationController.repeat();
    curvedAnimation.addListener(() {
      setState(() {
        width += 5.5;
      });
    });
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: widget.size.width,
      height: widget.size.height,
      child: LayoutBuilder(
        builder: (context, theSize) {
          size = Size(theSize.maxWidth, theSize.maxHeight);
          return CustomPaint(
            foregroundPainter: NewCustomPainter(
              background: (canvas, size) {},
              show: (canvas, size) {
                borderRadius = borderRadius.maxRadius(size);

                Paint paint_0 = Paint()
                  ..style = PaintingStyle.stroke
                  ..strokeCap = StrokeCap.round
                  ..color = Colors.transparent
                  ..strokeJoin = StrokeJoin.round
                  ..strokeWidth = 5;

                Path path_0 = Path();

                path_0.moveTo(0, borderRadius);
                // Top Left Corner
                path_0.quadraticBezierTo(0, 0, borderRadius, 0);

                path_0.lineTo(size.width - borderRadius, 0);
                // Top Right Corner
                path_0.quadraticBezierTo(size.width, 0, size.width, borderRadius);

                path_0.lineTo(size.width, size.height - borderRadius);
                // Bottom Right Corner
                path_0.quadraticBezierTo(size.width, size.height, size.width - borderRadius, size.height);

                path_0.lineTo(borderRadius, size.height);
                // Bottom Left Corner
                path_0.quadraticBezierTo(0, size.height, 0, size.height- borderRadius);

                path_0.close();

                canvas.drawPath(path_0, paint_0);

                Paint paint_1 = paint_0..color = widget.stickColor;

                double stickWidth = (path_0.computeMetrics().single.length / 2) / widget.tapsCount;
                double startPosition =  (widget.currentTap * stickWidth);
                double endPosition = (startPosition + stickWidth);

                canvas.drawPath(path_0.computeMetrics().single.extractPath(startPosition, endPosition), paint_1);

                // if((width - path_0.computeMetrics().single.length) >= 100){
                //   width = 100;
                // }
                // if(width > path_0.computeMetrics().single.length){
                //   Path path_1 = Path();
                //   path_1.addPath(path_0.computeMetrics().single.extractPath((width - path_0.computeMetrics().single.length) - 100, width - path_0.computeMetrics().single.length), Offset.zero);
                //   path_1.addPath(path_0.computeMetrics().single.extractPath(
                //       path_0.computeMetrics().single.length - ((width - path_0.computeMetrics().single.length) -100).abs(),
                //       path_0.computeMetrics().single.length), Offset.zero);
                //   canvas.drawPath(path_1, paint_1);
                // }else{
                //   canvas.drawPath(path_0.computeMetrics().single.extractPath(width - 100, width), paint_1);
                // }

              },
            ),
            size: size,
            child: widget.child,
          );
        }
      ),
    );
  }
}

abstract class _CustomTicker extends TickerProvider {
  @override
  Ticker createTicker(TickerCallback onTick) {
    return Ticker(onTick);
  }
}

class FrameRate extends _CustomTicker {
  Function(int frameRate, int actulyFrameRate, Duration elapsed) onTicke;
  int? _customRate;
  int _frameCount = 0;
  bool isRegular = true;
  Ticker? _ticker;
  Timer? _timer;
  Duration _timerElapsed = Duration.zero;
  int get currentFrameRate => _customRate ?? 60;

  FrameRate({int? frameRate, required this.onTicke}){
    if (frameRate != null) {
      // custom frame rate
      _customRate = frameRate;
      isRegular = false;
    } else {
      // regular frame rate
    }
  }

  void start() {
    if (isRegular) {
      _ticker = createTicker((elapsed) {
        _frameCount++;
        double secondsFraction = elapsed.inMilliseconds / 1000.0;
        int frameRate = secondsFraction > 0 ? (_frameCount / secondsFraction).round() : 0;
        onTicke(frameRate, currentFrameRate, elapsed);
      });
      _ticker!.start();
    } else {
      Duration desiredTime = Duration(milliseconds: (1000.0 / currentFrameRate).floor());
      print(desiredTime);
      _timer = Timer.periodic(desiredTime, (_) {
        _frameCount++;
        double secondsFraction = _timerElapsed.inMilliseconds / 1000.0;
        int frameRate = secondsFraction > 0 ? (_frameCount / secondsFraction).round() : 0;
        onTicke(frameRate, currentFrameRate, _timerElapsed);
        _timerElapsed += desiredTime;
      });
    }
  }

  void stop() {
    _frameCount = 0;
    if (isRegular) {
      _ticker!.stop();
    } else {
      _timer!.cancel();
      _timerElapsed = Duration.zero;
    }
  }
}

extension _ on double {
  double maxRadius(Size buttonSize){
    double longSide = buttonSize.shortestSide / 2;
    if(this > longSide) {
      return longSide;
    } else {
      return this;
    }
  }
}