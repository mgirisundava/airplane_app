import 'package:airplane_app/core/colors.dart';
import 'package:airplane_app/core/fonts.dart';
import 'package:airplane_app/ui/pages/main_page.dart';
import 'package:airplane_app/ui/widgets/primary_button.dart';
import 'package:flutter/material.dart';

import '../../core/images.dart';

class BookedPage extends StatelessWidget {
  const BookedPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    var size = MediaQuery.of(context).size;

    return Scaffold(
      backgroundColor: COLORS.bgColor,
      body: Container(
        padding: const EdgeInsets.symmetric(horizontal: 24),
        width: size.width,
        height: size.height,
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            const SizedBox(
              height: 30,
            ),
            Container(
              margin: const EdgeInsets.only(bottom: 80),
              width: double.infinity,
              height: 150,
              decoration: BoxDecoration(
                image: DecorationImage(
                  image: AssetImage(IMAGES.wellBookedIllustration),
                  // fit: BoxFit.cover,
                ),
              ),
            ),
            Text(
              'Well Booked 😍',
              style: TEXTSTYLES.blackTextStyle.copyWith(
                fontSize: 32,
                fontWeight: FONTWEIGHT.semiBold,
              ),
            ),
            const SizedBox(
              height: 10,
            ),
            Text(
              'Are you ready to explore the new\nworld of experiences?',
              style: TEXTSTYLES.greyTextStyle.copyWith(
                fontSize: 16,
                fontWeight: FONTWEIGHT.light,
              ),
              textAlign: TextAlign.center,
            ),
            const SizedBox(
              height: 50,
            ),
            PrimaryButton(
              title: 'My Bookings',
              width: 220,
              onPressed: () {
                Navigator.pushAndRemoveUntil(
                    context,
                    MaterialPageRoute(
                      builder: (context) => const MainPage(),
                    ),
                    (route) => false);
              },
            ),
            const SizedBox(
              height: 30,
            ),
          ],
        ),
      ),
    );
  }
}
