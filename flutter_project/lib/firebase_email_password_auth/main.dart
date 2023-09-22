import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:flutter_practical/firebase_email_password_auth/home_screen.dart';
import 'package:flutter_practical/firebase_email_password_auth/signup_screen.dart';
import 'package:get/get.dart';

Future<void> main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp();
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return GetMaterialApp(
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
       useMaterial3: true,
      ),
      title: 'Material App',
      home: StreamBuilder(
        stream: FirebaseAuth.instance.authStateChanges(),
        builder: (context, snapshot) {
       if(snapshot.hasData){
         return HomeScreen();
       }else{
         return SignupScreen();
       }
        },
      ),
    );
  }
}
