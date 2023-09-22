import 'package:flutter/material.dart';
import 'package:flutter_practical/practice/project/Screens/home/components/header.dart';

class Body extends StatelessWidget {
  const Body({super.key});

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Padding(
        padding: EdgeInsets.all(10),
        child: Column(
          children: [
             LayoutHeader(),
          ],
        ),
      ),
    );
  }
}
