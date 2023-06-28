import 'package:flutter/material.dart';

void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Material App',
      home:listviewexample(),
    );
  }
}
class listviewexample extends StatefulWidget {
  const listviewexample({Key? key}) : super(key: key);

  @override
  State<listviewexample> createState() => _listviewexampleState();
}

class _listviewexampleState extends State<listviewexample> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('List View'),
      ),
      body: ListView(
        padding: EdgeInsets.all(10),
        children: [
          Container(
            height: 50,
            color: Colors.orange.shade100,
            child: const Center(child: Text('Item 1')),
          ),
          Container(
            height: 50,
            color: Colors.orange.shade200,
            child: const Center(child: Text('Item 2')),
          ),
          Container(
            height: 50,
            color: Colors.orange.shade300,
            child: const Center(child: Text('Item 3')),
          ),
          Container(
            height: 50,
            color: Colors.orange.shade400,
            child: const Center(child: Text('Item 4')),
          ),
          Container(
            height: 50,
            color: Colors.orange.shade500,
            child: const Center(child: Text('Item 5')),
          ),
          Container(
            height: 50,
            color: Colors.orange.shade600,
            child: const Center(child: Text('Item 6')),
          ),
        ],
      ),
    );
  }
}

