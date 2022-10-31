import 'package:airplane_app/core/fonts.dart';
import 'package:airplane_app/cubit/auth/auth_cubit.dart';
import 'package:airplane_app/cubit/seat/seat_cubit.dart';
import 'package:airplane_app/cubit/transaction/transaction_cubit.dart';
import 'package:airplane_app/models/transaction_model.dart';
import 'package:airplane_app/ui/widgets/primary_button.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:intl/intl.dart';

import '../../core/colors.dart';
import '../../core/images.dart';

class CheckoutPage extends StatelessWidget {
  const CheckoutPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    var transactionData =
        ModalRoute.of(context)!.settings.arguments as TransactionModel;
    int? currentBalance;

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
                          'MULAI',
                          style: TEXTSTYLES.blackTextStyle.copyWith(
                            fontSize: 24,
                            fontWeight: FONTWEIGHT.semiBold,
                          ),
                        ),
                        Text(
                          'Posisi Anda',
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
                          'AKHIR',
                          style: TEXTSTYLES.blackTextStyle.copyWith(
                            fontSize: 24,
                            fontWeight: FONTWEIGHT.semiBold,
                          ),
                        ),
                        Text(
                          transactionData.destination.name,
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
                      image: NetworkImage(transactionData.destination.imageUrl),
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
                      transactionData.destination.name,
                      style: TEXTSTYLES.blackTextStyle.copyWith(
                        fontSize: 18,
                        fontWeight: FONTWEIGHT.medium,
                      ),
                    ),
                    const SizedBox(
                      height: 5,
                    ),
                    Text(
                      transactionData.destination.from,
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
                        transactionData.destination.rating.toString(),
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
            BlocBuilder<SeatCubit, List<String>>(
              builder: (context, seat) {
                return BookingDetailItem(
                  title: 'Penumpang',
                  value: '${seat.length} Orang',
                  valueTextStyle: TEXTSTYLES.blackTextStyle.copyWith(
                    fontWeight: FONTWEIGHT.semiBold,
                  ),
                );
              },
            ),
            BookingDetailItem(
              title: 'Kursi',
              value: transactionData.seat,
              valueTextStyle: TEXTSTYLES.blackTextStyle.copyWith(
                fontWeight: FONTWEIGHT.semiBold,
              ),
            ),
            BookingDetailItem(
              title: 'Asuransi',
              value: transactionData.insurance == true ? 'YA' : 'TIDAK',
              valueTextStyle: transactionData.insurance == true
                  ? TEXTSTYLES.greenTextStyle.copyWith(
                      fontWeight: FONTWEIGHT.semiBold,
                    )
                  : TEXTSTYLES.redTextStyle.copyWith(
                      fontWeight: FONTWEIGHT.semiBold,
                    ),
            ),
            BookingDetailItem(
              title: 'Refundable',
              value: transactionData.refundable == true ? 'YA' : 'TIDAK',
              valueTextStyle: transactionData.refundable == true
                  ? TEXTSTYLES.greenTextStyle.copyWith(
                      fontWeight: FONTWEIGHT.semiBold,
                    )
                  : TEXTSTYLES.redTextStyle.copyWith(
                      fontWeight: FONTWEIGHT.semiBold,
                    ),
            ),
            BookingDetailItem(
              title: 'VAT',
              value: '${(transactionData.vat * 100).toStringAsFixed(0)}%',
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
                transactionData.price,
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
                transactionData.grandTotal,
              ),
              valueTextStyle: TEXTSTYLES.primarytextStyle.copyWith(
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
              'Detail Pembayaran',
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
                    BlocBuilder<AuthCubit, AuthState>(
                      builder: (context, user) {
                        if (user is AuthSuccess) {
                          currentBalance = user.user.balance;

                          return Text(
                            NumberFormat.currency(
                              locale: 'ID',
                              symbol: 'Rp. ',
                              decimalDigits: 0,
                            ).format(
                              user.user.balance,
                            ),
                            style: TEXTSTYLES.blackTextStyle.copyWith(
                              fontSize: 18,
                              fontWeight: FONTWEIGHT.medium,
                            ),
                          );
                        } else {
                          return Text(
                            '-',
                            style: TEXTSTYLES.blackTextStyle.copyWith(
                              fontSize: 18,
                              fontWeight: FONTWEIGHT.medium,
                            ),
                          );
                        }
                      },
                    ),
                    const SizedBox(
                      height: 5,
                    ),
                    Text(
                      'Saldo Anda',
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
              title: 'Bayar Sekarang',
              onPressed: () {
                if ((currentBalance ?? 0) < transactionData.grandTotal) {
                  ScaffoldMessenger.of(context).showSnackBar(SnackBar(
                    content: const Text('Saldo anda saat ini tidak cukup!'),
                    backgroundColor: COLORS.redColor,
                  ));
                } else {
                  showDialog<String>(
                    context: context,
                    builder: (BuildContext context) => AlertDialog(
                      title: const Text('Konfirmasi'),
                      content: const Text('Apakah pesanan sudah sesuai?'),
                      actions: <Widget>[
                        TextButton(
                          onPressed: () => Navigator.pop(context, 'BELUM'),
                          child: const Text('BELUM'),
                        ),
                        TextButton(
                          onPressed: () => context
                              .read<TransactionCubit>()
                              .createTransaction(transactionData),
                          child: const Text('SUDAH'),
                        ),
                      ],
                    ),
                  );

                  // Navigator.pushNamed(context, '/booked');
                }
              },
            ),
            const SizedBox(
              height: 30,
            ),

            // NOTE : TAC BUTTON

            // SizedBox(
            //   width: double.infinity,
            //   child: Center(
            //     child: Text(
            //       'Term and Condition',
            //       style: TEXTSTYLES.greyTextStyle.copyWith(
            //         fontSize: 16,
            //         fontWeight: FONTWEIGHT.light,
            //         decoration: TextDecoration.underline,
            //       ),
            //     ),
            //   ),
            // ),
          ],
        ),
      );
    }

    return BlocListener<TransactionCubit, TransactionState>(
      listener: (context, transaction) {
        if (transaction is TransactionSuccess) {
          Navigator.pushNamed(context, '/booked');
        } else if (transaction is TransactionFailed) {
          ScaffoldMessenger.of(context).showSnackBar(SnackBar(
            content: Text(transaction.error),
            backgroundColor: COLORS.redColor,
          ));
        }
      },
      child: Scaffold(
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
