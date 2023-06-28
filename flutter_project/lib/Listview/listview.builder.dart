import 'dart:math';

import 'package:flutter/material.dart';

void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Material App',
      home:listviewbuilderexample(),
    );
  }
}
class listviewbuilderexample extends StatefulWidget {
  const listviewbuilderexample({Key? key}) : super(key: key);

  @override
  State<listviewbuilderexample> createState() => _listviewbuilderexampleState();
}

class _listviewbuilderexampleState extends State<listviewbuilderexample> {
  var colorlist = [Colors.orange.shade100,Colors.orange.shade200,Colors.orange.shade300,Colors.orange.shade400,Colors.orange.shade500,Colors.orange.shade600,];
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(
          'Listview.builder Example',
        ),
      ),
      body: ListView.builder(
        itemCount: 50,
        itemBuilder: (context, index) {
          return GestureDetector(
            onTap: (){
              print('Item $index Clicked');
            },
            child: Container(
              height: 50,
              color:colorlist[Random().nextInt(colorlist.length)],
              child: Center(child: Text('Item $index')),
            ),
          );
      },),
    );
  }
}

