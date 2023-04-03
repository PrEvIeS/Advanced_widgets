import 'package:flutter/material.dart';

class RainPainter extends CustomPainter {
  RainPainter();

  @override
  void paint(Canvas canvas, Size size) {
    canvas.scale(size.width, size.height);

    Paint cloudPainter = Paint()
      ..style = PaintingStyle.fill
      ..strokeWidth = 0.02
      ..color = Colors.grey;

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
      ..color = Colors.blue
      ..style = PaintingStyle.fill
      ..strokeWidth = 0.02;
    canvas.drawPath(path, cloudPainter);
    canvas.drawLine(Offset(0.3, 0.65), Offset(0.2, 0.8), rainPainter);
    canvas.drawLine(Offset(0.45, 0.65), Offset(0.35, 0.8), rainPainter);
    canvas.drawLine(Offset(0.6, 0.65), Offset(0.5, 0.8), rainPainter);
  }

  @override
  bool shouldRepaint(covariant CustomPainter oldDelegate) => true;
}
