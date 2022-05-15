import 'dart:async';

import 'package:airplane_app/core/colors.dart';
import 'package:airplane_app/core/fonts.dart';
import 'package:airplane_app/core/images.dart';
import 'package:airplane_app/ui/pages/get_started_page.dart';
import 'package:airplane_app/ui/pages/sign_up_page.dart';
import 'package:flutter/material.dart';

class SplashPage extends StatefulWidget {
  const SplashPage({Key? key}) : super(key: key);

  @override
  State<SplashPage> createState() => _SplashPageState();
}

class _SplashPageState extends State<SplashPage> {
  @override
  void initState() {
    Timer(const Duration(seconds: 3), () {
      Navigator.pushAndRemoveUntil(
          context,
          MaterialPageRoute(
            builder: (context) => const GetStartedPage(),
          ),
          (route) => false);
    });
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: COLORS.primaryColor,
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            Container(
              width: 100,
              height: 100,
              decoration: BoxDecoration(
                image: DecorationImage(
                  image: AssetImage(IMAGES.logo),
                ),
              ),
            ),
            const SizedBox(
              height: 50,
            ),
            Text(
              'AIRPLANE',
              style: TEXTSTYLES.whiteTextStyle.copyWith(
                fontSize: 32,
                fontWeight: FONTWEIGHT.medium,
                letterSpacing: 10,
              ),
            ),
          ],
        ),
      ),
    );
  }
}
