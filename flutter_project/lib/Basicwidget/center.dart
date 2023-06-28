import 'package:flutter/material.dart';

void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Material App',
      home: Scaffold(
        appBar: AppBar(
          title: Text('Material App Bar'),
        ),
       body: Center(
          widthFactor: 3,
         heightFactor: 4,
         child: Text(
           "Tops technologies",
           style: TextStyle(fontSize: 20),
         ),
       ),
      ),
    );
  }
}
