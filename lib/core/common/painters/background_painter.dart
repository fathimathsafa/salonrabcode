import 'package:flutter/material.dart';

class BackgroundPainter extends CustomPainter {
  final Color darkBlue;
  final Color mediumBlue;
  final Color lightBlue;
  final Color accentBlue;

  BackgroundPainter({
    required this.darkBlue,
    required this.mediumBlue,
    required this.lightBlue,
    required this.accentBlue,
  });

  @override
  void paint(Canvas canvas, Size size) {
    // Draw the background
    Paint backgroundPaint = Paint()..color = darkBlue;
    canvas.drawRect(
        Rect.fromLTWH(0, 0, size.width, size.height), backgroundPaint);

    // Draw the top right decoration
    Paint gradientPaint = Paint()
      ..shader = RadialGradient(
        colors: [
          accentBlue.withOpacity(0.3),
          accentBlue.withOpacity(0.1),
          darkBlue.withOpacity(0),
        ],
        stops: const [0.2, 0.6, 1.0],
      ).createShader(Rect.fromCircle(
        center: Offset(size.width * 0.9, size.height * 0.1),
        radius: size.width * 0.6,
      ));

    canvas.drawCircle(
      Offset(size.width * 0.9, size.height * 0.1),
      size.width * 0.6,
      gradientPaint,
    );

    // Draw the bottom left decoration
    Paint bottomGradientPaint = Paint()
      ..shader = RadialGradient(
        colors: [
          lightBlue.withOpacity(0.15),
          mediumBlue.withOpacity(0.05),
          darkBlue.withOpacity(0),
        ],
        stops: const [0.2, 0.6, 1.0],
      ).createShader(Rect.fromCircle(
        center: Offset(size.width * 0.1, size.height * 0.85),
        radius: size.width * 0.5,
      ));

    canvas.drawCircle(
      Offset(size.width * 0.1, size.height * 0.85),
      size.width * 0.5,
      bottomGradientPaint,
    );
  }

  @override
  bool shouldRepaint(covariant CustomPainter oldDelegate) => false;
}