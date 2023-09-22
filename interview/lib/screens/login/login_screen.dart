import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:http/http.dart';
import 'package:interview/constants.dart';
import 'package:interview/screens/login/Login_response.dart';

import '../../routes/app_route.dart';
import '../../utils.dart';


class SignInScreen extends StatefulWidget {
  SignInScreen({super.key});

  @override
  State<SignInScreen> createState() => _SignInScreenState();
}

class _SignInScreenState extends State<SignInScreen> {
  bool passwordVisible = false;
 var emailController = TextEditingController();
 var passwordController = TextEditingController();

 var emailerror = null;
 var passworderror = null;
  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    passwordVisible = true;
  }

  var outlineBorder = OutlineInputBorder(
    borderRadius: BorderRadius.circular(8),
    borderSide: BorderSide.none,
  );

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.black,
      body: SafeArea(
        child: SingleChildScrollView(
              reverse: true,
              child: SizedBox(
                height: MediaQuery.of(context).size.height -
                        MediaQuery.of(context).viewInsets.top +
                        MediaQuery.of(context).viewInsets.bottom,
                child: Padding(
                  padding: const EdgeInsets.all(16.0),
                  child: Column(
                    children: [
                      Image.asset(
                        'assets/logo.png',
                        height: 130,
                        width: 130,
                      ),
                      Expanded(
                        child: Container(
                          alignment: Alignment.center,
                          child: Container(
                            padding: EdgeInsets.symmetric(horizontal: 18),
                            decoration: BoxDecoration(
                              borderRadius: BorderRadius.circular(20),
                              color: Colors.grey.shade700,
                            ),
                            child: Column(
                              mainAxisSize: MainAxisSize.min,
                              children: [
                                SizedBox(
                                  height: 24,
                                ),
                                Text(
                                  'Sign In',
                                  style: TextStyle(
                                      fontSize: 18,
                                      color: Colors.white,
                                      fontStyle: FontStyle.italic,
                                      fontWeight: FontWeight.w500),
                                ),
                                SizedBox(
                                  height: 10,
                                ),
                                Text(
                                  'Please Sign in to continue',
                                  style: TextStyle(
                                    fontSize: 14,
                                    color: Colors.white,
                                  ),
                                ),
                                SizedBox(
                                  height: 24,
                                ),
                                TextFormField(
                                  controller: emailController,
                                  keyboardType: TextInputType.emailAddress,
                                  decoration: InputDecoration(
                                    errorText: emailerror,
                                    filled: true,
                                    fillColor: Colors.white,
                                    errorBorder: OutlineInputBorder(
                                      borderSide: BorderSide(
                                        color: Colors.red,
                                      ),
                                      borderRadius: BorderRadius.circular(8),
                                    ),
                                    errorStyle: TextStyle(
                                        color: Colors.red
                                    ),
                                    enabledBorder: outlineBorder,
                                    border: outlineBorder,
                                    focusedBorder: outlineBorder,
                                    hintText: 'Email Address',
                                    alignLabelWithHint: true,
                                    contentPadding: EdgeInsets.symmetric(vertical: 10, horizontal: 16),
                                  ),
                                ),
                                SizedBox(
                                  height: 24,
                                ),
                                TextFormField(
                                  controller: passwordController,
                                  keyboardType: TextInputType.text,
                                  obscureText: passwordVisible,
                                  decoration: InputDecoration(
                                    errorText: passworderror,
                                    filled: true,
                                    fillColor:Colors.white,
                                    errorBorder: OutlineInputBorder(
                                      borderSide: BorderSide(
                                        color: Colors.red,
                                      ),
                                      borderRadius: BorderRadius.circular(8),
                                    ),
                                    errorStyle: TextStyle(
                                        color: Colors.red
                                    ),
                                    suffixIcon: IconButton(
                                      icon: Icon(
                                        passwordVisible
                                            ? Icons.visibility
                                            : Icons.visibility_off,
                                        color: Colors.grey,
                                      ),
                                      onPressed: () {
                                        setState(
                                          () {
                                            passwordVisible =
                                                !passwordVisible;
                                          },
                                        );
                                      },
                                    ),
                                    enabledBorder: outlineBorder,
                                    border: outlineBorder,
                                    focusedBorder: outlineBorder,
                                    hintText: 'Password',
                                    alignLabelWithHint: true,
                                    contentPadding: EdgeInsets.symmetric(vertical: 10, horizontal: 16),
                                  ),
                                ),
                                SizedBox(
                                  height: 24,
                                ),
                                Align(
                                  alignment: Alignment.centerRight,
                                  child: GestureDetector(
                                    onTap: () {},
                                    child: Text(
                                      "Forgot Password?",
                                      style: TextStyle(color: Colors.white),
                                    ),
                                  ),
                                ),
                                SizedBox(
                                  height: 30,
                                ),
                                MaterialButton(
                                  color: Colors.red,
                                  minWidth: double.infinity,
                                  shape: RoundedRectangleBorder(
                                      borderRadius:
                                          BorderRadius.circular(8)),
                                  child: Text(
                                    'SIGN IN',
                                    style: TextStyle(
                                        fontSize: 14, color: Colors.white),
                                  ),
                                  padding: EdgeInsets.symmetric(
                                      vertical: 20),
                                  onPressed: () async {
                                    String email = emailController.text.trim();
                                    String password =passwordController.text.trim();

                                    emailerror = null;
                                    passworderror = null;

                                     /* if (!Utils.isValidEmail(email)) {
                                        //show error on email
                                        emailerror = "Enter valid Email Address";
                                      } else if (!Utils.isValidPassword(password)) {
                                        //show error on password
                                        passworderror = "Enter Valid PassWord";
                                      } else {*/

                                        var data = await logIn(email,password);

                                        if(data?.status=='success'){
                                          ScaffoldMessenger.of(context).showSnackBar(
                                            const SnackBar(content: Text('Sign In successfully')),
                                          );
                                          Navigator.pushReplacementNamed(context,AppRoute.homeScreen);
                                        }else if(data?.message=='User does not exists'){
                                            emailerror ="Enter valid User Name";
                                          }else if(data?.message=='incorrect password'){
                                            passworderror='Enter valid Password';
                                          }
                                  },
                                ),
                                SizedBox(
                                  height: 24,
                                ),
                              ],
                            ),
                          ),
                        ),
                      ),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          Text(
                            'Don\'t have an account?',
                            style: TextStyle(color: Colors.white),
                          ),
                          TextButton(
                            onPressed: () {
                              Navigator.pushNamed(context, AppRoute.signUpScreen);
                            },
                            child: Text('Sign Up',
                                style: TextStyle(
                                    color: Colors.white,
                                    fontWeight: FontWeight.bold)),
                          )
                        ],
                      )
                    ],
                  ),
                ),
              ),
        ),
      ),
    );
  }

  Future<LoginResponse?> logIn(String email, String password) async {
    final bodyData = <String,dynamic>{
      'flag': "6",
      'email': email,
      'password': password
    };
    var responce= await post(Uri.parse('http://$ipAddress/api/student.php'),body:bodyData);
      if(responce.statusCode==200){
       return LoginResponse.fromJson(jsonDecode(responce.body));
      }
  }
}
