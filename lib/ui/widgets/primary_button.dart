import 'package:flutter/material.dart';

import '../../core/colors.dart';
import '../../core/fonts.dart';

class PrimaryButton extends StatelessWidget {
  final double? width, height;
  final String title;
  final VoidCallback? onPressed;
  const PrimaryButton({
    Key? key,
    this.width = double.infinity,
    this.height = 55,
    this.title = 'Enter Title',
    this.onPressed,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: width,
      height: height,
      child: ElevatedButton(
        style: ElevatedButton.styleFrom(
          primary: COLORS.primaryColor,
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(17),
          ),
        ),
        onPressed: onPressed,
        child: Text(
          title,
          style: TEXTSTYLES.whiteTextStyle.copyWith(
            fontSize: 18,
            fontWeight: FONTWEIGHT.medium,
          ),
        ),
      ),
    );
  }
}
