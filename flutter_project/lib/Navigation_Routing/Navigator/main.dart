import 'package:flutter/material.dart';
import 'package:flutter_practical/Navigation_Routing/First_page.dart';

void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Material App',
      home: First_Page(),
    );
  }
}
