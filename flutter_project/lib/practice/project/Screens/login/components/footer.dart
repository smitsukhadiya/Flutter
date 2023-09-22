import 'package:flutter/material.dart';
import 'package:flutter_practical/practice/project/Routes/app_route.dart';

class layoutFooter extends StatelessWidget {
  const layoutFooter({super.key});

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        Text('Don\'t have an account?'),
        TextButton(onPressed: () {
            Navigator.pushNamed(context,AppRoute.signup);
        }, child:Text('Sign Up'))
      ],
    );
  }
}
