import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';

Future<void> main() async {
  WidgetsFlutterBinding.ensureInitialized();
   await Firebase.initializeApp();
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Log in page',
      home: StreamBuilder(
        stream: FirebaseAuth.instance.authStateChanges(),
        builder: (context, snapshot) {
           if(snapshot.hasData){
             return homeScreen();
           }else{
             return LoginScreen();
           }
        },
      ),
    );
  }
}
class LoginScreen extends StatefulWidget {
  const LoginScreen({Key? key}) : super(key: key);

  @override
  State<LoginScreen> createState() => _LoginScreenState();
}

class _LoginScreenState extends State<LoginScreen> {
  var emailController = TextEditingController();
  var passController = TextEditingController();

  login(String email , String pass) async {
    try {
      final credential = await FirebaseAuth.instance.signInWithEmailAndPassword(
          email: email,
          password: pass
      );
      if(credential.user !=null){
        Navigator.pushReplacement(context,MaterialPageRoute(builder: (context) => homeScreen(),));
      }
    } on FirebaseAuthException catch (e) {
      if (e.code == 'user-not-found') {
        print('No user found for that email.');
      } else if (e.code == 'wrong-password') {
        print('Wrong password provided for that user.');
      }
    }
  }
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      bottomSheet: Padding(
        padding: EdgeInsets.fromLTRB(130, 0, 130, 0),
        child: TextButton(
          onPressed: () {
          Navigator.push(context, MaterialPageRoute(builder: (context) => SignUpScreen(),));
          },
          child: Text('Create Your Account'),
        ),
      ),
      appBar: AppBar(
        title: Text('Log In Screen'),
      ),
      body: Center(
        child: Padding(
          padding: EdgeInsets.all(20),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              TextField(
                controller: emailController,
                decoration: InputDecoration(
                  hintText: 'Enter E-mail Address',
                ),
              ),
              SizedBox(height: 10,),
              TextField(
                controller: passController,
                decoration: InputDecoration(
                  hintText: 'Enter Password',
                ),
              ),
              SizedBox(height: 15,),
              ElevatedButton(onPressed: () {
                String email = emailController.text.trim();
                String pass = passController.text.trim();
                login(email, pass);

              }, child:Text('Log In')),
            ],
          ),
        ),
      ),
    );
  }
}
class SignUpScreen extends StatefulWidget {
  const SignUpScreen({Key? key}) : super(key: key);

  @override
  State<SignUpScreen> createState() => _SignUpScreenState();
}

class _SignUpScreenState extends State<SignUpScreen> {
  var nameController = TextEditingController();
  var contactController = TextEditingController();
  var emailController = TextEditingController();
  var passController = TextEditingController();

  signUp(String email,String password,String name) async {
    try {
      final credential = await FirebaseAuth.instance.createUserWithEmailAndPassword(
        email: email,
        password: password,
      );
      if(credential.user !=null){
        Navigator.pushReplacement(context,MaterialPageRoute(builder: (context) => homeScreen(),));
      }
    } on FirebaseAuthException catch (e) {
      if (e.code == 'weak-password') {
        print('The password provided is too weak.');
      } else if (e.code == 'email-already-in-use') {
        print('The account already exists for that email.');
      }
    } catch (e) {
      print(e);
    }
  }
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Sign Up Screen'),
      ),
      body: Center(
        child: Padding(
          padding: EdgeInsets.all(20),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              TextField(
                controller: nameController,
                decoration: InputDecoration(
                  hintText: 'Enter Name',
                ),
              ),
              SizedBox(height: 10,),
              TextField(
                controller: contactController,
                decoration: InputDecoration(
                  hintText: 'Enter Contact',
                ),
              ),
              SizedBox(height: 10,),
              TextField(
                controller: emailController,
                decoration: InputDecoration(
                  hintText: 'Enter Email-Address',
                ),
              ),
              SizedBox(height: 10,),
              TextField(
                controller: passController,
                decoration: InputDecoration(
                  hintText: 'Enter Password',
                ),
              ),
              SizedBox(height: 10,),
              ElevatedButton(onPressed: () {
                String name = nameController.text.trim();
                String email = emailController.text.trim();
                String password = passController.text.trim();
                signUp(email, password, name);
              }, child:Text('Sign Up')),
            ],
          ),
        ),
      ),
    );
  }
}

class homeScreen extends StatefulWidget {
  const homeScreen({Key? key}) : super(key: key);

  @override
  State<homeScreen> createState() => _homeScreenState();
}

class _homeScreenState extends State<homeScreen> {
  logout() async {
    await FirebaseAuth.instance.signOut();
    Navigator.pushReplacement(context,MaterialPageRoute(builder: (context) =>LoginScreen(),));
  }
  late User user;
  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    user = FirebaseAuth.instance.currentUser!;
  }
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Home Screen'),
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Text('''
            id : ${user.uid}
            email : ${user.email}
            '''),
            SizedBox(height: 16,),
            ElevatedButton(onPressed: () {
              logout();
            }, child:Text('Log out')),
          ],
        ),
      ),
    );
  }
}

