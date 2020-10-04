import 'dart:async';

import 'package:flutter/material.dart';
import 'package:NewsLe/views/home.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatefulWidget {
  @override
  _MyAppState createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  bool darkThemeEnabled = false;

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'NewsLe',
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        primaryColor: Colors.black,
      ),
      home: Home(),
    );
  }
}
