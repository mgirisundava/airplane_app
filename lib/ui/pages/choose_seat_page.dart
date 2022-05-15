import 'package:airplane_app/core/colors.dart';
import 'package:airplane_app/core/fonts.dart';
import 'package:airplane_app/ui/pages/checkout_page.dart';
import 'package:airplane_app/ui/widgets/primary_button.dart';
import 'package:airplane_app/ui/widgets/seat_item.dart';
import 'package:flutter/material.dart';

import '../../core/images.dart';

class ChooseSeatPage extends StatelessWidget {
  const ChooseSeatPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    Widget title() {
      return SafeArea(
        child: Container(
          margin: const EdgeInsets.only(top: 30),
          child: Text(
            'Select Your\nFavorite Seat',
            style: TEXTSTYLES.blackTextStyle.copyWith(
              fontSize: 24,
              fontWeight: FONTWEIGHT.semiBold,
            ),
          ),
        ),
      );
    }

    Widget seatStatus() {
      return Container(
        margin: const EdgeInsets.only(top: 30),
        child: Row(
          children: [
            // NOTE : AVAILABLE

            Container(
              margin: const EdgeInsets.only(right: 6),
              width: 16,
              height: 16,
              decoration: BoxDecoration(
                image: DecorationImage(
                  image: AssetImage(IMAGES.availableIcon),
                ),
              ),
            ),
            Text(
              'Available',
              style: TEXTSTYLES.blackTextStyle,
            ),

            // NOTE : SELECTED

            Container(
              margin: const EdgeInsets.only(
                right: 6,
                left: 10,
              ),
              width: 16,
              height: 16,
              decoration: BoxDecoration(
                image: DecorationImage(
                  image: AssetImage(IMAGES.selectedIcon),
                ),
              ),
            ),
            Text(
              'Available',
              style: TEXTSTYLES.blackTextStyle,
            ),

            // NOTE : UNAVAILABLE ICON

            Container(
              margin: const EdgeInsets.only(
                right: 6,
                left: 10,
              ),
              width: 16,
              height: 16,
              decoration: BoxDecoration(
                image: DecorationImage(
                  image: AssetImage(IMAGES.unavailableIcon),
                ),
              ),
            ),
            Text(
              'Available',
              style: TEXTSTYLES.blackTextStyle,
            ),
          ],
        ),
      );
    }

