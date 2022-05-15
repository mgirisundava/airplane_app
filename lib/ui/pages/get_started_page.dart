import 'package:airplane_app/core/colors.dart';
import 'package:airplane_app/core/fonts.dart';
import 'package:airplane_app/core/images.dart';
import 'package:airplane_app/ui/pages/sign_up_page.dart';
import 'package:airplane_app/ui/widgets/primary_button.dart';
import 'package:flutter/material.dart';

class GetStartedPage extends StatelessWidget {
  const GetStartedPage({Key? key}) : super(key: key);

  static const routeName = 'get-started';

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: COLORS.bgColor,
      body: Stack(
        children: [
          Container(
            width: double.infinity,
            height: double.infinity,
            decoration: BoxDecoration(
              image: DecorationImage(
                image: AssetImage(IMAGES.getStartedImage),
                fit: BoxFit.cover,
              ),
            ),
          ),
          SizedBox(
            width: double.infinity,
            height: double.infinity,
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.center,
              mainAxisAlignment: MainAxisAlignment.end,
              children: [
                Text(
                  'Fly Like a Bird',
                  style: TEXTSTYLES.whiteTextStyle.copyWith(
                    fontSize: 32,
                    fontWeight: FONTWEIGHT.semiBold,
                  ),
                ),
                const SizedBox(
                  height: 10,
                ),
                Text(
                  'Explore new world with us and let\nyourself get an amazing experiences',
                  style: TEXTSTYLES.whiteTextStyle.copyWith(
                    fontSize: 16,
                    fontWeight: FONTWEIGHT.light,
                  ),
                  textAlign: TextAlign.center,
                ),
                const SizedBox(
                  height: 50,
                ),
                PrimaryButton(
                  onPressed: () {
                    Navigator.pushNamed(context, SignUpPage.routeName);
                  },
                  width: 220,
                  height: 55,
                  title: 'Get Started',
                ),
                const SizedBox(
                  height: 80,
                )
              ],
            ),
          )
        ],
      ),
    );
  }
}
