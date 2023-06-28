import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:flutter_practical/project1/LoginResponce.dart';
import 'package:flutter_practical/project1/homescreen.dart';
import 'package:flutter_practical/project1/signupscreen.dart';
import 'package:http/http.dart';


class loginscreen extends StatefulWidget {
  const loginscreen({Key? key}) : super(key: key);

  @override
  State<loginscreen> createState() => _loginscreenState();
}

class _loginscreenState extends State<loginscreen> {
  var username = TextEditingController();
  var password = TextEditingController();

  var usernamerror = null;
  var passworderror = null;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SingleChildScrollView(
        scrollDirection: Axis.vertical,
        reverse: true,
        child: Container(
          height: MediaQuery.of(context).size.height,
          child: Column(
            children: [
               Expanded(
              child:Container(
                  width:MediaQuery.of(context).size.width,
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.only(bottomLeft: Radius.circular(20),bottomRight: Radius.circular(20)),
                    color: Colors.black,
                  ),
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Image.asset('assets/200w.gif'),
                      Text('W E L C O M E',style: TextStyle(fontSize: 30,fontWeight: FontWeight.bold,color: Colors.blue.shade200),),
                      SizedBox(height: 10,),
                      Text('Log In To Continue',style: TextStyle(fontSize: 30,fontWeight: FontWeight.bold,color: Colors.blue.shade100),)
                    ],
                  )),
          ),
              Container(
                color: Colors.grey.shade300,
                child: Padding(
                  padding: EdgeInsets.only(left: 35,right: 35),
                  child: Column(
                    children: [
                      SizedBox(height: 20,),
                      TextField(
                        controller: username,
                        style: TextStyle(
                          color: Colors.blue.shade900,
                          fontWeight: FontWeight.bold,
                        ),
                        keyboardType: TextInputType.name,
                        decoration: InputDecoration(
                          enabledBorder: OutlineInputBorder(
                              borderRadius: BorderRadius.circular(20),
                              borderSide: BorderSide(
                                  color: Colors.blue.shade100
                              )
                          ),
                          filled: true,
                          fillColor: usernamerror==null? Colors.blue.shade100 : Colors.red.shade300,
                          prefixIcon: Icon(
                            Icons.person,
                          ),
                          errorText: usernamerror,
                          border: OutlineInputBorder(
                            borderRadius: BorderRadius.circular(20)
                          ),
                          errorBorder: OutlineInputBorder(
                            borderSide: BorderSide(
                              color: Colors.red,
                            ),
                            borderRadius: BorderRadius.circular(20),
                          ),
                          errorStyle: TextStyle(
                            color: Colors.red,
                          ),
                          hintText: 'User Name',
                        ),
                      ),
                      SizedBox(height: 20,),
                      TextField(
                        obscureText: true,
                        controller: password,
                        maxLength: 18,
                        keyboardType: TextInputType.text,
                        style: TextStyle(
                          color: Colors.blue.shade900,
                          fontWeight: FontWeight.bold
                        ),
                        decoration: InputDecoration(
                          enabledBorder: OutlineInputBorder(
                              borderRadius: BorderRadius.circular(20),
                              borderSide: BorderSide(
                                  color: Colors.blue.shade100
                              )
                          ),
                          filled: true,
                          fillColor:passworderror==null? Colors.blue.shade100 : Colors.red.shade300,
                          prefixIcon: Icon(
                            Icons.key,
                          ),
                          errorText: passworderror,
                          errorBorder: OutlineInputBorder(
                            borderRadius: BorderRadius.circular(20),
                            borderSide: BorderSide(
                              color: Colors.red,
                            )
                          ),
                          errorStyle: TextStyle(
                            color: Colors.red,
                          ),
                          border: OutlineInputBorder(
                              borderRadius: BorderRadius.circular(20)
                          ),
                          hintText: 'Password',
                        ),
                      ),
                      SizedBox(height: 10,),
                      Container(
                        alignment: Alignment.centerRight,
                        child: GestureDetector(
                          onTap: () {
                            print('Forgot Password Clicked');
                          },
                          child: Text(
                            'Forgot PassWord?',
                            style: TextStyle(
                              fontWeight: FontWeight.bold,
                              color: Colors.grey.shade800,
                              fontSize: 15,
                            ),
                          ),
                        ),
                      ),
                      SizedBox(
                        height: 10,
                      ),
                     ElevatedButton(
                       style:ElevatedButton.styleFrom(
                         elevation:50,
                         side: BorderSide(color: Colors.blue.shade300),
                         backgroundColor: Colors.black,
                            padding: EdgeInsets.only(right: 125,left: 125,top: 20,bottom: 20),
                           shape: RoundedRectangleBorder(
                             borderRadius: BorderRadius.circular(20),
                           ),
                       ),
                         onPressed: () async {
                             var user = username.text;
                             var pass = password.text;

                             usernamerror = null;
                             passworderror = null;

                            var responce = await login(user,pass);
                            if(responce?.status=='success'){
                             Navigator.pushReplacement(context,MaterialPageRoute(builder:(context) => homescreen(),));
                            }
                            setState(() {
                              if(responce?.message=="User does not exists"){
                                  usernamerror = "Enter valid User Name";
                              }else if(responce?.message=="incorrect password"){
                                passworderror = "Enter valid Password";
                              }
                            });

                     }, child:Text('   Log In   ',style: TextStyle(fontSize: 20,fontWeight: FontWeight.bold,color: Colors.blue.shade300),)),
                      SizedBox(height: 20,),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          Text(
                            'Don\'t have an Account?',
                            style: TextStyle(
                              fontWeight: FontWeight.bold,
                              fontSize: 15,
                              color: Colors.grey.shade900,
                            ),
                          ),
                          SizedBox(
                            width: 8,
                          ),
                          GestureDetector(
                            onTap: () {
                             Navigator.push(context,MaterialPageRoute(builder: (context) => signupscreen(),));
                            },
                            child: Text(
                              'SignUp',
                              style: TextStyle(
                                color: Colors.blue.shade700,
                                fontSize: 20,
                                fontWeight: FontWeight.bold,
                              ),
                            ),
                          ),
                        ],
                      ),
                      SizedBox(height: 20,),
                    ],
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }

  Future<LoginResponce?> login(String user, String pass) async {
    final loginData = <String,dynamic>{
      'flag' : "6",
      'email': user,
      'password' : pass
    };
   var res= await post(
        Uri.parse('http://192.168.1.7/api/student.php'),
      body: loginData
    );
   if(res.statusCode==200){
     return LoginResponce.fromJson(jsonDecode(res.body));
   }
  }
}


