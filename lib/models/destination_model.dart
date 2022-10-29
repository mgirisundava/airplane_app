import 'package:equatable/equatable.dart';

class DestinationModel extends Equatable {
  final String id;
  final String name;
  final String from;
  final String imageUrl;
  final int price;
  final num rating;
  final String about;
  final List<dynamic>? destinationPhotos;

  const DestinationModel({
    required this.id,
    this.name = '',
    this.from = '',
    this.imageUrl = '',
    this.price = 0,
    this.rating = 0.0,
    this.about = '',
    this.destinationPhotos,
  });

  factory DestinationModel.fromJson(String id, Map<String, dynamic> json) =>
      DestinationModel(
        id: id,
        name: json['name'],
        from: json['from'],
        imageUrl: json['imageUrl'],
        price: json['price'],
        rating: json['rating'],
        about: json['about'],
        destinationPhotos: json['destination_photos'] ?? [],
      );

  Map<String, dynamic> toJson() => {
        'id': id,
        'name': name,
        'from': from,
        'imageUrl': imageUrl,
        'price': price,
        'rating': rating,
        'about': about,
        'destination_photos': destinationPhotos,
      };

  @override
  List<Object?> get props => [id, name, imageUrl, price, rating];
}
