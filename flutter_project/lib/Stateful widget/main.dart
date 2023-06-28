import 'package:flutter/material.dart';
import 'package:flutter_practical/Stateful%20widget/Stateful_widget.dart';

void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Stateful widget',
      home: statefulWidget(),
    );
  }
}
