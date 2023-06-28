import 'dart:math';

import 'package:flutter/material.dart';

void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Material App',
      home:listviewcustomsliverchildbuilderdelegate(),
    );
  }
}
class listviewcustomsliverchildbuilderdelegate extends StatefulWidget {
  const listviewcustomsliverchildbuilderdelegate({Key? key}) : super(key: key);

  @override
  State<listviewcustomsliverchildbuilderdelegate> createState() => _listviewcustomsliverchildbuilderdelegateState();
}

class _listviewcustomsliverchildbuilderdelegateState extends State<listviewcustomsliverchildbuilderdelegate> {
  var colorlist = [Colors.orange.shade100,Colors.orange.shade200,Colors.orange.shade300,Colors.orange.shade400,Colors.orange.shade500,Colors.orange.shade600,];
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('SliverChildBuilderDelegate'),
      ),
      body: ListView.custom(
        padding: EdgeInsets.all(10),
        childrenDelegate: SliverChildBuilderDelegate(
        (context, index) {
          return GestureDetector(
            onTap: () {
              print('Item $index Clicked');
            },
            child: Container(
              height: 50,
              color:colorlist[Random().nextInt(colorlist.length)],
              child: Center(
                child: Text('Item $index'),
              ),
            ),
          );
        },
      ),
      ),
    );
  }
}
