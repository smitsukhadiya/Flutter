import 'dart:async';

import 'package:flutter/material.dart';
import 'package:flutter_practical/practice/project/Routes/app_route.dart';

import '../../../constants.dart';

class Body extends StatefulWidget {
  const Body({super.key});

  @override
  State<Body> createState() => _BodyState();
}

class _BodyState extends State<Body> {
  
  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    Timer(Duration(seconds: 3), () {
      Navigator.pushReplacementNamed(context,AppRoute.onBordingScreen);
    });
  }
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Stack(
        children: [
          Container(decoration: BoxDecoration(gradient: kBackgroundGradient),),
          Center(
            child: Image.asset('assets/app_logo.png',width: 140,height: 140),
          ),
        ],
      ),
    );
  }
}
