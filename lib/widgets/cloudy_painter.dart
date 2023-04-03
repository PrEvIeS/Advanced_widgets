import 'package:flutter/material.dart';
import 'dart:math' as math;

class CloudyPainter extends CustomPainter {
  final double cloudness;
  CloudyPainter(this.cloudness);

  void _drawSun(Canvas canvas, double opacity) {
    Paint sunPainter = Paint()
      ..color = Colors.yellow.withOpacity(opacity)
      ..style = PaintingStyle.fill;

    canvas.drawCircle(const Offset(0.5, 0.4), 0.2, sunPainter);
  }

  void _drawCloudy(Canvas canvas, double opacity) {
    Paint cloudPainter = Paint()
      ..style = PaintingStyle.fill
      ..strokeWidth = 0.02
      ..color = Colors.white.withOpacity(opacity);

    Path path = Path();
    path.moveTo(0.2, 0.6);
    path.cubicTo(0, 0.6, 0, 0.4, 0.2, 0.4);
    path.lineTo(0.25, 0.4);
    path.cubicTo(0.3, 0.4, 0.4, 0.2, 0.6, 0.4);
    path.lineTo(0.75, 0.4);
    path.cubicTo(1, 0.4, 0.9, 0.6, 0.7, 0.6);
    path.close();
    canvas.drawPath(path, cloudPainter);
  }

  void _drawRain(Canvas canvas, double opacity) {
    Paint cloudPainter = Paint()
      ..style = PaintingStyle.fill
      ..strokeWidth = 0.02
      ..color = Colors.grey.withOpacity(opacity);

    Path path = Path();
    path.moveTo(0.2, 0.6);
    path.cubicTo(0, 0.6, 0, 0.4, 0.2, 0.4);
    path.lineTo(0.25, 0.4);
    path.cubicTo(0.3, 0.4, 0.4, 0.2, 0.6, 0.4);
    path.lineTo(0.75, 0.4);
    path.cubicTo(1, 0.4, 0.9, 0.6, 0.7, 0.6);
    path.close();

    Paint rainPainter = Paint();
    rainPainter
      ..color = Colors.blue.withOpacity(opacity)
      ..style = PaintingStyle.fill
      ..strokeWidth = 0.02;

    canvas.drawPath(path, cloudPainter);
    canvas.drawLine(const Offset(0.3, 0.65), const Offset(0.2, 0.8), rainPainter);
    canvas.drawLine(const Offset(0.45, 0.65), const Offset(0.35, 0.8), rainPainter);
    canvas.drawLine(const Offset(0.6, 0.65), const Offset(0.5, 0.8), rainPainter);
  }

  double remap(double value, double min, double max, double newMin, double newMax) {
    double percent = (value - min) / (max - min);
    percent = math.min(1.0, math.max(0.0, percent));
    return newMin + (newMax - newMin) * percent;
  }

  @override
  void paint(Canvas canvas, Size size) {
    canvas.translate(0, -size.height * 0.15);
    canvas.scale(size.width, size.height * 1.85);
    _drawSun(canvas, remap(cloudness, 0.5, 1.0, 1.0, 0.0));
    _drawCloudy(canvas, remap(cloudness, 0.0, 0.5, 0.0, 1.0));
    _drawRain(canvas, remap(cloudness, 0.5, 1.0, 0.0, 1.0));
  }

  @override
  bool shouldRepaint(covariant CustomPainter oldDelegate) => true;
}
