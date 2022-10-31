import 'package:airplane_app/models/destination_model.dart';
import 'package:flutter/material.dart';
import 'package:intl/intl.dart';

import '../../core/colors.dart';
import '../../core/fonts.dart';
import 'checkout_page.dart';

class TransactionCard extends StatelessWidget {
  final DestinationModel destination;
  final int amountOfTraveler;
  final String seat;
  final bool insurance;
  final bool refundable;
  final double vat;
  final int price;
  final int grandTotal;

  const TransactionCard({
    Key? key,
    required this.destination,
    required this.amountOfTraveler,
    required this.seat,
    required this.insurance,
    required this.refundable,
    required this.vat,
    required this.price,
    required this.grandTotal,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
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
                    image: NetworkImage(destination.imageUrl),
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
                    destination.name,
                    style: TEXTSTYLES.blackTextStyle.copyWith(
                      fontSize: 18,
                      fontWeight: FONTWEIGHT.medium,
                    ),
                  ),
                  const SizedBox(
                    height: 5,
                  ),
                  Text(
                    destination.from,
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
                      destination.rating.toString(),
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
            'Detail Pesanan',
            style: TEXTSTYLES.blackTextStyle.copyWith(
              fontSize: 16,
              fontWeight: FONTWEIGHT.semiBold,
            ),
          ),
          BookingDetailItem(
            title: 'Penumpang',
            value: '$amountOfTraveler Orang',
            valueTextStyle: TEXTSTYLES.blackTextStyle.copyWith(
              fontWeight: FONTWEIGHT.semiBold,
            ),
          ),
          BookingDetailItem(
            title: 'Kursi',
            value: seat,
            valueTextStyle: TEXTSTYLES.blackTextStyle.copyWith(
              fontWeight: FONTWEIGHT.semiBold,
            ),
          ),
          BookingDetailItem(
            title: 'Asuransi',
            value: insurance == true ? 'YA' : 'TIDAK',
            valueTextStyle: insurance == true
                ? TEXTSTYLES.greenTextStyle.copyWith(
                    fontWeight: FONTWEIGHT.semiBold,
                  )
                : TEXTSTYLES.redTextStyle.copyWith(
                    fontWeight: FONTWEIGHT.semiBold,
                  ),
          ),
          BookingDetailItem(
            title: 'Refundable',
            value: refundable == true ? 'YA' : 'TIDAK',
            valueTextStyle: refundable == true
                ? TEXTSTYLES.greenTextStyle.copyWith(
                    fontWeight: FONTWEIGHT.semiBold,
                  )
                : TEXTSTYLES.redTextStyle.copyWith(
                    fontWeight: FONTWEIGHT.semiBold,
                  ),
          ),
          BookingDetailItem(
            title: 'VAT',
            value: '${(vat * 100).toStringAsFixed(0)}%',
            valueTextStyle: TEXTSTYLES.blackTextStyle.copyWith(
              fontWeight: FONTWEIGHT.semiBold,
            ),
          ),
          BookingDetailItem(
            title: 'Price',
            value: NumberFormat.currency(
              locale: 'ID',
              symbol: 'Rp. ',
              decimalDigits: 0,
            ).format(
              price,
            ),
            valueTextStyle: TEXTSTYLES.blackTextStyle.copyWith(
              fontWeight: FONTWEIGHT.semiBold,
            ),
          ),
          BookingDetailItem(
            title: 'Grand Total',
            value: NumberFormat.currency(
              locale: 'ID',
              symbol: 'Rp. ',
              decimalDigits: 0,
            ).format(
              grandTotal,
            ),
            valueTextStyle: TEXTSTYLES.primarytextStyle.copyWith(
              fontWeight: FONTWEIGHT.semiBold,
            ),
          )
        ],
      ),
    );
  }
}
