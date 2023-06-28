import 'package:flutter/material.dart';
import 'package:flutter_practical/practice/project/Screens/OnBording/onbording_screen.dart';
import 'package:flutter_practical/practice/project/Screens/login/login_screen.dart';
import 'package:flutter_practical/practice/project/Screens/splash/splash_screen.dart';

class AppRoute{
  static const splachScreen = '/';
  static const onBordingScreen = '/onBording';
  static const login = '/login';

  static Route<dynamic>? generateRoute(RouteSettings settings){
    switch(settings.name){
      case splachScreen:
      return MaterialPageRoute(builder: (context) => splash_screen(),);

      case onBordingScreen :
        return MaterialPageRoute(builder: (context) =>onbording_screen(),);

      case login :
        return MaterialPageRoute(builder: (context) => login_screen(),);
    }
  }
}