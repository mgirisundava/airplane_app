import 'package:airplane_app/core/colors.dart';
import 'package:airplane_app/core/fonts.dart';
import 'package:airplane_app/cubit/auth/auth_cubit.dart';
import 'package:airplane_app/ui/widgets/custom_text_form_field.dart';
import 'package:airplane_app/ui/widgets/primary_button.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class AuthPage extends StatefulWidget {
  const AuthPage({Key? key}) : super(key: key);

  @override
  State<AuthPage> createState() => _AuthPageState();
}

class _AuthPageState extends State<AuthPage> {
  final TextEditingController _emailController =
      TextEditingController(text: '');
  final TextEditingController _passController = TextEditingController(text: '');
  final TextEditingController _nameController = TextEditingController(text: '');
  final TextEditingController _hobbyController =
      TextEditingController(text: '');
  bool isSignIn = false;

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
            isSignIn == false
                ? 'Lanjutkan petualanganmu\nbersama kami!'
                : 'Masuk dengan\nakun yang sudah ada',
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
        return CustomTextFormField(
          title: 'Nama Lengkap',
          hintText: 'Tony Stark',
          isObsecure: false,
          controller: _nameController,
        );
      }

      Widget emailInput() {
        return CustomTextFormField(
          title: 'Alamat Email',
          hintText: 'example@mail.com',
          isObsecure: false,
          controller: _emailController,
        );
      }

      Widget passwordInput() {
        return CustomTextFormField(
          title: 'Password',
          hintText: '********',
          isObsecure: true,
          controller: _passController,
        );
      }

      Widget hobbyInput() {
        return CustomTextFormField(
          title: 'Hobby',
          hintText: 'Melukis, Olahraga, dll.',
          isObsecure: false,
          controller: _hobbyController,
        );
      }

      Widget authMethodButton() {
        return GestureDetector(
          onTap: () {
            setState(() {
              isSignIn = !isSignIn;
            });
          },
          child: Container(
            padding: const EdgeInsets.symmetric(vertical: 50),
            width: double.infinity,
            child: Center(
              child: Text(
                isSignIn == false
                    ? 'Sudah punya akun? Masuk'
                    : 'Belum punya akun? Daftar',
                style: TEXTSTYLES.greyTextStyle.copyWith(
                  fontSize: 16,
                  fontWeight: FONTWEIGHT.light,
                  decoration: TextDecoration.underline,
                ),
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
            isSignIn == false ? nameInput() : const SizedBox(),
            isSignIn == false
                ? const SizedBox(
                    height: 20,
                  )
                : const SizedBox(),
            emailInput(),
            const SizedBox(
              height: 20,
            ),
            passwordInput(),
            isSignIn == false
                ? const SizedBox(
                    height: 20,
                  )
                : const SizedBox(),
            isSignIn == false ? hobbyInput() : const SizedBox(),
            const SizedBox(
              height: 30,
            ),
            BlocConsumer<AuthCubit, AuthState>(
              listener: (context, state) {
                if (state is AuthSuccess) {
                  Navigator.pushNamedAndRemoveUntil(context,
                      isSignIn == false ? '/bonus' : '/main', (route) => false);
                } else if (state is AuthFailed) {
                  ScaffoldMessenger.of(context).showSnackBar(SnackBar(
                    content: Text(state.error),
                    backgroundColor: COLORS.redColor,
                  ));
                }
              },
              builder: (context, state) {
                if (state is AuthLoading) {
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
                    onPressed: () {
                      isSignIn == false
                          ? context.read<AuthCubit>().signUp(
                                email: _emailController.text,
                                password: _passController.text,
                                name: _nameController.text,
                                hobby: _hobbyController.text,
                              )
                          : context.read<AuthCubit>().signIn(
                                email: _emailController.text,
                                password: _passController.text,
                              );
                    },
                    width: double.infinity,
                    height: 55,
                    title: isSignIn == false ? 'Daftar' : 'Masuk',
                  );
                }
              },
            ),
            authMethodButton(),
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
