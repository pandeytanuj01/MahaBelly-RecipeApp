import 'dart:io';

import 'package:MahaBelly/home.dart';
import 'package:flutter/material.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {    return MaterialApp(
      title: "Welcome to Maha Belly",
      home: HomePage(),

    );
  }
}