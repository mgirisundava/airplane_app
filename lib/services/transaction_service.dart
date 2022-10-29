// ignore_for_file: use_rethrow_when_possible

import 'package:airplane_app/models/transaction_model.dart';
import 'package:cloud_firestore/cloud_firestore.dart';

class TransactionService {
  final CollectionReference _transactionRef =
      FirebaseFirestore.instance.collection('transactions');

  Future<void> createTransaction(TransactionModel transaction) async {
    try {
      _transactionRef.add({
        'destination': transaction.destination.toJson(),
        'amount_of_traveler': transaction.amountOfTraveler,
        'seat': transaction.seat,
        'insurance': transaction.insurance,
        'refundable': transaction.refundable,
        'vat': transaction.vat,
        'price': transaction.price,
        'grand_total': transaction.grandTotal,
      });
    } catch (e) {
      throw e;
    }
  }
}
