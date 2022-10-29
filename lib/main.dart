import 'package:airplane_app/cubit/auth/auth_cubit.dart';
import 'package:airplane_app/cubit/destinations/destination_cubit.dart';
import 'package:airplane_app/cubit/seat/seat_cubit.dart';
import 'package:airplane_app/page/page_cubit.dart';
import 'package:airplane_app/ui/pages/bonus_page.dart';
import 'package:airplane_app/ui/pages/booked_page.dart';
import 'package:airplane_app/ui/pages/checkout_page.dart';
import 'package:airplane_app/ui/pages/choose_seat_page.dart';
import 'package:airplane_app/ui/pages/detail_page.dart';
import 'package:airplane_app/ui/pages/get_started_page.dart';
import 'package:airplane_app/ui/pages/main_page.dart';
import 'package:airplane_app/ui/pages/auth_page.dart';
import 'package:airplane_app/ui/pages/photo_page.dart';
import 'package:airplane_app/ui/pages/splash_page.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import 'cubit/newdestinations/new_destination_cubit.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp();

  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MultiBlocProvider(
      providers: [
        BlocProvider(create: (context) => PageCubit()),
        BlocProvider(create: (context) => AuthCubit()),
        BlocProvider(create: (context) => DestinationCubit()),
        BlocProvider(create: (context) => NewDestinationCubit()),
        BlocProvider(create: (context) => SeatCubit()),
      ],
      child: MaterialApp(
        debugShowCheckedModeBanner: false,
        routes: {
          '/': (context) => const SplashPage(),
          '/get-started': (context) => const GetStartedPage(),
          '/auth': (context) => const AuthPage(),
          '/bonus': (context) => const BonusPage(),
          '/main': (context) => const MainPage(),
          '/detail_destination': (context) => const DetailPage(),
          '/photo': (context) => const PhotoPage(),
          '/choose_seat': (context) => const ChooseSeatPage(),
          '/checkout': (context) => const CheckoutPage(),
          '/booked': (context) => const BookedPage(),
        },
        initialRoute: '/',
      ),
    );
  }
}
