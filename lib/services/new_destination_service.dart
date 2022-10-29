// ignore_for_file: use_rethrow_when_possible

import 'package:airplane_app/models/destination_model.dart';
import 'package:cloud_firestore/cloud_firestore.dart';

class NewDestinationService {
  final CollectionReference _destinationReference =
      FirebaseFirestore.instance.collection('new_destinations');

  Future<List<DestinationModel>> getNewDestinations() async {
    try {
      QuerySnapshot _res = await _destinationReference.get();
      List<DestinationModel> _destinations = _res.docs.map((e) {
        return DestinationModel(
          id: e.id,
          name: e['name'] ?? '',
          from: e['from'] ?? '',
          imageUrl: e['imageUrl'] ?? '',
          price: e['price'] ?? 0,
          rating: e['rating'] ?? 0.0,
          about: e['about'] ?? '',
          destinationPhotos: e['destination_photos'] ?? [],
        );
      }).toList();

      return _destinations;
    } catch (e) {
      throw e;
    }
  }
}
