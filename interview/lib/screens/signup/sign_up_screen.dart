import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:http/http.dart';
import 'package:interview/constants.dart';
import 'package:interview/routes/app_route.dart';
import 'package:interview/screens/login/Login_response.dart';


import '../../utils.dart';

class SignUpScreen extends StatefulWidget {
  const SignUpScreen({super.key});

  @override
  State<SignUpScreen> createState() => _SignUpScreenState();
}

class _SignUpScreenState extends State<SignUpScreen> {
  bool passwordVisible = false;
  bool confirmPasswordVisible = false;

  final _formKey = GlobalKey<FormState>();
 var passwordController = TextEditingController();

 String name = '',email = '',contact = '';
  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    passwordVisible = true;
    confirmPasswordVisible = true;
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
        child:  SingleChildScrollView(
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
                        height: 120,
                        width: 120,
                      ),
                      Expanded(
                        child: Container(
                          alignment: Alignment.center,
                          child: Form(
                            key: _formKey,
                            child: Container(
                              padding: EdgeInsets.symmetric(horizontal: 18),
                              decoration: BoxDecoration(
                                borderRadius: BorderRadius.circular(10),
                                color: Colors.grey.shade700,
                              ),
                              child: Column(
                                mainAxisSize: MainAxisSize.min,
                                children: [
                                  SizedBox(
                                    height: 24,
                                  ),
                                  Text(
                                    'Sign Up',
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
                                    'Please Sign up to continue',
                                    style: TextStyle(
                                      fontSize: 14,
                                      color: Colors.white,
                                    ),
                                  ),
                                  SizedBox(
                                    height: 16,
                                  ),
                                  TextFormField(
                                    validator: (value) {
                                      if(value == null || value.isEmpty){
                                        return 'Please Enter Your Name';
                                      }
                                      return null;
                                    },
                                    onSaved: (newValue) {
                                      name = newValue.toString();
                                    },
                                    keyboardType: TextInputType.text,
                                    decoration: InputDecoration(
                                      filled: true,
                                      fillColor: Colors.white,
                                      enabledBorder: outlineBorder,
                                      border: outlineBorder,
                                      errorBorder: OutlineInputBorder(
                                        borderSide: BorderSide(
                                          color: Colors.red,
                                        ),
                                        borderRadius: BorderRadius.circular(8),
                                      ),
                                      errorStyle: TextStyle(
                                          color: Colors.red
                                      ),
                                      focusedBorder: outlineBorder,
                                      hintText: 'Name',
                                      alignLabelWithHint: true,
                                      contentPadding: EdgeInsets.symmetric(vertical: 10, horizontal: 16),
                                    ),
                                  ),
                                  SizedBox(
                                    height: 16,
                                  ),
                                  TextFormField(
                                    validator: (value) {
                                      if(value == null || !Utils.isValidEmail(value)){
                                        return 'Enter Valid Email Address';
                                      }
                                      return null;
                                    },
                                    onSaved: (newValue) {
                                      email = newValue.toString();
                                    },
                                    keyboardType: TextInputType.emailAddress,
                                    decoration: InputDecoration(
                                      filled: true,
                                      fillColor: Colors.white,
                                      enabledBorder: outlineBorder,
                                      border: outlineBorder,
                                      errorBorder: OutlineInputBorder(
                                        borderSide: BorderSide(
                                          color: Colors.red,
                                        ),
                                        borderRadius: BorderRadius.circular(8),
                                      ),
                                      errorStyle: TextStyle(
                                          color: Colors.red
                                      ),
                                      focusedBorder: outlineBorder,
                                      hintText: 'Email Address',
                                      alignLabelWithHint: true,
                                      contentPadding: EdgeInsets.symmetric(vertical: 10, horizontal: 16),
                                    ),
                                  ),
                                  SizedBox(
                                    height: 16,
                                  ),
                                  TextFormField(
                                    validator: (value) {
                                      if(value == null){
                                        return 'Enter Valid Contact Number';
                                      }
                                      return null;
                                    },
                                    onSaved: (newValue) {
                                      contact = newValue.toString();
                                    },
                                    keyboardType: TextInputType.number,
                                    decoration: InputDecoration(
                                      filled: true,
                                      fillColor: Colors.white,
                                      enabledBorder: outlineBorder,
                                      border: outlineBorder,
                                      errorBorder: OutlineInputBorder(
                                        borderSide: BorderSide(
                                          color: Colors.red,
                                        ),
                                        borderRadius: BorderRadius.circular(8),
                                      ),
                                      errorStyle: TextStyle(
                                          color: Colors.red
                                      ),
                                      focusedBorder: outlineBorder,
                                      hintText: 'Contact Number',
                                      alignLabelWithHint: true,
                                      contentPadding: EdgeInsets.symmetric(vertical: 10, horizontal: 16),
                                    ),
                                  ),
                                  SizedBox(
                                    height: 16,
                                  ),
                                  TextFormField(
                                    controller: passwordController,
                                    validator: (value) {
                                      if(value == null || value!='123456'){
                                        return 'Enter Valid Password';
                                      }
                                    },
                                    keyboardType: TextInputType.text,
                                    obscureText: passwordVisible,
                                    decoration: InputDecoration(
                                      filled: true,
                                      fillColor: Colors.white,
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
                                      errorBorder: OutlineInputBorder(
                                        borderSide: BorderSide(
                                          color: Colors.red,
                                        ),
                                        borderRadius: BorderRadius.circular(8),
                                      ),
                                      errorStyle: TextStyle(
                                          color: Colors.red
                                      ),
                                      border: outlineBorder,
                                      focusedBorder: outlineBorder,
                                      hintText: 'Password',
                                      alignLabelWithHint: true,
                                      contentPadding: EdgeInsets.symmetric(vertical: 10, horizontal: 16),
                                    ),
                                  ),
                                  SizedBox(
                                    height: 16,
                                  ),
                                  TextFormField(
                                    validator: (value) {
                                      if(value == null || value!=passwordController.text.toString().trim()){
                                        return 'Password mismatch';
                                      }
                                      return null;
                                    },
                                    keyboardType: TextInputType.text,
                                    obscureText: confirmPasswordVisible,
                                    decoration: InputDecoration(
                                      filled: true,
                                      fillColor: Colors.white,
                                      suffixIcon: IconButton(
                                        icon: Icon(
                                          confirmPasswordVisible
                                              ? Icons.visibility
                                              : Icons.visibility_off,
                                          color: Colors.grey,
                                        ),
                                        onPressed: () {
                                          setState(
                                            () {
                                              confirmPasswordVisible =
                                                  !confirmPasswordVisible;
                                            },
                                          );
                                        },
                                      ),
                                      enabledBorder: outlineBorder,
                                      errorBorder: OutlineInputBorder(
                                        borderSide: BorderSide(
                                          color: Colors.red,
                                        ),
                                        borderRadius: BorderRadius.circular(8),
                                      ),
                                      errorStyle: TextStyle(
                                          color: Colors.red
                                      ),
                                      border: outlineBorder,
                                      focusedBorder: outlineBorder,
                                      hintText: 'Confirm password',
                                      alignLabelWithHint: true,
                                      contentPadding: EdgeInsets.symmetric(vertical: 10, horizontal: 16),
                                    ),
                                  ),
                                  SizedBox(
                                    height: 16,
                                  ),
                                  MaterialButton(
                                    color: Colors.red,
                                    minWidth: double.infinity,
                                    shape: RoundedRectangleBorder(
                                        borderRadius:
                                            BorderRadius.circular(8)),
                                    child: Text(
                                      'SIGN UP',
                                      style: TextStyle(
                                          fontSize: 16, color: Colors.white),
                                    ),
                                    padding: EdgeInsets.symmetric(
                                        vertical: 14),
                                    onPressed: () async {
                                      if(_formKey.currentState!.validate()){
                                        _formKey.currentState!.save();
                                      }
                                     var data = await signUp(name,email,contact);
                                      if(data?.status=='success'){
                                        Navigator.pushReplacementNamed(context,AppRoute.homeScreen);
                                        ScaffoldMessenger.of(context).showSnackBar(
                                          const SnackBar(content: Text('Sign Up successfully')),
                                        );
                                      }
                                      }

                                  ),
                                  SizedBox(
                                    height: 24,
                                  ),
                                ],
                              ),
                            ),
                          ),
                        ),
                      ),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          Text(
                            'Have an account?',
                            style: TextStyle(color: Colors.white),
                          ),
                          TextButton(
                            onPressed: () {
                              Navigator.pop(context);
                            },
                            child: Text('Sign In',
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

  Future<LoginResponse?> signUp(String name, String email, String contact) async {
    final bodyData = <String,dynamic>{
      'flag': '1',
      'name': name,
      'email' :email,
      'mobile': contact,
    };

    var response = await post(Uri.parse('http://$ipAddress/api/student.php'),body: bodyData);
    if(response.statusCode==200){
      return LoginResponse.fromJson(jsonDecode(response.body));
    }
  }
}
