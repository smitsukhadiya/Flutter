import 'package:flutter/material.dart';
import 'package:flutter_practical/practice/project/Screens/signup/components/header.dart';
import 'package:flutter_practical/practice/project/Screens/signup/components/signup_form.dart';

class Body extends StatefulWidget {
  const Body({super.key});

  @override
  State<Body> createState() => _BodyState();
}

class _BodyState extends State<Body> {
  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      physics: BouncingScrollPhysics(),
      reverse: true,
      child: Center(
        child: Column(
          children: [
          AppBar(),
         LayoutHeader(),
            SizedBox(height: 24,),
            Signup_Form(),
          ],
        ),
      ),
    );
  }
}
