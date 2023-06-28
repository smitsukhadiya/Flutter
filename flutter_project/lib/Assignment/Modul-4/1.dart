import 'dart:async';

import 'package:flutter/material.dart';

void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Material App',
      home: splashscreen(),
      debugShowCheckedModeBanner: false,
    );
  }
}
class d1 extends StatefulWidget {
  const d1({Key? key}) : super(key: key);

  @override
  State<d1> createState() => _d1State();
}

class _d1State extends State<d1> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('D1'),
      ),
      body: Center(
        child: Container(
          child: Text('Home Screen Here',style: TextStyle(fontSize: 20,fontWeight: FontWeight.bold)),
        ),
      ),
    );
  }
}
class splashscreen extends StatefulWidget {
  const splashscreen({Key? key}) : super(key: key);

  @override
  State<splashscreen> createState() => _splashscreenState();
}

class _splashscreenState extends State<splashscreen> {
  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    Timer(Duration(seconds: 5),() {
        Navigator.pushReplacement(context, MaterialPageRoute(builder: (context) => d1(),));
     },
    );
  }
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: Container(
          child: Image.asset('assets/download.png'),
        ),
      ),
    );
  }
}

