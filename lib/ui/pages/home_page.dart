import 'package:airplane_app/behavior/remove_scroll_glow.dart';
import 'package:airplane_app/core/colors.dart';
import 'package:airplane_app/core/fonts.dart';
import 'package:airplane_app/cubit/auth/auth_cubit.dart';
import 'package:airplane_app/cubit/destinations/destination_cubit.dart';
import 'package:airplane_app/ui/widgets/destination_card.dart';
import 'package:airplane_app/ui/widgets/destination_tile.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../cubit/newdestinations/new_destination_cubit.dart';
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
    context.read<NewDestinationCubit>().getNewDestinations();
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
                    'Mau terbang ke mana hari ini?',
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
            return SizedBox(
              height: 323,
              child: Center(
                child: CircularProgressIndicator(color: COLORS.primaryColor),
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
              'Destinasi Terbaru',
              style: TEXTSTYLES.blackTextStyle.copyWith(
                fontSize: 18,
                fontWeight: FONTWEIGHT.semiBold,
              ),
            ),
            const SizedBox(
              height: 16,
            ),
            BlocBuilder<NewDestinationCubit, NewDestinationState>(
              builder: (context, newDestination) {
                if (newDestination is NewDestinationSuccess) {
                  var data = newDestination.newDestinations;
                  return ListView.builder(
                      shrinkWrap: true,
                      physics: const NeverScrollableScrollPhysics(),
                      itemCount: 1,
                      itemBuilder: (context, index) => GestureDetector(
                            onTap: () {
                              Navigator.pushNamed(
                                context,
                                '/detail_destination',
                                arguments: data[index],
                              );
                            },
                            child: Container(
                              margin: EdgeInsets.only(top: index == 0 ? 0 : 16),
                              child: DestinationTile(
                                image: data[index].imageUrl,
                                title: data[index].name,
                                subtitle: data[index].from,
                                rating: data[index].rating,
                              ),
                            ),
                          ));
                } else if (newDestination is NewDestinationFailed) {
                  return SizedBox(
                    height: 90,
                    child: Text(newDestination.error),
                  );
                } else {
                  return SizedBox(
                    height: 90,
                    child: Center(
                      child:
                          CircularProgressIndicator(color: COLORS.primaryColor),
                    ),
                  );
                }
              },
            )
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
              context.read<NewDestinationCubit>().getNewDestinations();
            },
            color: COLORS.primaryColor,
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
          return Center(
            child: CircularProgressIndicator(color: COLORS.primaryColor),
          );
        }
      },
    );
  }
}
