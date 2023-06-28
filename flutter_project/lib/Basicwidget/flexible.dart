import 'package:flutter/material.dart';

void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flexible Widget',
      home: Scaffold(
        appBar: AppBar(
          title: Text('Flexible Widget'),
        ),
        body:Column(
          children: [
            Flexible(
              flex: 3,
              fit: FlexFit.loose,
              child: Container(
                color: Colors.green,
                height: 100,
              ),
            ),
            Flexible(
              flex: 2,
            child:Container(
              color: Colors.red,
            ),
            ),
            Flexible(
              flex: 2,
              fit: FlexFit.tight,
              child: Container(
                color: Colors.blue,
              ),
            ),
          ],
        )
      ),
    );
  }
}
