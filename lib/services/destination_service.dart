// ignore_for_file: use_rethrow_when_possible

import 'package:airplane_app/models/destination_model.dart';
import 'package:cloud_firestore/cloud_firestore.dart';

class DestinationService {
  final CollectionReference _destinationReference =
      FirebaseFirestore.instance.collection('destinations');

  Future<List<DestinationModel>> getDestinations() async {
    try {
      QuerySnapshot _res = await _destinationReference.get();
      List<DestinationModel> _destinations = _res.docs.map((e) {
        return
            // DestinationModel(
            //   id: e.id,
            //   name: e['name'] ?? '',
            //   from: e['from'] ?? '',
            //   imageUrl: e['imageUrl'] ?? '',
            //   price: e['price'] ?? 0,
            //   rating: e['rating'] ?? 0.0,
            //   about: e['about'] ?? '',
            //   destinationPhotos: e['destination_photos'] ?? [],
            // );

            DestinationModel.fromJson(e.id, e.data() as Map<String, dynamic>);
      }).toList();

      return _destinations;
    } catch (e) {
      throw e;
    }
  }
}
