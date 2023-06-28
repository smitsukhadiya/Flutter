import 'package:flutter/material.dart';

void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Grind View',
      home:grindviewexample(),
      debugShowCheckedModeBanner: false,
    );
  }
}
class grindviewexample extends StatefulWidget {
  const grindviewexample({Key? key}) : super(key: key);

  @override
  State<grindviewexample> createState() => _grindviewexampleState();
}

class _grindviewexampleState extends State<grindviewexample> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.red,
        title: Text('Grind View'),
      ),
      body: Container(
       // color: Colors.white,
        padding: EdgeInsets.all(10),
        child: GridView.count(
            crossAxisCount:3,
            mainAxisSpacing: 10,
            crossAxisSpacing: 10,
            children: [
              Container(
                padding: EdgeInsets.all(8),
                color: Colors.red.shade100,
                child: Text("He'd have you all unravel at the"),
              ),
              Container(
                padding: EdgeInsets.all(8),
                color: Colors.red.shade200,
                child: Text('Heed not the rabble'),
              ),
              Container(
                padding: EdgeInsets.all(8),
                color: Colors.red.shade300,
                child: Text('Sound of screams but the'),
              ),
              Container(
                padding: EdgeInsets.all(8),
                color: Colors.red.shade400,
                child: Text('Who scream'),
              ),
              Container(
                padding: EdgeInsets.all(8),
                color: Colors.red.shade500,
                child: Text('Revolution is coming...'),
              ),
              Container(
                padding: EdgeInsets.all(8),
                color: Colors.red.shade600,
                child: Text('Revolution, they...'),
              ),
            ],
        ),
      ),
    );
  }
}
