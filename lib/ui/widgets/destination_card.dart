import 'package:airplane_app/ui/pages/detail_page.dart';
import 'package:flutter/material.dart';

import '../../core/colors.dart';
import '../../core/fonts.dart';

class DestinationCard extends StatelessWidget {
  final String image, title, subtitle;
  final double rating;
  const DestinationCard({
    Key? key,
    required this.image,
    required this.title,
    required this.subtitle,
    required this.rating,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        Navigator.push(
          context,
          MaterialPageRoute(
            builder: (context) => const DetailPage(),
          ),
        );
      },
      child: Container(
        margin: const EdgeInsets.only(left: 24),
        width: 200,
        height: 323,
        padding: const EdgeInsets.only(
          left: 10,
          top: 10,
          right: 10,
        ),
        decoration: BoxDecoration(
          color: COLORS.whiteColor,
          borderRadius: BorderRadius.circular(18),
        ),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Container(
              width: double.infinity,
              height: 220,
              decoration: BoxDecoration(
                image: DecorationImage(
                  image: AssetImage(image),
                  fit: BoxFit.cover,
                ),
                borderRadius: BorderRadius.circular(18),
              ),
              child: Align(
                alignment: Alignment.topRight,
                child: Container(
                  width: 54.5,
                  height: 30,
                  decoration: BoxDecoration(
                    color: COLORS.whiteColor,
                    borderRadius: const BorderRadius.only(
                      bottomLeft: Radius.circular(18),
                    ),
                  ),
                  child: Row(
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
                        rating.toString(),
                        style: TEXTSTYLES.blackTextStyle.copyWith(
                          fontWeight: FONTWEIGHT.medium,
                        ),
                      ),
                    ],
                  ),
                ),
              ),
            ),
            const SizedBox(
              height: 20,
            ),
            Container(
              padding: const EdgeInsets.only(
                left: 10,
                right: 10,
                bottom: 10,
              ),
              width: double.infinity,
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    title,
                    style: TEXTSTYLES.blackTextStyle.copyWith(
                      fontSize: 18,
                      fontWeight: FONTWEIGHT.medium,
                    ),
                  ),
                  const SizedBox(
                    height: 5,
                  ),
                  Text(
                    subtitle,
                    style: TEXTSTYLES.greyTextStyle.copyWith(
                      fontWeight: FONTWEIGHT.light,
                    ),
                  ),
                ],
              ),
            )
          ],
        ),
      ),
    );
  }
}
