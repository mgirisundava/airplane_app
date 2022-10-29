import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../core/colors.dart';
import '../../page/page_cubit.dart';

class BottomNavigationItem extends StatelessWidget {
  final int index;
  final String image;
  final bool isSelected;

  const BottomNavigationItem({
    Key? key,
    required this.image,
    this.isSelected = false,
    required this.index,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        context.read<PageCubit>().setPage(index);
      },
      child: Column(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          const SizedBox(),
          Image.asset(
            image,
            width: 24,
            height: 24,
            color: context.read<PageCubit>().state == index
                ? COLORS.primaryColor
                : COLORS.greyColor,
          ),
          Container(
            width: 30,
            height: 2,
            color: context.read<PageCubit>().state == index
                ? COLORS.primaryColor
                : COLORS.transparentColor,
          )
        ],
      ),
    );
  }
}
