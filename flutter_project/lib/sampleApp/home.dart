import 'package:flutter/material.dart';
import 'package:flutter_practical/sampleApp/home_screen..dart';

void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Sample App',
      home:homeScreen(),
    );
  }
}
