import 'package:airplane_app/behavior/remove_scroll_glow.dart';
import 'package:airplane_app/core/fonts.dart';
import 'package:airplane_app/core/images.dart';
import 'package:airplane_app/cubit/auth/auth_cubit.dart';
import 'package:airplane_app/cubit/destinations/destination_cubit.dart';
import 'package:airplane_app/ui/widgets/destination_card.dart';
import 'package:airplane_app/ui/widgets/destination_tile.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../models/user_model.dart';

class HomePage extends StatefulWidget {
  const HomePage({Key? key}) : super(key: key);

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  @override
  void initState() {
    super.initState();
    context.read<DestinationCubit>().getDestinations();
  }

  @override
  Widget build(BuildContext context) {
    Widget header(UserModel userData) {
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
                    'Halo,\n${userData.name ?? ''}',
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
                    'Mau terbang kemana hari ini?',
                    style: TEXTSTYLES.greyTextStyle.copyWith(
                      fontSize: 16,
                      fontWeight: FONTWEIGHT.light,
                    ),
                  )
                ],
              ),
            ),
          ],
        ),
      );
    }

    Widget popularDestinations() {
      return BlocBuilder<DestinationCubit, DestinationState>(
        builder: (context, destinations) {
          if (destinations is DestinationSuccess) {
            var data = destinations.destinations;

            return SizedBox(
              height: 323,
              child: ScrollConfiguration(
                behavior: RemoveScrollGlow(),
                child: ListView.builder(
                  scrollDirection: Axis.horizontal,
                  itemCount: data.length,
                  itemBuilder: (context, index) => Container(
                    padding: EdgeInsets.only(left: index == 0 ? 24 : 0),
                    child: GestureDetector(
                      onTap: () {
                        Navigator.pushNamed(
                          context,
                          '/detail_destination',
                          arguments: data[index],
                        );
                      },
                      child: DestinationCard(
                        image: data[index].imageUrl,
                        title: data[index].name,
                        subtitle: data[index].from,
                        rating: data[index].rating,
                      ),
                    ),
                  ),
                ),
              ),
            );
          } else if (destinations is DestinationFailed) {
            return SizedBox(
              height: 323,
              child: Center(
                child: Text(
                  destinations.error,
                  textAlign: TextAlign.center,
                ),
              ),
            );
          } else {
            return const SizedBox(
              height: 323,
              child: Center(
                child: CircularProgressIndicator(),
              ),
            );
          }
        },
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
        width: double.infinity,
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

    return BlocBuilder<AuthCubit, AuthState>(
      builder: (context, auth) {
        if (auth is AuthSuccess) {
          var userData = auth.user;

          return RefreshIndicator(
            onRefresh: () async {
              context.read<DestinationCubit>().getDestinations();
            },
            child: ListView(
              children: [
                header(userData),
                popularDestinations(),
                newDestination(),
              ],
            ),
          );
        } else if (auth is AuthFailed) {
          return Center(child: Text(auth.error));
        } else {
          return const Center(child: CircularProgressIndicator());
        }
      },
    );
  }
}
