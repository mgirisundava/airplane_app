import 'package:flutter/material.dart';

import '../../core/fonts.dart';
import '../../core/images.dart';

class InterestItem extends StatelessWidget {
  final String title;
  const InterestItem({
    Key? key,
    required this.title,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Expanded(
      child: Row(
        children: [
          Container(
            width: 16,
            height: 16,
            decoration: BoxDecoration(
              image: DecorationImage(
                image: AssetImage(IMAGES.checkIcon),
              ),
            ),
          ),
          const SizedBox(
            width: 6,
          ),
          Text(
            title,
            style: TEXTSTYLES.blackTextStyle,
          ),
        ],
      ),
    );
  }
}
