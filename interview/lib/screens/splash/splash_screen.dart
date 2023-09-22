import 'dart:async';

import 'package:flutter/material.dart';

import '../../routes/app_route.dart';


class SplashScreen extends StatefulWidget {
  const SplashScreen({super.key});

  @override
  State<SplashScreen> createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen> {

  @override
  void initState() {
    // TODO: implement initState
    super.initState();

    Timer(Duration(seconds: 3), () {
      Navigator.pushReplacementNamed(context, AppRoute.signInScreen);
    });

  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Stack(
        fit: StackFit.expand,
        children: [
        Image.asset('assets/background.jpg', fit: BoxFit.cover, colorBlendMode: BlendMode.lighten),
        Center(child: Image.asset('assets/logo.png', height: 200, width: 200,)),

        ],
      ),
    );
  }
}

