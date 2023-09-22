import 'package:flutter/material.dart';
import 'package:flutter_practical/practice/project/constants.dart';

class layoutHeader extends StatelessWidget {
  const layoutHeader({super.key});

  @override
  Widget build(BuildContext context) {
    return Center(
         child: Column(
           mainAxisSize: MainAxisSize.min,
             children: [
               Image.asset('assets/app_logo.png',width: 100,height: 100),
               SizedBox(height: 16,),
               Text('Welcom Back',style: headingStyle),
               SizedBox(height: 8,),
               Text('Sign in with your email and password',textAlign: TextAlign.center,)
             ],
         ),
       );
  }
}
