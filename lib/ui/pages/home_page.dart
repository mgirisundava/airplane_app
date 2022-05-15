import 'package:airplane_app/core/fonts.dart';
import 'package:airplane_app/core/images.dart';
import 'package:airplane_app/ui/widgets/destination_card.dart';
import 'package:airplane_app/ui/widgets/destination_tile.dart';
import 'package:flutter/material.dart';

class HomePage extends StatelessWidget {
  const HomePage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    var size = MediaQuery.of(context).size;

    Widget header() {
      return Container(
        padding: const EdgeInsets.symmetric(
          horizontal: 24,
          vertical: 30,
        ),
        child: Row(
          children: [
            Expanded(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    'Howdy,\nMohamad Giri Sundava AFhdsbfhsdbh',
                    style: TEXTSTYLES.blackTextStyle.copyWith(
                      fontSize: 24,
                      fontWeight: FONTWEIGHT.semiBold,
                    ),
                    maxLines: 2,
                    overflow: TextOverflow.ellipsis,
                  ),
                  const SizedBox(
                    height: 6,
                  ),
                  Text(
                    'Where to fly today?',
                    style: TEXTSTYLES.greyTextStyle.copyWith(
                      fontSize: 16,
                      fontWeight: FONTWEIGHT.light,
                    ),
                  )
                ],
              ),
            ),
            const SizedBox(
              width: 30,
            ),
            Container(
              width: 60,
              height: 60,
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(100),
                image: DecorationImage(
                  image: AssetImage(IMAGES.userProfile),
                ),
              ),
            )
          ],
        ),
      );
    }

    Widget popularDestinations() {
      return SingleChildScrollView(
        scrollDirection: Axis.horizontal,
        child: Row(
          children: [
            DestinationCard(
              image: IMAGES.lakeCiliwungImage,
              title: 'Lake Ciliwung',
              subtitle: 'Tangerang',
              rating: 4.8,
            ),
            DestinationCard(
              image: IMAGES.whiteHouseImage,
              title: 'White House',
              subtitle: 'Spain',
              rating: 4.7,
            ),
            DestinationCard(
              image: IMAGES.hillHeyoImage,
              title: 'Hill Heyo',
              subtitle: 'Monaco',
              rating: 4.8,
            ),
            DestinationCard(
              image: IMAGES.menarraImage,
              title: 'Menarra',
              subtitle: 'Japan',
              rating: 5.0,
            ),
            DestinationCard(
              image: IMAGES.payungTeduhImage,
              title: 'Payung Teduh',
              subtitle: 'Singapore',
              rating: 4.8,
            ),
            const SizedBox(
              width: 24,
            ),
          ],
        ),
      );
    }

    Widget newDestination() {
      return Container(
        padding: const EdgeInsets.only(
          left: 24,
          right: 24,
          top: 30,
          bottom: 100,
        ),
        width: size.width,
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              'New This Year',
              style: TEXTSTYLES.blackTextStyle.copyWith(
                fontSize: 18,
                fontWeight: FONTWEIGHT.semiBold,
              ),
            ),
            const SizedBox(
              height: 16,
            ),
            DestinationTile(
              image: IMAGES.danauBeratanImage,
              title: 'Danau Beratan',
              subtitle: 'Singaraja',
              rating: 4.5,
            ),
            DestinationTile(
              image: IMAGES.sydneyOperaImage,
              title: 'Sydney Opera',
              subtitle: 'Australia',
              rating: 4.7,
            ),
            DestinationTile(
              image: IMAGES.romaImage,
              title: 'Roma',
              subtitle: 'Italy',
              rating: 4.8,
            ),
            DestinationTile(
              image: IMAGES.payungTeduhImage,
              title: 'Payung Teduh',
              subtitle: 'Singapore',
              rating: 4.5,
            ),
            DestinationTile(
              image: IMAGES.hillHeyoImage,
              title: 'Hill Heyo',
              subtitle: 'Monaco',
              rating: 4.7,
            ),
          ],
        ),
      );
    }

    return ListView(
      children: [
        header(),
        popularDestinations(),
        newDestination(),
      ],
    );
  }
}
