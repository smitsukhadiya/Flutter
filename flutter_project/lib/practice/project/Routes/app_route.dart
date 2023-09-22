import 'package:flutter/material.dart';
import 'package:flutter_practical/practice/project/Screens/OnBording/onbording_screen.dart';
import 'package:flutter_practical/practice/project/Screens/category/category_screen.dart';
import 'package:flutter_practical/practice/project/Screens/home/home_screen.dart';
import 'package:flutter_practical/practice/project/Screens/login/login_screen.dart';
import 'package:flutter_practical/practice/project/Screens/signup/signup_screen.dart';
import 'package:flutter_practical/practice/project/Screens/splash/splash_screen.dart';

import '../Screens/category_list/category_list_screen.dart';


class AppRoute{
  static const splachScreen = '/';
  static const onBordingScreen = '/onBording';
  static const login = '/login';
  static const signup = '/signup';
  static const home = '/home';
  static const categoryListScreen = '/categorylistscreen';
  static const categoryScreen = '/categoryscreen';

  static Route<dynamic>? generateRoute(RouteSettings settings){
    switch(settings.name){
      case splachScreen:
      return MaterialPageRoute(builder: (context) => splash_screen(),);

      case onBordingScreen :
        return MaterialPageRoute(builder: (context) =>onbording_screen(),);

      case login :
        return MaterialPageRoute(builder: (context) => login_screen(),);

      case signup :
        return MaterialPageRoute(builder: (context) => signup_screen(),);

      case home :
        return MaterialPageRoute(builder: (context) => home_screen(),);

      case categoryListScreen :
        return MaterialPageRoute(builder: (context) => CatagoryListScreen(),);

      case categoryScreen :
        return MaterialPageRoute(builder: (context) => CatagoryScreen());
    }
  }
}