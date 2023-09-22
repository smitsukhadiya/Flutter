import 'package:flutter/material.dart';
import 'package:interview/screens/data_add/data_screen.dart';
import 'package:interview/screens/home/home_screen.dart';

import '../screens/login/login_screen.dart';
import '../screens/signup/sign_up_screen.dart';
import '../screens/splash/splash_screen.dart';


class AppRoute{

  static const splashScreen = '/';
  static const signInScreen = '/signIn';
  static const signUpScreen = '/signUp';
  static const homeScreen = '/home';
  static const DataScreen = '/data';

  static Route<dynamic>? generateRoute(RouteSettings settings){
    switch (settings.name) {
      case splashScreen:
        return MaterialPageRoute(
          builder: (context) => SplashScreen(),
        );

      case signInScreen:
        return MaterialPageRoute(
          builder: (context) => SignInScreen(),
        );
      case signUpScreen:
        return MaterialPageRoute(
          builder: (context) => SignUpScreen(),
        );

      case homeScreen:
        return MaterialPageRoute(
          builder: (context) => HomeScreen(),
        );

      case DataScreen :
        return MaterialPageRoute(
          builder: (context) => dataScreen(),
        );
    }

  }

}