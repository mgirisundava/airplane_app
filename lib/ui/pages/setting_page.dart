import 'package:airplane_app/core/colors.dart';
import 'package:airplane_app/ui/widgets/primary_button.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../cubit/page/auth/auth_cubit.dart';
import '../../cubit/page/page_cubit.dart';

class SettingPage extends StatelessWidget {
  const SettingPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return BlocListener<AuthCubit, AuthState>(
      listener: (context, signOut) {
        if (signOut is AuthFailed) {
          ScaffoldMessenger.of(context).showSnackBar(SnackBar(
            content: Text(signOut.error),
            backgroundColor: COLORS.redColor,
          ));
        } else if (signOut is AuthInitial) {
          Navigator.pushNamedAndRemoveUntil(
              context, '/get-started', (route) => false);
        }
      },
      child: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 24),
        child: Center(
          child: BlocBuilder<AuthCubit, AuthState>(
            builder: (context, signOut) {
              if (signOut is AuthLoading) {
                return SizedBox(
                  height: 55,
                  child: Center(
                    child: LinearProgressIndicator(
                      color: COLORS.primaryColor,
                      minHeight: 5,
                    ),
                  ),
                );
              } else {
                return PrimaryButton(
                  title: 'Sign Out',
                  width: 220,
                  onPressed: () {
                    context.read<AuthCubit>().signOut();
                    context.read<PageCubit>().setPage(0);
                  },
                );
              }
            },
          ),
        ),
      ),
    );
  }
}
