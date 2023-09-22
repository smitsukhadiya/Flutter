import 'package:flutter/material.dart';
import 'package:flutter_practical/movie_app/home_screen.dart';

void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        brightness: Brightness.dark,
        primaryColor: Colors.green,
      ),
      title: 'Material App',
      home:HomeScreen(),
    );
  }
}
