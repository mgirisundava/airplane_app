import 'package:airplane_app/core/colors.dart';
import 'package:airplane_app/core/images.dart';
import 'package:airplane_app/ui/pages/home_page.dart';
import 'package:flutter/material.dart';

import '../widgets/bottom_navigation_item.dart';

class MainPage extends StatelessWidget {
  const MainPage({Key? key}) : super(key: key);

  static const routeName = 'main-page';

  @override
  Widget build(BuildContext context) {
    Widget buildContent() {
      return const HomePage();
    }

    Widget customBottomNavigation() {
      return SafeArea(
        child: Align(
          alignment: Alignment.bottomCenter,
          child: Container(
            margin: const EdgeInsets.symmetric(
              horizontal: 24,
              vertical: 30,
            ),
            width: double.infinity,
            height: 60,
            decoration: BoxDecoration(
              color: COLORS.whiteColor,
              borderRadius: BorderRadius.circular(18),
            ),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceAround,
              children: [
                BottomNavigationItem(
                  image: IMAGES.selectedGlobeIcon,
                  isSelected: true,
                ),
                BottomNavigationItem(
                  image: IMAGES.bookIcon,
                  isSelected: false,
                ),
                BottomNavigationItem(
                  image: IMAGES.creditCardIcon,
                  isSelected: false,
                ),
                BottomNavigationItem(
                  image: IMAGES.settingIcon,
                  isSelected: false,
                ),
              ],
            ),
          ),
        ),
      );
    }

    return Scaffold(
      backgroundColor: COLORS.bgColor,
      body: Stack(children: [
        buildContent(),
        customBottomNavigation(),
      ]),
    );
  }
}
