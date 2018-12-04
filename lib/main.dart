import 'package:flutter/material.dart';

import 'home.dart';

void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: '仙台SNS',
      theme: ThemeData(
        primaryColor: Colors.orange,
        accentColor: Colors.cyan[400],
        scaffoldBackgroundColor: Colors.white,
        textTheme: TextTheme(
          body1: TextStyle(
            fontSize: 15.0,
          ),
          button: TextStyle(
            fontSize: 16.0,
          ),
        ),
        buttonTheme: ButtonThemeData(
          buttonColor: Colors.cyan[400],
          shape:
              RoundedRectangleBorder(borderRadius: BorderRadius.circular(50.0)),
        ),
      ),
      home: HomePage(),
    );
  }
}
