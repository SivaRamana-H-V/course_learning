// ignore_for_file: unused_import

import 'package:course_learning/auth/login.dart';
import 'package:course_learning/auth/signup.txt';
import 'package:course_learning/homepage.dart';
import 'package:course_learning/splash.dart';
import 'package:flutter/material.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Startup Culture',
      theme: ThemeData(
          textTheme: const TextTheme(
              bodyMedium: TextStyle(
                  fontSize: 20.0,
                  fontWeight: FontWeight.bold,
                  color: Color(0xff3F3E3E))),
          colorScheme: ColorScheme.fromSeed(seedColor: const Color(0xffeca731)),
          useMaterial3: true,
          appBarTheme: const AppBarTheme(backgroundColor: Color(0xffeca731))),
      home: const SplashScreen(),
    );
  }
}
