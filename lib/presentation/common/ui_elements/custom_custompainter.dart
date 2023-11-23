
import 'package:flutter/widgets.dart';

class NewCustomPainter extends CustomPainter {
  Function(Canvas canvas, Size size) show;
  Function(Canvas canvas, Size size) background;
  NewCustomPainter({required this.show, required this.background});

  @override
  void paint(Canvas canvas, Size size) {
    background(canvas, size);
    show(canvas, size);
  }

  @override
  bool shouldRepaint(covariant CustomPainter oldDelegate) => this != oldDelegate ? true : false;
}