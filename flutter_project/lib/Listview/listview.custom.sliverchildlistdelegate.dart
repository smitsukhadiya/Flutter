import 'package:flutter/material.dart';

void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Material App',
      home:listviewcustomsliverchildlistdelegateexample(),
    );
  }
}
class listviewcustomsliverchildlistdelegateexample extends StatefulWidget {
  const listviewcustomsliverchildlistdelegateexample({Key? key}) : super(key: key);

  @override
  State<listviewcustomsliverchildlistdelegateexample> createState() => _listviewcustomsliverchildlistdelegateexampleState();
}

class _listviewcustomsliverchildlistdelegateexampleState extends State<listviewcustomsliverchildlistdelegateexample> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('SliverChildDelegate'),
      ),
      body: ListView.custom(
        padding: EdgeInsets.all(10),
          childrenDelegate: SliverChildListDelegate([
         Container(
          height: 50,
          color: Colors.orange.shade100,
          child: Center(child: Text('Item 1')),
        ),
           Container(
          height: 50,
          color: Colors.orange.shade200,
          child: Center(child: Text('Item 2')),
        ), 
          Container(
          height: 50,
          color: Colors.orange.shade200,
          child: Center(child: Text('Item 3')),
        ),
        Container(
          height: 50,
          color: Colors.orange.shade300,
          child: Center(child: Text('Item 4')),
        ),
        Container(
          height: 50,
          color: Colors.orange.shade400,
          child: Center(child: Text('Item 5')),
        ),
        Container(
          height: 50,
          color: Colors.orange.shade500,
          child: Center(child: Text('Item 5')),
        ),
        Container(
          height: 50,
          color: Colors.orange.shade600,
          child: Center(child: Text('Item 6')),
        ),
      ])),
    );
  }
}

