import 'package:flutter/material.dart';
import 'package:flutter_practical/Stateful%20widget/Dynamic%20data%20passing/firstscreen.dart';

void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Dynamic Data Passing',
      home:firstscreen(),
    );
  }
}
