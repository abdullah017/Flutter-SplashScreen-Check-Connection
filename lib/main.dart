import 'package:flutter/material.dart';
import 'package:splash_screen_check_connection/views/connection_error.dart';
import 'package:splash_screen_check_connection/views/home.dart';
import 'package:splash_screen_check_connection/views/splash.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return const MaterialApp(
      home: SplashView(),
    );
  }
}
