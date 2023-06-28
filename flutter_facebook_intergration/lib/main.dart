import 'package:flutter/material.dart';
import 'package:flutter_facebook_auth/flutter_facebook_auth.dart';

void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Material App',
      home: Facebookauth(),
    );
  }
}
class Facebookauth extends StatefulWidget {
  const Facebookauth({Key? key}) : super(key: key);

  @override
  State<Facebookauth> createState() => _FacebookauthState();
}

class _FacebookauthState extends State<Facebookauth> {

  Map? userData;
  Future<void> Login() async {
    var result = await FacebookAuth.i.login(permissions: ["public_profile","email"]);
  if(result.status == LoginStatus.success){
     print('Login Success');
  var reqData = await FacebookAuth.i.getUserData(fields: "id,name,picture.width(200),email,birthday");
  setState(() {
    userData = reqData;

  });

  }else if(result.status==LoginStatus.failed){
    print('Login Failed');
  }

  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('FaceBook Authentication'),
      ),
      body: Center(
       child: userData == null ? facebookUI() : loginUI()
      ),
    );
  }
  facebookUI(){
    return ElevatedButton(
      onPressed: () {
        Login();
      }, child:Text('Continue with facebook'),
    );
  }

  loginUI() {
    return Column(
      mainAxisAlignment: MainAxisAlignment.center,
      crossAxisAlignment: CrossAxisAlignment.center,
      children: [
        CircleAvatar(
          radius: 50,
          backgroundImage: Image.network(userData!['picture']['data']['url'],fit: BoxFit.cover).image,
        ),
        SizedBox(height: 20,),
        Text('userId : ${userData!['id']}\nname : ${userData!['name']}\nemail : ${userData!['email']}\n',
          textAlign: TextAlign.center,),
        ElevatedButton(onPressed: () {
          Logout();
        }, child:Text('Log out'))
      ],
    );
  }

  Future<void> Logout() async {
    await FacebookAuth.i.logOut();
    setState(() {
      userData= null;
    });
  }

}