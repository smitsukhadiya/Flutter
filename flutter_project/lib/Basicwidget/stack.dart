import 'package:flutter/material.dart';

void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Stack Widget',
      home: Scaffold(
        appBar: AppBar(
          title: Text('Stack Widget'),
        ),
        body: Center(
          child: Container(
           height: 400,
            width: 400,
            color: Colors.grey.shade300,
            child: Stack(
              alignment: Alignment.topRight,
            clipBehavior: Clip.none,
              fit: StackFit.expand,
              children: [
                Container(
                  width: 200,
                  height: 200,
                  color: Colors.blue,
                ),
                Positioned(
                  bottom: -40,
                    right: 0,
                    /*width: 120,
                    height: 120,*/
                    child: Container(
                      height: 80,
                      width: 80,
                      color: Colors.red,
                    ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
