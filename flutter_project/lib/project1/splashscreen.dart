import 'dart:async';

import 'package:flutter/material.dart';
import 'package:flutter_practical/project1/loginscreen.dart';

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
    Timer(Duration(seconds: 6),() {
      Navigator.pushReplacement(context,MaterialPageRoute(builder: (context) => loginscreen()));
    },);
  }
  @override
  Widget build(BuildContext context) {
    return  Scaffold(
      body: Stack(
        alignment: Alignment.center,
        children: [
          Container(
            color: Colors.black,
          ),
          Image(
            image: AssetImage('assets/200w.gif',),
            height: 200,
            width: 200,
          ),
          Container(

            alignment: Alignment.bottomCenter,
            child: Text(
              '↼ M E T A ⇁',
              style: TextStyle(

                color: Colors.blue.shade300,
                fontWeight: FontWeight.w900,
                fontSize: 25,
              ),
            ),
          ),
        ],
      ),
    );
   }
  }

