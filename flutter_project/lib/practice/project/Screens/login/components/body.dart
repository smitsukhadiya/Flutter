import 'package:flutter/material.dart';
import 'package:flutter_practical/practice/project/Screens/login/components/footer.dart';
import 'package:flutter_practical/practice/project/Screens/login/components/header.dart';
import 'package:flutter_practical/practice/project/Screens/login/components/sign_in_form.dart';

class Body extends StatefulWidget {
  const Body({super.key});

  @override
  State<Body> createState() => _BodyState();
}

class _BodyState extends State<Body> {
  @override
  Widget build(BuildContext context) {
    return  SafeArea(
      child: SingleChildScrollView(
        physics:ClampingScrollPhysics(parent: NeverScrollableScrollPhysics()),
        reverse: true,
        child: Container(
           height: MediaQuery.of(context).size.height,
          child: Padding(
              padding: EdgeInsets.all(16),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                     layoutHeader(),
                  SizedBox(height: 24,),
                  signinForm(),
                  SizedBox(height: 24,),
                  layoutFooter(),
                ],
              ),
            ),
        ),
      ),
    );
  }
}
