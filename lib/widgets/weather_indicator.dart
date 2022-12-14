import 'package:flutter/material.dart';

class WeatherPainter extends CustomPainter {
  double value;

  WeatherPainter({required this.value});

  @override
  void paint(Canvas canvas, Size size) {
    canvas.scale(size.width, size.height);

    Paint painter = Paint()
      ..style = PaintingStyle.stroke
      ..strokeWidth = 0.02
      ..color = Colors.yellow;

    //canvas.drawCircle(Offset.zero, 50, painter);

    Path path = Path();
    path.moveTo(0.2, 0.6);
    path.cubicTo(
      0,
      0.6,
      0,
      0.4,
      0.2,
      0.4,
    );
    path.lineTo(0.4, 0.4);
    path.cubicTo(
      0.5,
      0.3,
      0.7,
      0.3,
      0.5,
      0.6,
    );
    path.close();
    canvas.drawPath(path, painter);
  }

  @override
  bool shouldRepaint(covariant CustomPainter oldDelegate) => true;
}

class WeatherIndicator extends StatelessWidget {
  final double opacity;

  const WeatherIndicator({super.key, required this.opacity});

  double _getDropsOpacity(double value) {
    if (value < 0.7) {
      return 0;
    }

    return 10 / 3 * value - 7 / 3;
  }

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Row(
          mainAxisAlignment: MainAxisAlignment.end,
          crossAxisAlignment: CrossAxisAlignment.end,
          children: [
            Container(
              width: 300,
              height: 300,
              color: Colors.red,
              child: CustomPaint(
                painter: WeatherPainter(value: 1),
              ),
            )
          ],
        )
      ],
    );
  }
}
