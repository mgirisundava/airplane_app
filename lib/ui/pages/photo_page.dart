import 'package:airplane_app/core/colors.dart';
import 'package:flutter/material.dart';
import 'package:photo_view/photo_view.dart';

class PhotoPage extends StatelessWidget {
  const PhotoPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    var photo = ModalRoute.of(context)!.settings.arguments as String;

    return Scaffold(
      appBar: AppBar(backgroundColor: COLORS.primaryColor),
      backgroundColor: COLORS.blackColor,
      body: PhotoView(
        imageProvider: NetworkImage(photo),
      ),
    );
  }
}
