import 'dart:async';

import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';

 class splashscreen extends StatefulWidget {
   const splashscreen({Key? key}) : super(key: key);
 
   @override
   State<splashscreen> createState() => _splashscreenState();
 }
 
 class _splashscreenState extends State<splashscreen> {
   void initState(){
     //TODO: implement iniState
     super.initState();
     Timer(const Duration(seconds: 4),(){
       navigate();
     }
     );
   }

   @override
   Widget build(BuildContext context) {
     return Scaffold(
       body: Stack(
         alignment: Alignment.center,
         children: [
          Container(
           color: Colors.black,
          ),
       Image(
         image: NetworkImage('https://www.nsbpictures.com/wp-content/uploads/2019/11/logo-icon-png-8.png'),
         height: 140,
         width: 140,
          ),
           Container(
             alignment: Alignment.bottomCenter,
             child: Text(
                 'FULTTER  UI',
               style: TextStyle(
                 color: Colors.grey.shade700,
                 fontWeight: FontWeight.w900,
                 fontSize: 25,
               ),
             ),
           ),
         ],
       ),
     );
   }

  navigate() async {
     var prefs =await SharedPreferences.getInstance();
     var status = prefs.getBool('isOnBording') ?? false;
     var isLogin = prefs.getBool('isLogin') ?? false;
    if(status){
      if(isLogin){
        Navigator.pushReplacementNamed(context, '/home');
      }else{
        Navigator.pushReplacementNamed(context, '/login');
      }
    }else{
      Navigator.pushReplacementNamed(context, '/onbording');
    }
  }
 }
 
