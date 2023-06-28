import 'package:flutter/material.dart';
import 'package:flutter_practical/Routing Extras/first_route.dart';
import 'package:flutter_practical/Routing%20Extras/home_route.dart';

void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Navtigator',
      routes: {
        '/first' :(context) => firstroute(),
      },
      home: homeroute()
    );
  }
}
