import 'package:airplane_app/cubit/seat/seat_cubit.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../core/colors.dart';

class SeatItem extends StatefulWidget {
  // NOTE : 0. Available Color, 1. Selected Color, 2. Unavailable Color

  final int status;
  final bool isAvailable;
  final String id;
  const SeatItem({
    Key? key,
    this.status = 0,
    this.isAvailable = true,
    required this.id,
  }) : super(key: key);

  @override
  State<SeatItem> createState() => _SeatItemState();
}

class _SeatItemState extends State<SeatItem> {
  @override
  Widget build(BuildContext context) {
    var isSelected = context.watch<SeatCubit>().isSelected(widget.id);

    backgroundColor() {
      if (widget.isAvailable == false) {
        return COLORS.unavailableColor;
      } else {
        if (isSelected) {
          return COLORS.primaryColor;
        } else {
          return COLORS.availableColor;
        }
      }
    }

    borderColor() {
      switch (widget.isAvailable) {
        case true:
          return COLORS.primaryColor;
        case false:
          return COLORS.unavailableColor;

        default:
          COLORS.availableColor;
      }
    }

    child() {
      if (!isSelected) {
        return const SizedBox();
      } else {
        return Center(
            child: Icon(
          Icons.person,
          color: COLORS.whiteColor,
        ));
      }
    }

    return GestureDetector(
      onTap: () {
        if (widget.isAvailable == true) {
          context.read<SeatCubit>().selectSeat(widget.id);
        } else {
          null;
        }
      },
      child: Container(
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
      ),
    );
  }
}
