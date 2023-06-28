import 'package:flutter/material.dart';

void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Row Widget',
      home: Scaffold(
        appBar: AppBar(
          title: Text('Row Widget'),
        ),
        body: Center(
          child: Container(
           // height: 150,
            color: Colors.grey.shade500,
            child: Row(
              mainAxisSize: MainAxisSize.max,
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              crossAxisAlignment: CrossAxisAlignment.start,
              textDirection: TextDirection.rtl,
              children: [
                Container(
                  color:Colors.green,
                  height: 80,
                  width: 80,
                ),
                Container(
                  color: Colors.blue,
                  width: 80,
                  height: 80,
                ),
                Container(
                  color: Colors.red,
                  height: 80,
                  width: 80,
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
