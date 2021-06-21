import 'dart:ui';

import 'package:flutter/material.dart';
import 'package:login_http/homepage.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      theme: ThemeData(
        visualDensity: VisualDensity.adaptivePlatformDensity,
        primaryColor: Colors.red,
        accentColor: Colors.red,
        brightness: Brightness.dark,
        textTheme: TextTheme(
          headline1: TextStyle(fontSize: 70.0,fontWeight: FontWeight.bold),
          headline2: TextStyle(fontSize: 40.0,fontWeight: FontWeight.bold),
          headline3: TextStyle(fontSize: 36.0,fontWeight: FontWeight.bold),
          bodyText1: TextStyle(
            fontSize: 20.0,
          ),
          bodyText2: TextStyle(
            fontSize: 18.0,
          ),
        ),
      ),
      home: Homepage(),
      debugShowCheckedModeBanner: false,
    );
  }
}
