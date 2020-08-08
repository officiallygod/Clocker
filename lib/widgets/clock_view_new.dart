import 'dart:async';
import 'dart:math';

import 'package:clocker/widgets/clock_painter_new.dart';
import 'package:flutter/material.dart';

class ClockViewNew extends StatefulWidget {
  @override
  _ClockViewNewState createState() => _ClockViewNewState();
}

class _ClockViewNewState extends State<ClockViewNew> {
  @override
  void initState() {
    Timer.periodic(
      Duration(seconds: 1),
      (timer) {
        setState(
          () {},
        );
      },
    );
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    final mediaQuery = MediaQuery.of(context);

    return Container(
      height: mediaQuery.size.width * 0.7,
      width: mediaQuery.size.width * 0.7,
      child: Transform.rotate(
        angle: -pi / 2,
        child: CustomPaint(
          painter: ClockPainterNew(),
        ),
      ),
    );
  }
}
