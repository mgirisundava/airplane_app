import 'package:airplane_app/core/colors.dart';
import 'package:airplane_app/core/fonts.dart';
import 'package:airplane_app/core/images.dart';
import 'package:airplane_app/ui/widgets/primary_button.dart';
import 'package:flutter/material.dart';

class GetStartedPage extends StatelessWidget {
  const GetStartedPage({Key? key}) : super(key: key);

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
                  'Terbang Bebas',
                  style: TEXTSTYLES.whiteTextStyle.copyWith(
                    fontSize: 32,
                    fontWeight: FONTWEIGHT.semiBold,
                  ),
                ),
                const SizedBox(
                  height: 10,
                ),
                Text(
                  'Jelajahi dunia baru bersama kami\nuntuk pengalaman yang menakjubkan!',
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
                    Navigator.pushNamed(context, '/auth');
                  },
                  width: 220,
                  height: 55,
                  title: 'Mulai',
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
