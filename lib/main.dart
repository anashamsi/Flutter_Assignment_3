import 'package:flutter/material.dart';
import 'package:flutter_assignment_3/Login_Screen.dart';
import 'package:flutter_assignment_3/Reels_Screen.dart';
import 'package:flutter_assignment_3/Welcome_Screen.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: WelcomeScreen(),
    );
  }
}
