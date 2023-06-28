import 'dart:async';
import 'package:flutter/material.dart';
import 'package:flutter_practical/practice/shared%20preference/homescreen.dart';
import 'package:flutter_practical/practice/shared%20preference/loginscreen.dart';
import 'package:shared_preferences/shared_preferences.dart';

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
    GetLoginData();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: Container(
          child: Icon(Icons.apple,size: 150),
        ),
      ),
    );
  }

  void GetLoginData() async{
    var sharedpref = await SharedPreferences.getInstance();
    var isLogin = sharedpref.getBool('LOGIN');
    Timer(Duration(seconds: 4),(){
      if(isLogin==true){
        Navigator.pushReplacement(context,MaterialPageRoute(builder: (context) => homescreen(),));
      }else{
        Navigator.pushReplacement(context,MaterialPageRoute(builder: (context) => loginscreen(),));
      }

    });


  }
}
