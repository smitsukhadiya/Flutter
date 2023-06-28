import 'dart:async';

import 'package:flutter/material.dart';
import 'package:flutter_practical/Calculator/Calculator.dart';

class splash extends StatefulWidget {
  const splash({Key? key}) : super(key: key);

  @override
  State<splash> createState() => _splashState();
}

class _splashState extends State<splash> {
 void initState(){
    super.initState();
    Timer(Duration(seconds: 4),() {
      Navigator.push(context, MaterialPageRoute(builder: (context) => calculator(),
       )
      );
     },
    );
  }
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body:Stack(
        alignment: Alignment.center,
        children: [
          Container(
           color: Colors.black,
          ),
          Container(
            height: 450,
            //color: Colors.black,
            alignment: Alignment.topCenter,
            child: Text(
              'Calculator',
              style: TextStyle(
                letterSpacing: 2,
                fontSize: 30,
                color: Colors.grey,
                fontWeight: FontWeight.bold,
              ),
            ),
          ),
          Image(image: AssetImage('assets/calculator.gif')),
          Container(
            height: 550,
            // color: Colors.black,
            alignment: Alignment.bottomCenter,
            child: Text(
                  'Make it your Way',
              style: TextStyle(
                letterSpacing: 2,
                fontSize: 18,
                color: Colors.grey.shade400,
                fontWeight: FontWeight.bold,
              ),
            ),
          ),
        ],
      )
    ) ;
  }
}
