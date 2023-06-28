import 'dart:async';

import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';

void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'D3',
      home:splash_screen(),
      debugShowCheckedModeBanner: false,
    );
  }
}
class splash_screen extends StatefulWidget {
  const splash_screen({super.key});

  @override
  State<splash_screen> createState() => _splash_screenState();
}

class _splash_screenState extends State<splash_screen> {
  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    getLoginData();
  }
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.grey,
      body: Center(
        child: Container(
          child:Icon(Icons.apple,size: 140,)
        ),
      ),
    );
  }

  void getLoginData() async {
   var pref = await SharedPreferences.getInstance();
  var isLogin = pref.getBool('isLogin');
    Timer(Duration(seconds: 3), () {
      if(isLogin==true){
        Navigator.pushReplacement(context, MaterialPageRoute(builder: (context) => home_screen(),));
      }else{
        Navigator.pushReplacement(context, MaterialPageRoute(builder: (context) => login_screen(),));
      }
    });

  }
}

class login_screen extends StatefulWidget {
  const login_screen({super.key});

  @override
  State<login_screen> createState() => _login_screenState();
}

class _login_screenState extends State<login_screen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Padding(
        padding: EdgeInsets.all(20),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Icon(Icons.apple,size: 100,),
            TextField(
              decoration: InputDecoration(
                  hintText: 'ID :',
                  border: OutlineInputBorder(
                    borderRadius:BorderRadius.circular(20),
                  )
              ),
            ),
            SizedBox(height: 10,),
            TextField(
              decoration: InputDecoration(
                  hintText: 'PASSCODE :',
                  border: OutlineInputBorder(
                    borderRadius:BorderRadius.circular(20),
                  )
              ),
            ),
            SizedBox(height: 20,),
            ElevatedButton(
                style: ElevatedButton.styleFrom(
                  elevation:20,
                  backgroundColor: Colors.black,
                ),
                onPressed: () async {
              var pref = await SharedPreferences.getInstance();
              pref.setBool('isLogin',true);
              Navigator.pushReplacement(context, MaterialPageRoute(builder: (context) => home_screen(),));


            }, child: Text('Log In'))
          ],
        ),
      ),
    );
  }
}

class home_screen extends StatefulWidget {
  const home_screen({super.key});

  @override
  State<home_screen> createState() => _home_screenState();
}

class _home_screenState extends State<home_screen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        elevation: 20,
        backgroundColor: Colors.white,

        title: Text('HOME',style: TextStyle(color: Colors.black)),
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Icon(Icons.apple_sharp,size: 150,),
            SizedBox(height: 10,),
            ElevatedButton(
                style: ElevatedButton.styleFrom(
                  elevation:20,
                  backgroundColor: Colors.black,
                ),
                onPressed: () async {
              var pref = await SharedPreferences.getInstance();
              pref.setBool('isLogin', false);
              Navigator.pushReplacement(context,MaterialPageRoute(builder: (context) => login_screen(),));

            }, child:Text('Log Out')),
          ],
        ),
      ),
    );
  }
}


