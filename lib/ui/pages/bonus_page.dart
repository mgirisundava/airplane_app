import 'package:airplane_app/core/fonts.dart';
import 'package:airplane_app/core/images.dart';
import 'package:airplane_app/cubit/page/auth/auth_cubit.dart';
import 'package:airplane_app/ui/widgets/primary_button.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../core/colors.dart';

class BonusPage extends StatelessWidget {
  const BonusPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    Widget bonusCard() {
      return Container(
        padding: const EdgeInsets.all(24),
        width: 300,
        height: 211,
        decoration: BoxDecoration(
          image: DecorationImage(
            image: AssetImage(IMAGES.cardBackground),
          ),
          boxShadow: [
            BoxShadow(
              color: COLORS.primaryColor.withOpacity(0.5),
              blurRadius: 50,
              offset: const Offset(0, 10),
            ),
          ],
        ),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Row(
              children: [
                Expanded(
                  flex: 2,
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        'Name',
                        style: TEXTSTYLES.whiteTextStyle.copyWith(
                          fontWeight: FONTWEIGHT.light,
                        ),
                      ),
                      BlocBuilder<AuthCubit, AuthState>(
                        builder: (context, user) {
                          if (user is AuthSuccess) {
                            return Text(
                              user.user.name ?? '',
                              style: TEXTSTYLES.whiteTextStyle.copyWith(
                                fontSize: 20,
                                fontWeight: FONTWEIGHT.medium,
                              ),
                              maxLines: 2,
                              overflow: TextOverflow.ellipsis,
                            );
                          } else if (user is AuthFailed) {
                            return const SizedBox();
                          } else {
                            return Text(
                              '...',
                              style: TEXTSTYLES.whiteTextStyle.copyWith(
                                fontSize: 20,
                                fontWeight: FONTWEIGHT.medium,
                              ),
                              maxLines: 2,
                              overflow: TextOverflow.ellipsis,
                            );
                          }
                        },
                      ),
                    ],
                  ),
                ),
                Expanded(
                  flex: 1,
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.end,
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Container(
                        width: 24,
                        height: 24,
                        decoration: BoxDecoration(
                          image: DecorationImage(
                            image: AssetImage(IMAGES.logo),
                          ),
                        ),
                      ),
                      const SizedBox(
                        width: 6,
                      ),
                      Text(
                        'Pay',
                        style: TEXTSTYLES.whiteTextStyle.copyWith(
                          fontSize: 16,
                          fontWeight: FONTWEIGHT.medium,
                        ),
                      ),
                    ],
                  ),
                ),
              ],
            ),
            const Spacer(),
            Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  'Name',
                  style: TEXTSTYLES.whiteTextStyle.copyWith(
                    fontWeight: FONTWEIGHT.light,
                  ),
                ),
                Text(
                  'IDR 28.000.000',
                  style: TEXTSTYLES.whiteTextStyle.copyWith(
                    fontSize: 26,
                    fontWeight: FONTWEIGHT.medium,
                  ),
                  maxLines: 1,
                  overflow: TextOverflow.ellipsis,
                ),
              ],
            ),
          ],
        ),
      );
    }

    Widget title() {
      return Container(
        padding: const EdgeInsets.only(
          top: 80,
          bottom: 10,
        ),
        width: double.infinity,
        child: Center(
          child: Text(
            'Big Bonus 🎉',
            style: TEXTSTYLES.blackTextStyle.copyWith(
              fontSize: 32,
              fontWeight: FONTWEIGHT.semiBold,
            ),
          ),
        ),
      );
    }

    Widget subtitle() {
      return SizedBox(
        width: double.infinity,
        child: Center(
          child: Text(
            'We give you early credit so that\nyou can buy a flight ticket',
            style: TEXTSTYLES.greyTextStyle.copyWith(
              fontSize: 16,
              fontWeight: FONTWEIGHT.light,
            ),
            textAlign: TextAlign.center,
          ),
        ),
      );
    }

    return Scaffold(
      backgroundColor: COLORS.bgColor,
      body: Center(
        child: SingleChildScrollView(
          child: SafeArea(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                const SizedBox(
                  height: 50,
                ),
                bonusCard(),
                title(),
                subtitle(),
                const SizedBox(
                  height: 50,
                ),
                PrimaryButton(
                  onPressed: () {
                    Navigator.pushNamedAndRemoveUntil(
                        context, '/main', (route) => false);
                  },
                  width: 220,
                  height: 55,
                  title: 'Start Fly Now',
                ),
                const SizedBox(
                  height: 50,
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
