import 'package:advanced_widgets/widgets/cloudy_painter.dart';
import 'package:flutter/material.dart';

class WeatherIndicator extends StatelessWidget {
  final double cloudness;
  final VoidCallback onTap;
  final bool isExpanded;

  const WeatherIndicator({
    super.key,
    required this.cloudness,
    required this.onTap,
    required this.isExpanded,
  });

  static const List<String> textList = [
    'Ясно. +12',
    'Облачно с прояснениями. +2',
    'Дождь. -2',
  ];

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onTap,
      child: Column(
        mainAxisSize: MainAxisSize.max,
        children: [
          AspectRatio(
            aspectRatio: 1.7,
            child: CustomPaint(
              painter: CloudyPainter(cloudness),
            ),
          ),
          AnimatedCrossFade(
            firstChild: Container(
              height: 0,
            ),
            secondChild: Text(
              textList[(cloudness * 2).floor()],
              style: const TextStyle(fontSize: 32),
            ),
            crossFadeState: isExpanded
                ? CrossFadeState.showSecond
                : CrossFadeState.showFirst,
            duration: const Duration(seconds: 1),
          ),
        ],
      ),
    );
  }
}
