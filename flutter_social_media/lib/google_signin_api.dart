import 'package:google_sign_in/google_sign_in.dart';

class GoogleSignInApi{

 static GoogleSignIn _googleSignIn = GoogleSignIn();

 static Future<GoogleSignInAccount?>signIn(){
  return _googleSignIn.signIn();
 }
 static Future disconnect(){
  return GoogleSignIn().signOut();
 }
}