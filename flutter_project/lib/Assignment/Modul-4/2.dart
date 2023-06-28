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
        title: Text('First Screen'),
      ),
      body: Center(
        child:Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Text('First Screen Here',style: TextStyle(fontSize: 20,fontWeight: FontWeight.bold)),
            SizedBox(height: 20,),
            ElevatedButton(onPressed: () =>Navigator.push(context,MaterialPageRoute(builder: (context) => secondscreen(),)) , child: Text('Press to Redirect'),),
          ],
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
class secondscreen extends StatefulWidget {
  const secondscreen({Key? key}) : super(key: key);

  @override
  State<secondscreen> createState() => _secondscreenState();
}

class _secondscreenState extends State<secondscreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar:AppBar(
        title: Text('Second Screen'),
      ) ,
      body: Center(
        child: Text('Second Screen Here',style: TextStyle(fontSize:20,fontWeight: FontWeight.bold )),
      ),
    );
  }
}

