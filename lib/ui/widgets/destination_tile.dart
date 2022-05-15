import 'package:airplane_app/core/colors.dart';
import 'package:airplane_app/core/fonts.dart';
import 'package:airplane_app/ui/pages/detail_page.dart';
import 'package:flutter/material.dart';

class DestinationTile extends StatelessWidget {
  final String image, title, subtitle;
  final double rating;
  const DestinationTile({
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
        margin: const EdgeInsets.only(bottom: 16),
        padding: const EdgeInsets.all(10),
        width: double.infinity,
        height: 90,
        decoration: BoxDecoration(
          color: COLORS.whiteColor,
          borderRadius: BorderRadius.circular(18),
        ),
        child: Row(
          children: [
            Container(
              width: 70,
              height: double.infinity,
              decoration: BoxDecoration(
                image: DecorationImage(
                  image: AssetImage(image),
                  fit: BoxFit.cover,
                ),
                borderRadius: BorderRadius.circular(18),
              ),
            ),
            const SizedBox(
              width: 16,
            ),
            Column(
              mainAxisAlignment: MainAxisAlignment.center,
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
                  rating.toString(),
                  style: TEXTSTYLES.blackTextStyle.copyWith(
                    fontWeight: FONTWEIGHT.medium,
                  ),
                ),
              ],
            ),
            const SizedBox(
              width: 6,
            ),
          ],
        ),
      ),
    );
  }
}