    Widget selectSeat() {
      return Container(
        margin: const EdgeInsets.only(top: 30),
        padding: const EdgeInsets.symmetric(
          horizontal: 22,
          vertical: 30,
        ),
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(18),
          color: COLORS.whiteColor,
        ),
        child: Column(
          children: [
            // NOTE : SEAT INDICATORS

            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                SizedBox(
                  width: 48,
                  height: 48,
                  child: Center(
                    child: Text(
                      'A',
                      style: TEXTSTYLES.greyTextStyle.copyWith(fontSize: 16),
                    ),
                  ),
                ),
                SizedBox(
                  width: 48,
                  height: 48,
                  child: Center(
                    child: Text(
                      'B',
                      style: TEXTSTYLES.greyTextStyle.copyWith(fontSize: 16),
                    ),
                  ),
                ),
                SizedBox(
                  width: 48,
                  height: 48,
                  child: Center(
                    child: Text(
                      '',
                      style: TEXTSTYLES.greyTextStyle.copyWith(fontSize: 16),
                    ),
                  ),
                ),
                SizedBox(
                  width: 48,
                  height: 48,
                  child: Center(
                    child: Text(
                      'C',
                      style: TEXTSTYLES.greyTextStyle.copyWith(fontSize: 16),
                    ),
                  ),
                ),
                SizedBox(
                  width: 48,
                  height: 48,
                  child: Center(
                    child: Text(
                      'D',
                      style: TEXTSTYLES.greyTextStyle.copyWith(fontSize: 16),
                    ),
                  ),
                ),
              ],
            ),

            // NOTE : SEAT 1

            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                const SeatItem(status: 2),
                const SeatItem(status: 2),
                Container(
                  margin: const EdgeInsets.only(top: 16),
                  width: 48,
                  height: 48,
                  child: Center(
                    child: Text(
                      '1',
                      style: TEXTSTYLES.greyTextStyle.copyWith(fontSize: 16),
                    ),
                  ),
                ),
                const SeatItem(status: 0),
                const SeatItem(status: 2),
              ],
            ),

            // NOTE : SEAT 2

            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                const SeatItem(status: 0),
                const SeatItem(status: 0),
                Container(
                  margin: const EdgeInsets.only(top: 16),
                  width: 48,
                  height: 48,
                  child: Center(
                    child: Text(
                      '2',
                      style: TEXTSTYLES.greyTextStyle.copyWith(fontSize: 16),
                    ),
                  ),
                ),
                const SeatItem(status: 0),
                const SeatItem(status: 2),
              ],
            ),

            // NOTE : SEAT 3

            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                const SeatItem(status: 1),
                const SeatItem(status: 1),
                Container(
                  margin: const EdgeInsets.only(top: 16),
                  width: 48,
                  height: 48,
                  child: Center(
                    child: Text(
                      '3',
                      style: TEXTSTYLES.greyTextStyle.copyWith(fontSize: 16),
                    ),
                  ),
                ),
                const SeatItem(status: 0),
                const SeatItem(status: 0),
              ],
            ),

            // NOTE : SEAT 4

            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                const SeatItem(status: 0),
                const SeatItem(status: 2),
                Container(
                  margin: const EdgeInsets.only(top: 16),
                  width: 48,
                  height: 48,
                  child: Center(
                    child: Text(
                      '4',
                      style: TEXTSTYLES.greyTextStyle.copyWith(fontSize: 16),
                    ),
                  ),
                ),
                const SeatItem(status: 0),
                const SeatItem(status: 0),
              ],
            ),

            // NOTE : SEAT 5

            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                const SeatItem(status: 0),
                const SeatItem(status: 0),
                Container(
                  margin: const EdgeInsets.only(top: 16),
                  width: 48,
                  height: 48,
                  child: Center(
                    child: Text(
                      '5',
                      style: TEXTSTYLES.greyTextStyle.copyWith(fontSize: 16),
                    ),
                  ),
                ),
                const SeatItem(status: 2),
                const SeatItem(status: 0),
              ],
            ),

            // NOTE : YOUR SEAT

            Container(
              margin: const EdgeInsets.only(top: 30),
              width: double.infinity,
              child: Row(
                crossAxisAlignment: CrossAxisAlignment.start,
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Expanded(
                    child: Text(
                      'Your Seat',
                      style: TEXTSTYLES.greyTextStyle
                          .copyWith(fontWeight: FONTWEIGHT.light),
                    ),
                  ),
                  Expanded(
                    child: Text(
                      'A3, B3',
                      style: TEXTSTYLES.blackTextStyle.copyWith(
                        fontWeight: FONTWEIGHT.medium,
                        fontSize: 16,
                      ),
                    ),
                  ),
                ],
              ),
            ),

            // NOTE : TOTAL PRICE

            Container(
              margin: const EdgeInsets.only(top: 10),
              width: double.infinity,
              child: Row(
                crossAxisAlignment: CrossAxisAlignment.start,
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Expanded(
                    child: Text(
                      'Total',
                      style: TEXTSTYLES.greyTextStyle
                          .copyWith(fontWeight: FONTWEIGHT.light),
                    ),
                  ),
                  Expanded(
                    child: Text(
                      'IDR 540.000.000',
                      style: TEXTSTYLES.primarytextStyle.copyWith(
                        fontWeight: FONTWEIGHT.semiBold,
                        fontSize: 16,
                      ),
                    ),
                  ),
                ],
              ),
            )
          ],
        ),
      );
    }

    Widget checkoutButton() {
      return Container(
        margin: const EdgeInsets.symmetric(vertical: 30),
        child: PrimaryButton(
          title: 'Continue to Checkout',
          onPressed: () {
            Navigator.push(
              context,
              MaterialPageRoute(
                builder: (context) => const CheckoutPage(),
              ),
            );
          },
        ),
      );
    }

    return Scaffold(
      backgroundColor: COLORS.bgColor,
      body: ListView(
        padding: const EdgeInsets.symmetric(horizontal: 24),
        children: [
          title(),
          seatStatus(),
          selectSeat(),
          checkoutButton(),
        ],
      ),
    );
  }
}
