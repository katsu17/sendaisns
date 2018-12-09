import 'package:flutter/material.dart';

import 'home.dart';

void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  ThemeData _buildTheme() {
    final ThemeData base = ThemeData.light();
    // final ThemeData base = ThemeData.dark();
    return base.copyWith(
      primaryColor: Colors.orange,
      accentColor: Colors.cyan[400],
      scaffoldBackgroundColor: Colors.white,
      buttonTheme: ButtonThemeData(
          buttonColor: Colors.cyan[400],
          shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(50.0))),
      textTheme: TextTheme(
        body1: TextStyle(
          fontSize: 15.0,
          color: Colors.black,
        ),
        body2: TextStyle(
          color: Colors.grey,
        ),
        button: TextStyle(
          fontSize: 16.0,
        ),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: '仙台SNS',
      theme: _buildTheme(),
      home: HomePage(),
    );
  }
}
