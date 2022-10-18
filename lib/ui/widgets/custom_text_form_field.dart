import 'package:flutter/material.dart';

import '../../core/colors.dart';
import '../../core/fonts.dart';

class CustomTextFormField extends StatelessWidget {
  final String title, hintText;
  final bool isObsecure;
  final TextEditingController controller;

  const CustomTextFormField({
    Key? key,
    required this.title,
    required this.hintText,
    this.isObsecure = false,
    required this.controller,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          title,
          style: TEXTSTYLES.blackTextStyle,
        ),
        const SizedBox(
          height: 6,
        ),
        TextFormField(
          controller: controller,
          obscureText: isObsecure,
          cursorColor: COLORS.blackColor,
          decoration: InputDecoration(
            hintText: hintText,
            border: OutlineInputBorder(
              borderRadius: BorderRadius.circular(17),
            ),
            focusedBorder: OutlineInputBorder(
              borderRadius: BorderRadius.circular(17),
              borderSide: BorderSide(
                color: COLORS.primaryColor,
              ),
            ),
          ),
        )
      ],
    );
  }
}
