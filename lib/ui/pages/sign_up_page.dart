import 'package:airplane_app/core/colors.dart';
import 'package:airplane_app/core/fonts.dart';
import 'package:airplane_app/ui/pages/bonus_page.dart';
import 'package:airplane_app/ui/widgets/custom_text_form_field.dart';
import 'package:airplane_app/ui/widgets/primary_button.dart';
import 'package:flutter/material.dart';

class SignUpPage extends StatelessWidget {
  const SignUpPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    Widget title() {
      return SafeArea(
        child: Container(
          margin: const EdgeInsets.only(
            top: 30,
            left: 24,
            right: 24,
            bottom: 30,
          ),
          width: double.infinity,
          child: Text(
            'Join us and get\nyour next journey',
            style: TEXTSTYLES.blackTextStyle.copyWith(
              fontSize: 24,
              fontWeight: FONTWEIGHT.semiBold,
            ),
          ),
        ),
      );
    }

    Widget inputSection() {
      Widget nameInput() {
        return const CustomTextFormField(
          title: 'Full Name',
          hintText: 'Your Full Name',
          isObsecure: false,
        );
      }

      Widget emailInput() {
        return const CustomTextFormField(
          title: 'Email Address',
          hintText: 'Your Email Address',
          isObsecure: false,
        );
      }

      Widget passwordInput() {
        return const CustomTextFormField(
          title: 'Password',
          hintText: 'Your Password',
          isObsecure: true,
        );
      }

      Widget hobbyInput() {
        return const CustomTextFormField(
          title: 'Hobby',
          hintText: 'Your Hobby',
          isObsecure: false,
        );
      }

      Widget tacButton() {
        return Container(
          padding: const EdgeInsets.symmetric(vertical: 50),
          width: double.infinity,
          child: Center(
            child: Text(
              'Term and Condition',
              style: TEXTSTYLES.greyTextStyle.copyWith(
                fontSize: 16,
                fontWeight: FONTWEIGHT.light,
                decoration: TextDecoration.underline,
              ),
            ),
          ),
        );
      }

      return Container(
        margin: const EdgeInsets.symmetric(horizontal: 24),
        padding: const EdgeInsets.symmetric(
          vertical: 30,
          horizontal: 20,
        ),
        width: double.infinity,
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            nameInput(),
            const SizedBox(
              height: 20,
            ),
            emailInput(),
            const SizedBox(
              height: 20,
            ),
            passwordInput(),
            const SizedBox(
              height: 20,
            ),
            hobbyInput(),
            const SizedBox(
              height: 30,
            ),
            PrimaryButton(
              onPressed: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(
                    builder: (context) => const BonusPage(),
                  ),
                );
              },
              width: double.infinity,
              height: 55,
              title: 'Get Started',
            ),
            tacButton(),
          ],
        ),
      );
    }

    return Scaffold(
      backgroundColor: COLORS.bgColor,
      body: ListView(
        children: [
          title(),
          inputSection(),
        ],
      ),
    );
  }
}
