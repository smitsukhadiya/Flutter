import 'package:flutter/material.dart';
import 'package:flutter_social_media/google_signin_api.dart';
import 'package:google_sign_in/google_sign_in.dart';

void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Social Media Integration',
      home:LoginScreen(),
    );
  }
}
class LoginScreen extends StatefulWidget {
  const LoginScreen({Key? key}) : super(key: key);

  @override
  State<LoginScreen> createState() => _LoginScreenState();
}

class _LoginScreenState extends State<LoginScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Social Media Integration'),
      ),
      body: Center(
        child:Column(
          children: [
            ElevatedButton(
              style: ElevatedButton.styleFrom(
                backgroundColor: Colors.red,
              ),
                onPressed: () async {
             GoogleSignInAccount? user = await  GoogleSignInApi.signIn();
              if(user!=null){
             Navigator.push(context,MaterialPageRoute(builder:(context) => HomeScreen(user),));
              }
            }, child:Text('Continue with Google')),
          ],
        )
      ),
    );
  }
}

class HomeScreen extends StatelessWidget {
 GoogleSignInAccount user;

 HomeScreen(this.user);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body:Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
        Container(
        child: Text(
        '''
              Id : ${user.id}
              Name : ${user.displayName}
              E-mail : ${user.email}
              ''',
        ),
        ),
            SizedBox(height: 20,),
            ElevatedButton(onPressed: () async {
              await GoogleSignInApi.disconnect();
              Navigator.push(context,MaterialPageRoute(builder:(context) => LoginScreen(),));

            }, child:Text('Log Out')),
          ],
          ),
        ),
      );
  }
}


