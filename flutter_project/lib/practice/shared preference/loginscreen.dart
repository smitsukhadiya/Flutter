import 'package:flutter/material.dart';
import 'package:flutter_practical/practice/shared%20preference/homescreen.dart';
import 'package:flutter_practical/sampleApp/home_screen..dart';
import 'package:shared_preferences/shared_preferences.dart';

class loginscreen extends StatefulWidget {
  const loginscreen({Key? key}) : super(key: key);

  @override
  State<loginscreen> createState() => _loginscreenState();
}

class _loginscreenState extends State<loginscreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: Padding(
          padding: EdgeInsets.all(25),
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
                    backgroundColor: Colors.white,
                  ),
                  onPressed: () async {
                var sharedpref = await SharedPreferences.getInstance();
                    sharedpref.setBool('LOGIN', true);
                    Navigator.pushReplacement(context,MaterialPageRoute(builder: (context) => homescreen(),));
              }, child:Text('LOGIN',style: TextStyle(color: Colors.black),)),
            ],
          ),
        ),
      ),
    );
  }
}
