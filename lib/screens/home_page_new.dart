import 'dart:async';

import 'package:clocker/widgets/clock_view_new.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_neumorphic/flutter_neumorphic.dart';
import 'package:intl/intl.dart';

class HomePageNew extends StatefulWidget {
  @override
  _HomePageNewState createState() => _HomePageNewState();
}

class _HomePageNewState extends State<HomePageNew> {
  bool isDarkMode = false;
  DateTime dateTime;

  void toggleDarkMode() {
    setState(() async {
      isDarkMode ? isDarkMode = false : isDarkMode = true;
      isDarkMode
          ? NeumorphicTheme.of(context).themeMode = ThemeMode.dark
          : NeumorphicTheme.of(context).themeMode = ThemeMode.light;
    });
  }

  @override
  void initState() {
    Timer.periodic(
      Duration(seconds: 1),
      (timer) {
        setState(
          () {
            dateTime = DateTime.now();
          },
        );
      },
    );
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    final mediaQuery = MediaQuery.of(context);

    return Scaffold(
      appBar: NeumorphicAppBar(
        title: NeumorphicText(
          "Clocker",
          style: NeumorphicStyle(
            depth: 8, //customize depth here
            color: isDarkMode
                ? Colors.white70
                : Colors.black45, //customize color here
          ),
          textStyle: NeumorphicTextStyle(
            fontSize: 30,
            fontWeight: FontWeight.w600, //customize size here
          ),
        ),
        actions: [
          IconButton(
            onPressed: () => toggleDarkMode(),
            icon: NeumorphicIcon(
              isDarkMode ? Icons.brightness_7 : Icons.brightness_3,
              size: 50,
              curve: Neumorphic.DEFAULT_CURVE,
            ),
          ),
        ],
      ),
      backgroundColor: isDarkMode ? Color(0xFF3E3E3E) : Color(0xFFFFFFFF),
      body: Center(
        child: Column(
          children: [
            Neumorphic(
              margin: EdgeInsets.all(20),
              style: NeumorphicStyle(
                shape: NeumorphicShape.flat,
                boxShape: NeumorphicBoxShape.circle(),
              ),
              child: Container(
                width: mediaQuery.size.width * 0.65,
                height: mediaQuery.size.width * 0.65,
                child: ClockViewNew(),
              ),
            ),
            SizedBox(
              height: 150.0,
            ),
            Neumorphic(
              margin: EdgeInsets.all(20),
              style: NeumorphicStyle(
                shape: NeumorphicShape.flat,
              ),
              child: Container(
                height: 100.0,
                width: 280.0,
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: [
                    NeumorphicText(
                      DateFormat.jm().format(dateTime),
                      style: NeumorphicStyle(
                        depth: 8,
                        color: isDarkMode ? Colors.white70 : Colors.black45,
                      ),
                      textStyle: NeumorphicTextStyle(
                        fontSize: 16,
                        fontWeight: FontWeight.w900,
                      ),
                    ),
                    SizedBox(
                      height: 5.0,
                    ),
                    NeumorphicText(
                      DateFormat.yMMMEd().format(dateTime),
                      style: NeumorphicStyle(
                        depth: 8,
                        color: isDarkMode ? Colors.white70 : Color(0xFF6D6BFF),
                      ),
                      textStyle: NeumorphicTextStyle(
                        fontSize: 28,
                        fontWeight: FontWeight.w400,
                      ),
                    ),
                  ],
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
