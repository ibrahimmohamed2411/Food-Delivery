import 'package:flutter/material.dart';
import 'package:food_delivery/features/user/presentation/screens/forget_password_screen.dart';
import 'package:food_delivery/features/user/presentation/screens/sign_up_screen.dart';
import 'package:food_delivery/landing_screen.dart';

class AppRoutes {
  static const String landingScreen = '/';
  static const String signUpScreen = '/signUp';
  static const String forgetPasswordScreen = '/forgetPassword';
  Route? onGenerateRoute(RouteSettings settings) {
    switch (settings.name) {
      case landingScreen:
        return MaterialPageRoute(
          builder: (_) => LandingScreen(),
        );
      case signUpScreen:
        return MaterialPageRoute(
          builder: (_) => SignUpScreen(),
        );
      case forgetPasswordScreen:
        return MaterialPageRoute(
          builder: (_) => ForgetPasswordScreen(),
        );

      default:
        return null;
    }
  }
}
