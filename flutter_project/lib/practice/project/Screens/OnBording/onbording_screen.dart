import 'package:flutter/material.dart';
import 'package:flutter_practical/practice/project/Screens/OnBording/component/body.dart';

class onbording_screen extends StatefulWidget {
  const onbording_screen({super.key});

  @override
  State<onbording_screen> createState() => _onbording_screenState();
}

class _onbording_screenState extends State<onbording_screen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Body(),
    );
  }
}
