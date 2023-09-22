import 'package:flutter/material.dart';
import 'package:flutter_practical/practice/project/Screens/home/components/body.dart';
import 'package:flutter_practical/practice/project/Screens/home/components/home_screen_drawer.dart';

class home_screen extends StatefulWidget {
  const home_screen({super.key});

  @override
  State<home_screen> createState() => _home_screenState();
}

class _home_screenState extends State<home_screen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      drawer: HomeScreenDrawer(),
     body:Body(),
    );
  }
}
