import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../core/colors.dart';
import '../../core/fonts.dart';
import '../../core/images.dart';
import '../../cubit/auth/auth_cubit.dart';

class WalletPage extends StatefulWidget {
  const WalletPage({Key? key}) : super(key: key);

  @override
  State<WalletPage> createState() => _WalletPageState();
}

class _WalletPageState extends State<WalletPage> {
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

    return Center(
      child: bonusCard(),
    );
  }
}
