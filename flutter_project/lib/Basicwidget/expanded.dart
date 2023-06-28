import 'package:flutter/material.dart';

void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Expanded Widget',
      home: Scaffold(
        appBar: AppBar(
          title: Text('Expanded Widget'),
        ),
        body: Center(
          child:Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Expanded(
                flex: 2,
                  child:Container(
                    height: 80,
                    width: 80,
                    color: Colors.red,
                  ),
              ),
              Expanded(
                  child:Container(
                   height: 80,
                   width: 80,
                   color: Colors.blue,
                  ),
              ),
              Expanded(
                  child:Container(
                    width: 80,
                    height: 80,
                    color: Colors.green,
                  ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
