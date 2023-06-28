import 'package:flutter/material.dart';

void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Text widget',
      home: Scaffold(
        appBar: AppBar(
          title: Text('Text-2 Bar'),
        ),
        body: Center(
          widthFactor: 5,
            heightFactor: 2,
            child: Text(
              "Lorem Ipsum is simply dummy text of the printing and typesetting industry. Lorem Ipsum has been the industry's standard dummy text ever since the 1500s, when an unknown printer took a galley of type and scrambled",
              style: TextStyle(
              fontSize: 10,
                ),
              maxLines: 3,
              overflow: TextOverflow.ellipsis,
              textAlign: TextAlign.justify,
             textDirection: TextDirection.ltr,
           //  textScaleFactor: 3,
              softWrap: false,
          ),
        ),
      ),
    );
  }
}
