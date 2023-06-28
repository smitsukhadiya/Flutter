import 'package:flutter/material.dart';
import 'package:flutter_practical/practice/shared%20preference/loginscreen.dart';
import 'package:shared_preferences/shared_preferences.dart';

class homescreen extends StatefulWidget {
  const homescreen({Key? key}) : super(key: key);

  @override
  State<homescreen> createState() => _homescreenState();
}

class _homescreenState extends State<homescreen> {
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
            Container(
            child: Icon(
              Icons.apple_sharp,size: 150,
            ),
          ),
            SizedBox(height: 150,),
            ElevatedButton(
              style: ElevatedButton.styleFrom(
                elevation:20,
                backgroundColor: Colors.white,
              ),
                onPressed: () async {
                var sharedpref = await SharedPreferences.getInstance();
                sharedpref.setBool('LOGIN', false);
                Navigator.pushReplacement(context, MaterialPageRoute(builder: (context) => loginscreen(),));
            }, child: Text('LOGOUT',style: TextStyle(color: Colors.black),))
          ],
        ),
      ),
    );
  }
}
