import 'package:airplane_app/core/colors.dart';
import 'package:airplane_app/core/fonts.dart';
import 'package:airplane_app/core/images.dart';
import 'package:airplane_app/ui/pages/choose_seat_page.dart';
import 'package:airplane_app/ui/widgets/interest_item.dart';
import 'package:airplane_app/ui/widgets/photo_item.dart';
import 'package:airplane_app/ui/widgets/primary_button.dart';
import 'package:flutter/material.dart';

class DetailPage extends StatelessWidget {
  const DetailPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    Widget backgroundImage() {
      return Container(
        width: double.infinity,
        height: 450,
        decoration: BoxDecoration(
          image: DecorationImage(
            image: AssetImage(IMAGES.lakeCiliwungImage),
            fit: BoxFit.cover,
          ),
        ),
      );
    }

    Widget customShadow() {
      return Container(
        margin: const EdgeInsets.only(top: 236),
        width: double.infinity,
        height: 214,
        decoration: BoxDecoration(
          gradient: LinearGradient(
            begin: Alignment.topCenter,
            end: Alignment.bottomCenter,
            colors: [
              COLORS.whiteColor.withOpacity(0),
              Colors.black.withOpacity(0.95),
            ],
          ),
        ),
      );
    }

    Widget content() {
      return Container(
        margin: const EdgeInsets.only(top: 30),
        width: double.infinity,
        child: SingleChildScrollView(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              // NOTE : EMBLEM

              SafeArea(
                child: Center(
                  child: Container(
                    width: 108,
                    height: 24,
                    decoration: BoxDecoration(
                      image: DecorationImage(
                        image: AssetImage(IMAGES.emblem),
                      ),
                    ),
                  ),
                ),
              ),

              // NOTE : TITLE

              Container(
                margin: const EdgeInsets.only(top: 230),
                padding: const EdgeInsets.symmetric(horizontal: 24),
                child: Row(
                  children: [
                    Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(
                          'Lake Ciliwung',
                          style: TEXTSTYLES.whiteTextStyle.copyWith(
                            fontSize: 24,
                            fontWeight: FONTWEIGHT.semiBold,
                          ),
                          maxLines: 1,
                          overflow: TextOverflow.ellipsis,
                        ),
                        Text(
                          'Tangerang',
                          style: TEXTSTYLES.whiteTextStyle.copyWith(
                            fontSize: 16,
                            fontWeight: FONTWEIGHT.light,
                          ),
                        ),
                      ],
                    ),
                    const Spacer(),
                    Row(
                      crossAxisAlignment: CrossAxisAlignment.center,
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Icon(
                          Icons.star,
                          color: COLORS.orangeColor,
                          size: 20,
                        ),
                        const SizedBox(
                          width: 1,
                        ),
                        Text(
                          '4.8',
                          style: TEXTSTYLES.whiteTextStyle.copyWith(
                            fontWeight: FONTWEIGHT.medium,
                          ),
                        ),
                      ],
                    ),
                  ],
                ),
              ),

              // NOTE : DESCRIPTION

              Container(
                margin: const EdgeInsets.only(
                  top: 30,
                  left: 24,
                  right: 24,
                ),
                padding: const EdgeInsets.symmetric(
                  horizontal: 20,
                  vertical: 30,
                ),
                width: double.infinity,
                decoration: BoxDecoration(
                  color: COLORS.whiteColor,
                  borderRadius: BorderRadius.circular(18),
                ),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    // NOTE : ABOUT

                    Text(
                      'About',
                      style: TEXTSTYLES.blackTextStyle.copyWith(
                        fontSize: 16,
                        fontWeight: FONTWEIGHT.semiBold,
                      ),
                    ),
                    const SizedBox(
                      height: 6,
                    ),
                    Text(
                      'Berada di jalur jalan provinsi yang menghubungkan Denpasar Singaraja serta letaknya yang dekat dengan Kebun Raya Eka Karya menjadikan tempat Bali.',
                      style: TEXTSTYLES.blackTextStyle.copyWith(height: 2.6),
                    ),
                    const SizedBox(
                      height: 20,
                    ),

                    // NOTE : PHOTOS

                    Text(
                      'Photos',
                      style: TEXTSTYLES.blackTextStyle.copyWith(
                        fontSize: 16,
                        fontWeight: FONTWEIGHT.semiBold,
                      ),
                    ),
                    const SizedBox(
                      height: 10,
                    ),
                    SingleChildScrollView(
                      scrollDirection: Axis.horizontal,
                      child: Row(
                        children: [
                          PhotoItem(imageUrl: IMAGES.photo1),
                          const SizedBox(width: 16),
                          PhotoItem(imageUrl: IMAGES.photo2),
                          const SizedBox(width: 16),
                          PhotoItem(imageUrl: IMAGES.photo3),
                        ],
                      ),
                    ),
                    const SizedBox(
                      height: 20,
                    ),

                    // NOTE : PHOTOS

                    Text(
                      'Interests',
                      style: TEXTSTYLES.blackTextStyle.copyWith(
                        fontSize: 16,
                        fontWeight: FONTWEIGHT.semiBold,
                      ),
                    ),
                    const SizedBox(
                      height: 10,
                    ),
                    Row(
                      children: const [
                        InterestItem(title: 'Kids Park'),
                        InterestItem(title: 'Honor Bridge'),
                      ],
                    ),
                    const SizedBox(
                      height: 10,
                    ),
                    Row(
                      children: const [
                        InterestItem(title: 'City Museum'),
                        InterestItem(title: 'Central Mall'),
                      ],
                    ),
                  ],
                ),
              ),

              // NOTE : PRICE $ BOOK BUTTON

              Container(
                margin: const EdgeInsets.symmetric(vertical: 30),
                padding: const EdgeInsets.symmetric(horizontal: 24),
                width: double.infinity,
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(
                          'IDR 2.500.000',
                          style: TEXTSTYLES.blackTextStyle.copyWith(
                            fontSize: 18,
                            fontWeight: FONTWEIGHT.medium,
                          ),
                        ),
                        const SizedBox(
                          height: 5,
                        ),
                        Text(
                          'per orang',
                          style: TEXTSTYLES.greyTextStyle.copyWith(
                            fontWeight: FONTWEIGHT.light,
                          ),
                        )
                      ],
                    ),
                    PrimaryButton(
                      title: 'Book Now',
                      width: 170,
                      onPressed: () {
                        Navigator.push(
                          context,
                          MaterialPageRoute(
                            builder: ((context) => const ChooseSeatPage()),
                          ),
                        );
                      },
                    ),
                  ],
                ),
              ),
            ],
          ),
        ),
      );
    }

    return Scaffold(
      body: Stack(
        children: [
          backgroundImage(),
          customShadow(),
          content(),
        ],
      ),
    );
  }
}
