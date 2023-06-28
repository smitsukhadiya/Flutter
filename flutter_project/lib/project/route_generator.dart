import 'package:flutter/material.dart';
import 'package:flutter_practical/project/Home_screen/home_screen.dart';
import 'package:flutter_practical/project/login_screen/login_screen.dart';
import 'package:flutter_practical/project/on_bording_screen/on_bording_screen.dart';
import 'package:flutter_practical/project/signup_screen/signup_screen.dart';
import 'package:flutter_practical/project/splash_screen/splash_screen.dart';

class RouteGenerator{
  static Route<dynamic> generateRoute(RouteSettings settings){
    switch(settings.name){
      case'/':
        return MaterialPageRoute
          (builder:(context) => splashscreen(),
        );
      case '/login':
        return MaterialPageRoute
          (builder:(context) => loginscreen(),
        );
      case '/signup':
        return MaterialPageRoute
          (builder:(context) => signupscreen(),
        );
      case '/onbording':
        return MaterialPageRoute
          (builder:(context) => onbordingscreen(),
        );
      case '/home':
        return MaterialPageRoute
          (builder:(context) => homescreen(),
        );
    }
    return MaterialPageRoute
      (builder:(context) => splashscreen(),
    );
  }
}