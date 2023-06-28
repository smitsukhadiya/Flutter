import 'package:flutter/material.dart';

void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Container widget',
      home: Scaffold(
        appBar: AppBar(
          title: Text('Container widget'),
        ),
        body: Center(
          child: Container(
           // color: Colors.blue,
          // padding: EdgeInsets.all(10),
            width: 250,
            height: 250,
          // alignment: Alignment.center,
            decoration: BoxDecoration(
              color: Colors.blue,
             /* border: Border.all(
                color: Colors.black54,
                width: 2,
                style: BorderStyle.solid,
              ),
                borderRadius: BorderRadius.circular(20),*/
              gradient: LinearGradient(
                begin: Alignment.topCenter,
                end: Alignment.bottomCenter,
                  colors: [Colors.blue.shade50, Colors.blue.shade900]),
             boxShadow: [
               BoxShadow(color: Colors.grey, blurRadius: 16, spreadRadius: 8)
              ],
              shape: BoxShape.circle,
              //borderRadius: BorderRadius.horizontal(
              ///  left: Radius.circular(20)
              ),
             // transform: Matrix4.rotationZ(0.3),
          margin: EdgeInsets.all(20),
           // padding: EdgeInsets.symmetric(horizontal: 10,vertical: 5),
            constraints: BoxConstraints.expand(),
            padding: EdgeInsets.fromLTRB(20, 0, 20, 0),
           // constraints: BoxConstraints(minHeight: 100, maxWidth: 400, maxHeight: 400),
            alignment: Alignment.center,
            child: Container(
              decoration: BoxDecoration(
                shape: BoxShape.circle,
                color: Colors.blue.shade900,
              ),
              constraints: BoxConstraints.expand(),
              child: Text(
                'Welcome to tops',
                textAlign: TextAlign.center,
                style: TextStyle(color: Colors.black,fontSize: 24),
              ),
            ),
              ),
            ),
          ),
      );
  }
}
