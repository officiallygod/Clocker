import 'dart:math';

import 'package:flutter/material.dart';

class ClockPainterNew extends CustomPainter {
  var dateTime = DateTime.now(); // Current Date Time

  //60 Deg for 360secs
  //6 Deg for 1 sec

  @override
  void paint(Canvas canvas, Size size) {
    var centerX = size.width / 2; // Find the Horizontal Center of the Canvas
    var centerY = size.height / 2; // Find the Vertical Center of the Canvas
    var center = Offset(centerX, centerY); // Find the Center of the Canvas

    //Calculate Radius
    var radius = min(centerX, centerY);

    //Get the Main Brush SetUp
    var fillBrush = Paint()..color = Color(0xFFF8F9FC);

    //Get the Outline Brush SetUp
    var outlineBrush = Paint()
      ..color = Color(0xFFEEF1F9)
      ..strokeWidth = 2
      ..style = PaintingStyle.stroke;

    //Get the Dash Brush SetUp
    var dashBrush = Paint()..color = Color(0xFF6D6BFF);

    //Get the CenterDot Brush SetUp
    var centerDotBrush = Paint()
      ..shader = RadialGradient(colors: [Color(0xFF9495FD), Color(0xFF6563FF)])
          .createShader(Rect.fromCircle(center: center, radius: 10));

    // Second Hand Brush
    var secHandBrush = Paint()
      ..color = Colors.grey[300]
      ..strokeWidth = 2
      ..strokeCap = StrokeCap.round
      ..style = PaintingStyle.stroke;

    // Minute Hand Brush
    var minHandBrush = Paint()
      ..shader = RadialGradient(colors: [Color(0xFF9495FD), Color(0xFF6563FF)])
          .createShader(Rect.fromCircle(center: center, radius: radius - 40))
      ..strokeWidth = 5
      ..strokeCap = StrokeCap.round
      ..style = PaintingStyle.stroke;

    // Hour Hand Brush
    var hourHandBrush = Paint()
      ..shader = RadialGradient(colors: [Color(0xFF9495FD), Color(0xFF6563FF)])
          .createShader(Rect.fromCircle(center: center, radius: radius - 40))
      ..strokeWidth = 5
      ..strokeCap = StrokeCap.round
      ..style = PaintingStyle.stroke;

//    canvas.drawCircle(center, radius - 40, fillBrush);
//    canvas.drawCircle(center, radius - 40, outlineBrush);

    //Hour Hands Paint
    var hourHandX = centerX +
        80 * cos((dateTime.hour * 30 + dateTime.minute * 0.5) * pi / 180);
    var hourHandY = centerX +
        80 * sin((dateTime.hour * 30 + dateTime.minute * 0.5) * pi / 180);
    canvas.drawLine(center, Offset(hourHandX, hourHandY), hourHandBrush);

    //Minute Hands Paint
    var minHandX = centerX + 90 * cos(dateTime.minute * 6 * pi / 180);
    var minHandY = centerX + 90 * sin(dateTime.minute * 6 * pi / 180);
    canvas.drawLine(center, Offset(minHandX, minHandY), minHandBrush);

    //Second Hands Paint
    var secHandX = centerX + 110 * cos(dateTime.second * 6 * pi / 180);
    var secHandY = centerX + 110 * sin(dateTime.second * 6 * pi / 180);
    var secHandXOther = centerX - 20 * cos(dateTime.second * 6 * pi / 180);
    var secHandYOther = centerX - 20 * sin(dateTime.second * 6 * pi / 180);
    canvas.drawLine(Offset(secHandXOther, secHandYOther),
        Offset(secHandX, secHandY), secHandBrush);

    canvas.drawCircle(center, 5, centerDotBrush);

    //Dashes Outside
    var outerCircleRadius = radius - 14;
    var innerCircleRadius = radius - 16;

    for (double i = 0; i <= 360; i += 12) {
      var x1 = centerX + outerCircleRadius * cos(i * pi / 180);
      var y1 = centerX + outerCircleRadius * sin(i * pi / 180);

      var x2 = centerX + innerCircleRadius * cos(i * pi / 180);
      var y2 = centerX + innerCircleRadius * sin(i * pi / 180);

      canvas.drawLine(Offset(x1, y1), Offset(x2, y2), dashBrush);
    }
  }

  @override
  bool shouldRepaint(CustomPainter oldDelegate) {
    return true;
  }
}
