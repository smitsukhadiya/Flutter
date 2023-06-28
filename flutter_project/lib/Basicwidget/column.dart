import 'package:flutter/material.dart';

void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Material App',
      home: Scaffold(
        appBar: AppBar(
          title: Text('Column Widget'),
        ),
        body: Center(
          child: Container(
            width: 300,
            color: Colors.grey.shade500,
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.stretch,
              mainAxisSize:MainAxisSize.max,
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: [
                Container(
                  color: Colors.green,
                  width: 80,
                  height: 80,
                ),
                Container(
                  color: Colors.blue,
                  width: 80,
                  height: 80,
                ),
                Container(
                  color: Colors.red,
                  width: 80,
                  height: 80,
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
