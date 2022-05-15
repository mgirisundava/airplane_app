import 'package:airplane_app/ui/pages/bonus_page.dart';
import 'package:airplane_app/ui/pages/get_started_page.dart';
import 'package:airplane_app/ui/pages/main_page.dart';
import 'package:airplane_app/ui/pages/sign_up_page.dart';
import 'package:airplane_app/ui/pages/splash_page.dart';
import 'package:flutter/material.dart';

void main() {
  return runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return const MaterialApp(
      debugShowCheckedModeBanner: false,
      home: SplashPage(),
    );
  }
}
