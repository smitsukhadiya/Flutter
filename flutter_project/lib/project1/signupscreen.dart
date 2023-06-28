import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:flutter_practical/project1/SignUpResponce.dart';
import 'package:flutter_practical/project1/homescreen.dart';
import 'package:http/http.dart';


class signupscreen extends StatefulWidget {
  const signupscreen({Key? key}) : super(key: key);

  @override
  State<signupscreen> createState() => _signupscreenState();
}

class _signupscreenState extends State<signupscreen> {
  var namecontroller = TextEditingController();
  var contactcontroller = TextEditingController();
  var emailcontroller = TextEditingController();
  var namerror = null;
  var contacterror = null;
  var emailerror = null;

  @override
  Widget build(BuildContext context) {
    return Scaffold(

      body: SingleChildScrollView(
        reverse: true,
        scrollDirection: Axis.vertical,
        child: Container(
          width: MediaQuery.of(context).size.width,
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
                        Text('Sign Up To Continue',style: TextStyle(fontSize: 30,fontWeight: FontWeight.bold,color: Colors.blue.shade100),)
                      ],
                    )),
              ),
              Container(
                color: Colors.grey.shade300,
                child: Padding(
                  padding: EdgeInsets.all(20),
                  child: Column(
                    children: [
                      TextField(
                        controller: namecontroller,
                        style : TextStyle(
                    color: Colors.blue.shade900,
                    fontWeight: FontWeight.bold,
                  ),
                        decoration: InputDecoration(
                          enabledBorder: OutlineInputBorder(
                              borderRadius: BorderRadius.circular(20),
                              borderSide: BorderSide(
                                  color: Colors.blue.shade100
                              )
                          ),
                            prefixIcon: Icon(
                              Icons.drive_file_rename_outline_sharp,
                            ),
                             errorText:namerror,
                          errorBorder: OutlineInputBorder(
                            borderSide: BorderSide(
                              color: Colors.red,
                            ),
                            borderRadius: BorderRadius.circular(20),
                          ),
                          errorStyle: TextStyle(
                            color: Colors.red,
                          ),
                            filled: true,
                            fillColor:namerror==null? Colors.blue.shade100 :Colors.red.shade300,
                            hintText: 'Enter Name',
                            border: OutlineInputBorder(
                              borderRadius: BorderRadius.circular(20),
                            ),
                        ),
                      ),
                      SizedBox(height: 10,),
                      TextField(
                        controller: contactcontroller,
                        keyboardType: TextInputType.number,
                        style : TextStyle(
                          color: Colors.blue.shade900,
                          fontWeight: FontWeight.bold,
                        ),
                        decoration: InputDecoration(
                            enabledBorder: OutlineInputBorder(
                                borderRadius: BorderRadius.circular(20),
                                borderSide: BorderSide(
                                    color: Colors.blue.shade100
                                )
                            ),
                            prefixIcon: Icon(
                              Icons.call,
                            ),
                            errorText:contacterror,
                            errorBorder: OutlineInputBorder(
                              borderSide: BorderSide(
                                color: Colors.red,
                              ),
                              borderRadius: BorderRadius.circular(20),
                            ),
                            errorStyle: TextStyle(
                              color: Colors.red,
                            ),
                            filled: true,
                            fillColor:contacterror==null? Colors.blue.shade100 :Colors.red.shade300,
                            hintText: 'Enter Contact Number',
                            border: OutlineInputBorder(
                              borderRadius: BorderRadius.circular(20),
                            )
                        ),
                      ),
                      SizedBox(height: 10,),
                      TextField(
                        controller: emailcontroller,
                        keyboardType: TextInputType.emailAddress,
                        style : TextStyle(
                          color: Colors.blue.shade900,
                          fontWeight: FontWeight.bold,
                        ),
                        decoration: InputDecoration(
                            enabledBorder: OutlineInputBorder(
                                borderRadius: BorderRadius.circular(20),
                                borderSide: BorderSide(
                                    color: Colors.blue.shade100
                                )
                            ),
                            prefixIcon: Icon(
                              Icons.attach_email,
                            ),
                            errorText:emailerror,
                            errorBorder: OutlineInputBorder(
                              borderSide: BorderSide(
                                color: Colors.red,
                              ),
                              borderRadius: BorderRadius.circular(20),
                            ),
                            errorStyle: TextStyle(
                              color: Colors.red,
                            ),
                            filled: true,
                            fillColor:emailerror==null? Colors.blue.shade100 :Colors.red.shade300,
                            hintText: 'Enter Email-Address',
                            border: OutlineInputBorder(
                              borderRadius: BorderRadius.circular(20),
                            )
                        ),
                      ),
                      SizedBox(height: 10,),
                      TextField(
                        textAlign: TextAlign.center,
                        readOnly: true,
                        style : TextStyle(
                          color: Colors.blue.shade900,
                          fontWeight: FontWeight.bold,
                        ),
                        decoration: InputDecoration(
                            prefixIcon: Icon(
                              Icons.shield,
                            ),
                          filled: true,
                          fillColor: Colors.blue.shade100,
                            enabledBorder: OutlineInputBorder(
                              borderRadius: BorderRadius.circular(20),
                              borderSide: BorderSide(
                                color: Colors.blue.shade100
                              )
                            ),
                            hintText: 'PASS [ 1 2 3 4 5 6 ] WORD',
                              border: OutlineInputBorder(
                                borderRadius: BorderRadius.circular(20),
                            ),
                        ),
                      ),
                      SizedBox(height: 20,),
                      ElevatedButton(
                        style: ElevatedButton.styleFrom(
                          elevation: 50,
                          shape: RoundedRectangleBorder(
                            side: BorderSide(color: Colors.blue.shade300),
                            borderRadius: BorderRadius.circular(20),
                          ),
                          backgroundColor: Colors.black,
                          padding: EdgeInsets.only(left: 140,right: 140,top: 20,bottom: 20),
                        ),
                          onPressed: () async {
                          var name = namecontroller.text;
                          var contact = contactcontroller.text;
                          var email = emailcontroller.text;

                          namerror = null;
                          emailerror = null;
                          contacterror = null;
                          var responce = await signUp(name,contact,email);

                          if(responce?.status=='success'){
                            Navigator.pushReplacement(context,MaterialPageRoute(builder: (context) => homescreen(),));
                          }
                         setState(() {
                           if(name==null || name.isEmpty){
                             namerror = "Enter name First";
                           };
                           if(contact==null || contact.isEmpty){
                             contacterror = "Enter your Contact Number";
                           };
                           if(email==null ||email.isEmpty){
                             emailerror = "Enter E-mail First";
                           };
                         });
                      }, child:Text('Sign Up',style: TextStyle(fontWeight: FontWeight.bold,fontSize: 20,color: Colors.blue.shade300),))
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

  Future<SignUpResponce?> signUp(String name, String contact, String email) async {
    final signUpData = <String,dynamic>{
      'flag' : "1",
      'name' : name,
      'mobile' : contact,
      'email' : email
    };
    var res = await post(
      Uri.parse('http://192.168.1.7/api/student.php'),
      body: signUpData
    );
    if(res.statusCode==200){
      return SignUpResponce.fromJson(jsonDecode(res.body));
    }
  }
}
