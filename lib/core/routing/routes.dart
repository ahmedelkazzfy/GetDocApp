import 'package:flutter/material.dart';
import 'package:medicalassiss/core/routing/routes_name.dart';
import 'package:medicalassiss/features/chatbot/bot.dart';
import 'package:medicalassiss/features/doctor_features/doctor_home/doctor_home.dart';
import 'package:medicalassiss/features/doctor_features/doctor_profile/doctor_profile.dart';
import 'package:medicalassiss/features/onboarding/onboarding_screen.dart';
import 'package:medicalassiss/features/user_features/docots_details/doctors_details.dart';
import 'package:medicalassiss/features/auth/login.dart';
import 'package:medicalassiss/features/auth/register.dart';
import 'package:medicalassiss/features/auth/userinfo.dart';
import 'package:medicalassiss/features/user_features/history/history.dart';
import 'package:medicalassiss/features/user_features/user_home/bottom_nav_bar/bottm_nav_bar.dart';
import 'package:medicalassiss/features/splash/splash_screen.dart';

class Routes {
  static Route<dynamic> generateRoute(RouteSettings settings) {
    switch (settings.name) {
      case RoutesName.splash:
        return MaterialPageRoute(
            builder: (BuildContext context) => const SplashScreen());

      case RoutesName.onboarding:
        return MaterialPageRoute(
            builder: (BuildContext context) => const OnBoardingScreen());

      case RoutesName.login:
        return MaterialPageRoute(
            builder: (BuildContext context) => const Login());

      case RoutesName.signup:
        return MaterialPageRoute(
            builder: (BuildContext context) => const Signup());

      case RoutesName.userinfo:
        return MaterialPageRoute(
            builder: (BuildContext context) => UserInfoPage());

      case RoutesName.home:
        return MaterialPageRoute(
            builder: (BuildContext context) => const Home());

      case RoutesName.history:
        return MaterialPageRoute(
            builder: (BuildContext context) => const HistoryPage());

      case RoutesName.chatbot:
        return MaterialPageRoute(
            builder: (BuildContext context) => const ChatScreen());

      case RoutesName.doctorsDetails:
        return MaterialPageRoute(
            builder: (BuildContext context) => DoctorsDetails());

      case RoutesName.doctorHomePage:
        return MaterialPageRoute(
            builder: (BuildContext context) => const DoctorHomePage());

      case RoutesName.doctorProfilePage:
        return MaterialPageRoute(
            builder: (BuildContext context) => const DoctorProfilePage());

      default:
        return MaterialPageRoute(builder: (_) {
          return const Scaffold(
            body: Center(
              child: Text('No route defined'),
            ),
          );
        });
    }
  }
}
