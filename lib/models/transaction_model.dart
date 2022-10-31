import 'package:airplane_app/models/destination_model.dart';
import 'package:equatable/equatable.dart';

class TransactionModel extends Equatable {
  final String id;
  final DestinationModel destination;
  final int amountOfTraveler;
  final String seat;
  final bool insurance;
  final bool refundable;
  final double vat;
  final int price;
  final int grandTotal;

  const TransactionModel({
    this.id = '',
    required this.destination,
    this.amountOfTraveler = 0,
    this.seat = '',
    this.insurance = false,
    this.refundable = false,
    this.vat = 0.0,
    this.price = 0,
    this.grandTotal = 0,
  });

  @override
  List<Object?> get props => [
        id,
        destination,
        amountOfTraveler,
        seat,
        insurance,
        refundable,
        vat,
        price,
        grandTotal,
      ];

  factory TransactionModel.fromJson(String id, Map<String, dynamic> json) =>
      TransactionModel(
        id: id,
        destination: DestinationModel.fromJson(
            json['destination']['id'], json['destination']),
        amountOfTraveler: json['amount_of_traveler'],
        seat: json['seat'],
        insurance: json['insurance'],
        refundable: json['refundable'],
        vat: json['vat'],
        price: json['price'],
        grandTotal: json['grand_total'],
      );
}
