import 'package:flutter/material.dart';

void main() => runApp(MyApp());

class MyApp extends StatelessWidget {

  @override
  Widget build(BuildContext context) {
    return MaterialApp(

      title: 'Text Widget',
      home: Scaffold(
        appBar: AppBar(
          title: Text('Text Widget'),
        ),
        body: Center(
          child: Text(
            'Tops Technologies',
            style: TextStyle(
              /*color: Colors.blue,*/
                fontSize: 40,
                fontWeight: FontWeight.bold,
                decoration: TextDecoration.combine([
                  TextDecoration.underline,
                  TextDecoration.overline
                ]),
                decorationColor: Colors.red,
                decorationStyle: TextDecorationStyle.dashed,
                fontFamily: "Roboto",
                /* shadows: [
                Shadow(
                  color: Colors.red,
                  blurRadius: 10,
                  offset: Offset(4,1)
                )
              ],*/
                foreground: Paint() ..color = Colors.red..style = PaintingStyle.stroke..strokeWidth = 2
              /*letterSpacing: 3,*/
              /*wordSpacing: 30*/
              /*decorationThickness: 2*/
              /*fontStyle: FontStyle.italic,*/
              /*backgroundColor: Colors.red*/
            ),
          ),
        ),
      ),
    );
  }
}
