import 'package:flutter/material.dart';

class SunPainter extends CustomPainter {
  SunPainter();

  @override
  void paint(Canvas canvas, Size size) {
    canvas.scale(size.width, size.height);

    Paint sunPainter = Paint()
      ..color = Colors.yellow
      ..style = PaintingStyle.fill;

    canvas.drawCircle(const Offset(0.5, 0.4), 0.2, sunPainter);
  }

  @override
  bool shouldRepaint(covariant CustomPainter oldDelegate) => true;
}
