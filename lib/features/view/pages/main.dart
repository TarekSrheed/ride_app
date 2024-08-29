import 'package:flutter/material.dart';

import 'package:rideshare_app/features/view/pages/authentication/Complete_your_profile_view.dart';
import 'package:rideshare_app/features/view/pages/Transport/cycle_details.dart';
import 'package:rideshare_app/features/view/pages/favourite/favourite.dart';
import 'package:rideshare_app/features/view/pages/onboarding/onboarding_view.dart';
import 'package:rideshare_app/features/view/pages/Transport/request_rent.dart';
import 'package:rideshare_app/features/view/pages/Transport/request_rent_charge.dart';
import 'package:rideshare_app/features/view/pages/Transport/select_avaiable_car.dart';
import 'package:rideshare_app/features/view/pages/Transport/select_avaiable_cycle_list.dart';
import 'package:rideshare_app/features/view/pages/Transport/select_transport.dart';
import 'package:rideshare_app/features/view/pages/authentication/set_password_view.dart';
import 'package:rideshare_app/features/view/pages/authentication/sign_in.dart';
import 'package:rideshare_app/features/view/pages/authentication/sing_up_view.dart';
import 'package:rideshare_app/features/view/pages/Transport/thank_you.dart';
import 'package:rideshare_app/features/view/pages/authentication/welcome_view.dart';
import 'package:rideshare_app/features/view/pages/widget.dart/bottom_navgition_bar.dart';

import 'package:rideshare_app/features/view/widget/bottom.dart';

void main(List<String> args) {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      routes: {
        // '/OnboardingView': (context) => OnboardingView(),
        // '/WelcomView': (context) => WelcomView(),
        // '/SingUpView': (context) => SingUpView(),
        // '/SetPasswordView': (context) => SetPasswordView(),
        // '/CompleteYourProfile': (context) => CompleteYourProfile(),
        // '/SelectTransport': (context) => SelectTransport(),
      },
      home: BottomNavgitionBar(),
    );
  }
}
