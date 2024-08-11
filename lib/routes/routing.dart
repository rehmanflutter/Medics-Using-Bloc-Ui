import 'package:flutter/material.dart';
import 'package:medical_bloc/Chat/viiew/chat_history.dart';
import 'package:medical_bloc/Login__Sign_Up/view/login.dart';
import 'package:medical_bloc/Login__Sign_Up/view/sigup.dart';
import 'package:medical_bloc/Online_Pharmacy/view/arcticles.dart';
import 'package:medical_bloc/Online_Pharmacy/view/pharmacy.dart';
import 'package:medical_bloc/Splash_Screen/view/onboarding.dart';
import 'package:medical_bloc/Splash_Screen/view/onboarding_3.dart';
import 'package:medical_bloc/Splash_Screen/view/splish.dart';
import 'package:medical_bloc/home/view/home.dart';
import 'package:medical_bloc/home/view/top_doctor.dart';
import 'package:medical_bloc/profile/view/profile.dart';
import 'package:medical_bloc/utils/bottom_appbar.dart';

class Routes {
  static final Map<String, WidgetBuilder> routes = {
    //

    '/BottomAppBarCus': (context) => BottomAppBarCus(),
    '/SplishScreen': (context) => const SplishScreen(),
    '/Onboardingscreen': (context) => Onboardingscreen(),
    '/OnboardingEnterPoint': (context) => OnboardingEnterPoint(),

    //
    '/LoginScreen': (context) => LoginScreen(),
    '/SigupScreen': (context) => const SigupScreen(),

    //

    '/HomeScreen': (context) => HomeScreen(),
    '/TopDoctors': (context) => TopDoctors(),

    // Profile
    '/ProfileScreen': (context) => ProfileScreen(),

    // Online Pharmacy

    '/Arcticles': (context) => Arcticles(),
    '/PharmacyScreen': (context) => PharmacyScreen(),
    // '/DrugsDetail': (context) => DrugsDetail(),

    //
    // chat Screens
    //

    '/ChatHistory': (context) => ChatHistory(),
  };
}
//  https://www.figma.com/design/RsxOkMSm4bglWpDy0WlRJL/Medics---Medical-App-UI-Kit-(Community)?node-id=1-730&t=lyqq77zr2ujMoGV0-0