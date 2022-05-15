import 'package:flutter/material.dart';

import '../../core/colors.dart';

class BottomNavigationItem extends StatelessWidget {
  final String image;
  final bool isSelected;

  const BottomNavigationItem({
    Key? key,
    required this.image,
    this.isSelected = false,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        const SizedBox(),
        SizedBox(
          width: 24,
          height: 24,
          child: Image.asset(image),
        ),
        Container(
          width: 30,
          height: 2,
          color: isSelected == true
              ? COLORS.primaryColor
              : COLORS.transparentColor,
        )
      ],
    );
  }
}
