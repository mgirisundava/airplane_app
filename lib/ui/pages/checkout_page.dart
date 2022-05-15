import 'package:airplane_app/core/fonts.dart';
import 'package:airplane_app/ui/widgets/primary_button.dart';
import 'package:flutter/material.dart';

import '../../core/colors.dart';
import '../../core/images.dart';

class CheckoutPage extends StatelessWidget {
  const CheckoutPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    Widget route() {
      return SafeArea(
        child: Container(
          margin: const EdgeInsets.only(top: 30),
          width: double.infinity,
          height: 132,
          child: Column(
            children: [
              Image.asset(
                IMAGES.routeIllustration,
                width: 291,
                fit: BoxFit.cover,
              ),
              const SizedBox(
                height: 10,
              ),
              SizedBox(
                width: 327,
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(
                          'CGK',
                          style: TEXTSTYLES.blackTextStyle.copyWith(
                            fontSize: 24,
                            fontWeight: FONTWEIGHT.semiBold,
                          ),
                        ),
                        Text(
                          'Tangerang',
                          style: TEXTSTYLES.greyTextStyle.copyWith(
                            fontWeight: FONTWEIGHT.light,
                          ),
                        ),
                      ],
                    ),
                    Column(
                      crossAxisAlignment: CrossAxisAlignment.end,
                      children: [
                        Text(
                          'TLC',
                          style: TEXTSTYLES.blackTextStyle.copyWith(
                            fontSize: 24,
                            fontWeight: FONTWEIGHT.semiBold,
                          ),
                        ),
                        Text(
                          'Ciliwung',
                          style: TEXTSTYLES.greyTextStyle.copyWith(
                            fontWeight: FONTWEIGHT.light,
                          ),
                        ),
                      ],
                    )
                  ],
                ),
              )
            ],
          ),
        ),
      );
    }

    Widget bookingDetails() {
      return Container(
        margin: const EdgeInsets.only(top: 26),
        padding: const EdgeInsets.symmetric(
          vertical: 30,
          horizontal: 20,
        ),
        width: double.infinity,
        decoration: BoxDecoration(
          color: COLORS.whiteColor,
          borderRadius: BorderRadius.circular(18),
        ),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            // NOTE : DESTINATION INFO

            Row(
              children: [
                Container(
                  width: 70,
                  height: 70,
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(18),
                    image: DecorationImage(
                      image: AssetImage(IMAGES.lakeCiliwungImage),
                      fit: BoxFit.cover,
                    ),
                  ),
                ),
                const SizedBox(
                  width: 16,
                ),
                Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      'Lake Ciliwung',
                      style: TEXTSTYLES.blackTextStyle.copyWith(
                        fontSize: 18,
                        fontWeight: FONTWEIGHT.medium,
                      ),
                    ),
                    const SizedBox(
                      height: 5,
                    ),
                    Text(
                      'Tangerang',
                      style: TEXTSTYLES.greyTextStyle.copyWith(
                        fontWeight: FONTWEIGHT.light,
                      ),
                    ),
                  ],
                ),
                const Spacer(),
                Expanded(
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
                        '4.8',
                        style: TEXTSTYLES.blackTextStyle.copyWith(
                          fontWeight: FONTWEIGHT.medium,
                        ),
                      ),
                    ],
                  ),
                )
              ],
            ),
            const SizedBox(
              height: 20,
            ),

            // NOTE : BOOKING DETAILS

            Text(
              'Booking Details',
              style: TEXTSTYLES.blackTextStyle.copyWith(
                fontSize: 16,
                fontWeight: FONTWEIGHT.semiBold,
              ),
            ),
            BookingDetailItem(
              title: 'Traveler',
              value: '2 person',
              valueTextStyle: TEXTSTYLES.blackTextStyle.copyWith(
                fontWeight: FONTWEIGHT.semiBold,
              ),
            ),
            BookingDetailItem(
              title: 'Seat',
              value: 'A3, B3',
              valueTextStyle: TEXTSTYLES.blackTextStyle.copyWith(
                fontWeight: FONTWEIGHT.semiBold,
              ),
            ),
            BookingDetailItem(
              title: 'Insurance',
              value: 'YES',
              valueTextStyle: TEXTSTYLES.greenTextStyle.copyWith(
                fontWeight: FONTWEIGHT.semiBold,
              ),
            ),
            BookingDetailItem(
              title: 'Refundable',
              value: 'NO',
              valueTextStyle: TEXTSTYLES.redTextStyle.copyWith(
                fontWeight: FONTWEIGHT.semiBold,
              ),
            ),
            BookingDetailItem(
              title: 'VAT',
              value: '45%',
              valueTextStyle: TEXTSTYLES.blackTextStyle.copyWith(
                fontWeight: FONTWEIGHT.semiBold,
              ),
            ),
            BookingDetailItem(
              title: 'Price',
              value: 'IDR 8.500.690',
              valueTextStyle: TEXTSTYLES.blackTextStyle.copyWith(
                fontWeight: FONTWEIGHT.semiBold,
              ),
            ),
            BookingDetailItem(
              title: 'Grand Total',
              value: 'IDR 12.000.000',
              valueTextStyle: TEXTSTYLES.blackTextStyle.copyWith(
                fontWeight: FONTWEIGHT.semiBold,
              ),
            )
          ],
        ),
      );
    }

    Widget paymentDetails() {
      return Container(
        margin: const EdgeInsets.only(top: 30),
        padding: const EdgeInsets.symmetric(
          horizontal: 20,
          vertical: 30,
        ),
        width: double.infinity,
        decoration: BoxDecoration(
          color: COLORS.whiteColor,
          borderRadius: BorderRadius.circular(18),
        ),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              'Payment Details',
              style: TEXTSTYLES.blackTextStyle.copyWith(
                fontWeight: FONTWEIGHT.semiBold,
                fontSize: 16,
              ),
            ),
            const SizedBox(
              height: 16,
            ),
            Row(
              children: [
                Container(
                  padding: const EdgeInsets.symmetric(
                    horizontal: 20,
                    vertical: 23,
                  ),
                  width: 100,
                  height: 70,
                  decoration: BoxDecoration(
                    image: DecorationImage(
                      image: AssetImage(IMAGES.cardBackground),
                    ),
                  ),
                  child: Row(
                    children: [
                      Container(
                        width: 24,
                        height: 24,
                        decoration: BoxDecoration(
                          image: DecorationImage(
                            image: AssetImage(IMAGES.logo),
                          ),
                        ),
                      ),
                      const SizedBox(
                        width: 6,
                      ),
                      Text(
                        'Pay',
                        style: TEXTSTYLES.whiteTextStyle.copyWith(
                          fontSize: 16,
                          fontWeight: FONTWEIGHT.medium,
                        ),
                      ),
                    ],
                  ),
                ),
                const SizedBox(
                  width: 16,
                ),
                Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      'IDR 80.400.000',
                      style: TEXTSTYLES.blackTextStyle.copyWith(
                        fontSize: 18,
                        fontWeight: FONTWEIGHT.medium,
                      ),
                    ),
                    const SizedBox(
                      height: 5,
                    ),
                    Text(
                      'Current Balance',
                      style: TEXTSTYLES.greyTextStyle.copyWith(
                        fontWeight: FONTWEIGHT.light,
                      ),
                    ),
                  ],
                )
              ],
            )
          ],
        ),
      );
    }

    Widget button() {
      return Container(
        margin: const EdgeInsets.symmetric(vertical: 30),
        child: Column(
          children: [
            // NOTE : PAY BUTTON

            PrimaryButton(
              title: 'Pay Now',
              onPressed: () {},
            ),
            const SizedBox(
              height: 30,
            ),

            // NOTE : TAC BUTTON

            SizedBox(
              width: double.infinity,
              child: Center(
                child: Text(
                  'Term and Condition',
                  style: TEXTSTYLES.greyTextStyle.copyWith(
                    fontSize: 16,
                    fontWeight: FONTWEIGHT.light,
                    decoration: TextDecoration.underline,
                  ),
                ),
              ),
            ),
          ],
        ),
      );
    }

    return Scaffold(
      backgroundColor: COLORS.bgColor,
      body: ListView(
        padding: const EdgeInsets.symmetric(horizontal: 24),
        children: [
          route(),
          bookingDetails(),
          paymentDetails(),
          button(),
        ],
      ),
    );
  }
}

class BookingDetailItem extends StatelessWidget {
  final String title, value;
  final TextStyle valueTextStyle;
  const BookingDetailItem({
    Key? key,
    required this.title,
    required this.value,
    required this.valueTextStyle,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.only(top: 16),
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.start,
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Expanded(
            child: Row(
              children: [
                Container(
                  margin: const EdgeInsets.only(right: 6),
                  width: 16,
                  height: 16,
                  decoration: BoxDecoration(
                    image: DecorationImage(
                      image: AssetImage(
                        IMAGES.checkIcon,
                      ),
                    ),
                  ),
                ),
                Text(
                  title,
                  style: TEXTSTYLES.blackTextStyle,
                ),
              ],
            ),
          ),
          Expanded(
            child: Text(
              value,
              style: valueTextStyle,
            ),
          ),
        ],
      ),
    );
  }
}
