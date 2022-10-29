import 'package:airplane_app/core/colors.dart';
import 'package:airplane_app/core/images.dart';
import 'package:airplane_app/page/page_cubit.dart';
import 'package:airplane_app/ui/pages/home_page.dart';
import 'package:airplane_app/ui/pages/setting_page.dart';
import 'package:airplane_app/ui/pages/transaction_page.dart';
import 'package:airplane_app/ui/pages/wallet_page.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../widgets/bottom_navigation_item.dart';

class MainPage extends StatelessWidget {
  const MainPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    Widget buildContent(int index) {
      switch (index) {
        case 0:
          return const HomePage();
        case 1:
          return const TransactionPage();
        case 2:
          return const WalletPage();
        case 3:
          return const SettingPage();

        default:
          return const HomePage();
      }
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
                  index: 0,
                  image: IMAGES.selectedGlobeIcon,
                  isSelected: true,
                ),
                BottomNavigationItem(
                  index: 1,
                  image: IMAGES.bookIcon,
                  isSelected: false,
                ),
                BottomNavigationItem(
                  index: 2,
                  image: IMAGES.creditCardIcon,
                  isSelected: false,
                ),
                BottomNavigationItem(
                  index: 3,
                  image: IMAGES.settingIcon,
                  isSelected: false,
                ),
              ],
            ),
          ),
        ),
      );
    }

    return BlocBuilder<PageCubit, int>(
      builder: (context, currentIndex) {
        return Scaffold(
          backgroundColor: COLORS.bgColor,
          body: Stack(children: [
            buildContent(currentIndex),
            customBottomNavigation(),
          ]),
        );
      },
    );
  }
}
