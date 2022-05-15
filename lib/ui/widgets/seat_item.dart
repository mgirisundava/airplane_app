import 'package:airplane_app/core/fonts.dart';
import 'package:flutter/material.dart';

import '../../core/colors.dart';

class SeatItem extends StatelessWidget {
  // NOTE : 0. Available Color, 1. Selected Color, 2. Unavailable Color

  final int status;
  const SeatItem({
    Key? key,
    required this.status,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    backgroundColor() {
      switch (status) {
        case 0:
          return COLORS.availableColor;
        case 1:
          return COLORS.primaryColor;
        case 2:
          return COLORS.unavailableColor;
        default:
          COLORS.unavailableColor;
      }
    }

    borderColor() {
      switch (status) {
        case 0:
          return COLORS.primaryColor;
        case 1:
          return COLORS.primaryColor;
        case 2:
          return COLORS.unavailableColor;
        default:
          COLORS.unavailableColor;
      }
    }

    child() {
      switch (status) {
        case 0:
          return const SizedBox();
        case 1:
          return Center(
            child: Text(
              'YOU',
              style: TEXTSTYLES.whiteTextStyle
                  .copyWith(fontWeight: FONTWEIGHT.semiBold),
            ),
          );
        case 2:
          return const SizedBox();
        default:
          const SizedBox();
      }
    }

    return Container(
      margin: const EdgeInsets.only(top: 16),
      width: 48,
      height: 48,
      decoration: BoxDecoration(
        color: backgroundColor(),
        borderRadius: BorderRadius.circular(15),
        border: Border.all(
          color: borderColor()!,
        ),
      ),
      child: child(),
    );
  }
}
