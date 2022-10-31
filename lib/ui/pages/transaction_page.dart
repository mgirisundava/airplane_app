import 'package:airplane_app/core/colors.dart';
import 'package:airplane_app/cubit/transaction/transaction_cubit.dart';
import 'package:airplane_app/ui/pages/transaction_card.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class TransactionPage extends StatefulWidget {
  const TransactionPage({Key? key}) : super(key: key);

  @override
  State<TransactionPage> createState() => _TransactionPageState();
}

class _TransactionPageState extends State<TransactionPage> {
  @override
  void initState() {
    super.initState();
    context.read<TransactionCubit>().getTransactions();
  }

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<TransactionCubit, TransactionState>(
      builder: (context, transactions) {
        if (transactions is TransactionSuccess) {
          var data = transactions.transactions;

          return ListView.builder(
              padding: const EdgeInsets.only(
                  left: 24, top: 30, right: 24, bottom: 100),
              itemCount: data.length,
              itemBuilder: (context, index) => TransactionCard(
                    destination: data[index].destination,
                    amountOfTraveler: data[index].amountOfTraveler,
                    seat: data[index].seat,
                    insurance: data[index].insurance,
                    refundable: data[index].refundable,
                    vat: data[index].vat,
                    price: data[index].price,
                    grandTotal: data[index].grandTotal,
                  ));
        } else if (transactions is TransactionFailed) {
          return Center(
            child: Text(transactions.error),
          );
        } else {
          return Center(
            child: CircularProgressIndicator(
              color: COLORS.primaryColor,
            ),
          );
        }
      },
    );
  }
}
