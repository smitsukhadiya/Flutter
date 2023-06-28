import 'dart:ffi';

import 'package:flutter/material.dart';
import 'package:flutter_practical/project/utils.dart';

class signupscreen extends StatefulWidget {
  const signupscreen({Key? key}) : super(key: key);

  @override
  State<signupscreen> createState() => _signupscreenState();
}

class _signupscreenState extends State<signupscreen> {

  final _formkey = GlobalKey<FormState>();
  String? gender;

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
                flex: 2,
                child: Container(
                  width: 400,
                  decoration: BoxDecoration(
                    color: Colors.black,
                    borderRadius: BorderRadius.only(
                        bottomRight: Radius.circular(25),
                        bottomLeft: Radius.circular(25)),
                  ),
                  child: Center(
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Image(
                          image: NetworkImage(
                              'https://www.nsbpictures.com/wp-content/uploads/2019/11/logo-icon-png-8.png'),
                          height: 140,
                          width: 140,
                        ),
                        Text(
                          'SIGN UP',
                          style: TextStyle(
                            fontWeight: FontWeight.bold,
                            fontSize: 30,
                            color: Colors.grey.shade500,
                          ),
                        ),
                        Text(
                          'Create Your Account',
                          style: TextStyle(
                            fontSize: 20,
                            fontWeight: FontWeight.bold,
                            color: Colors.grey.shade600,
                          ),
                        ),
                      ],
                    ),
                  ),
                ),
              ),
              Expanded(
                flex: 3,
                child: Form(
                  key: _formkey,
                  child: Container(
                    color: Colors.grey.shade300,
                    child: Padding(
                      padding: EdgeInsets.symmetric(horizontal: 30),
                      child: ListView(
                        padding: EdgeInsets.symmetric(vertical: 10),

                        children: [
                          TextFormField(
                            validator: (value) {
                              if(value == null || value.isEmpty){
                                return 'Please Enter Your Name';
                              }
                              return null;
                            },
                            cursorHeight: 27,
                            cursorColor: Colors.grey.shade300,
                            style: TextStyle(
                              color: Colors.grey.shade300,
                              fontWeight: FontWeight.bold,
                            ),
                            keyboardType: TextInputType.name,
                            decoration: InputDecoration(
                                prefixIcon: Icon(
                                  Icons.person,
                                  color: Colors.grey.shade300,
                                ),
                                filled: true,
                                fillColor:  Colors.grey.shade500,
                                hintText: 'Enter Name',

                                enabledBorder: OutlineInputBorder(
                                    borderRadius: BorderRadius.circular(20),
                                    borderSide: BorderSide(
                                      color: Colors.grey.shade500,
                                    )
                                ),
                                border: OutlineInputBorder(
                                  borderRadius: BorderRadius.circular(20),
                                ),
                                errorBorder: OutlineInputBorder(
                                  borderSide: BorderSide(
                                    color: Colors.red,
                                  ),
                                  borderRadius: BorderRadius.circular(20),
                                ),
                                errorStyle: TextStyle(
                                    color: Colors.red
                                ),
                                hintStyle: TextStyle(color: Colors.grey.shade300),
                                focusedBorder: OutlineInputBorder(
                                    borderRadius: BorderRadius.circular(20),
                                    borderSide: BorderSide(
                                      color: Colors.grey.shade500,
                                    )
                                )

                            ),
                          ),
                          SizedBox(height: 8),
                          TextFormField(
                            validator: (value) {
                              if (value == null || !Utils.isValidContact(value)){
                                return "Enter Valid Contact Number";
                              }
                              return null;
                            },
                            cursorHeight: 27,
                            cursorColor: Colors.grey.shade300,
                            style: TextStyle(
                              color: Colors.grey.shade300,
                              fontWeight: FontWeight.bold,
                            ),
                            keyboardType: TextInputType.number,
                            maxLength: 10,
                            decoration: InputDecoration(
                                prefixIcon: Icon(
                                  Icons.phone,
                                  color: Colors.grey.shade300,
                                ),
                                filled: true,
                                fillColor: Colors.grey.shade500,
                                hintText: 'Enter Contact Number',
                                enabledBorder: OutlineInputBorder(
                                    borderRadius: BorderRadius.circular(20),
                                    borderSide: BorderSide(
                                      color: Colors.grey.shade500,
                                    )
                                ),
                                border: OutlineInputBorder(
                                  borderRadius: BorderRadius.circular(20),
                                ),
                                errorBorder: OutlineInputBorder(
                                  borderSide: BorderSide(
                                    color: Colors.red,
                                  ),
                                  borderRadius: BorderRadius.circular(20),
                                ),
                                errorStyle: TextStyle(
                                    color: Colors.red
                                ),
                                hintStyle: TextStyle(color: Colors.grey.shade300),
                                focusedBorder: OutlineInputBorder(
                                    borderRadius: BorderRadius.circular(20),
                                    borderSide: BorderSide(
                                      color: Colors.grey.shade500,
                                    )
                                )

                            ),
                          ),
                          SizedBox(height: 8),
                          TextFormField(
                            validator: (value) {
                              if(value == null || !Utils.isValidEmail(value)){
                                return 'Enter Valid Email Address';
                              }
                              return null;
                            },
                            cursorHeight: 27,
                            cursorColor: Colors.grey.shade300,
                            style: TextStyle(
                              color: Colors.grey.shade300,
                              fontWeight: FontWeight.bold,
                            ),
                            decoration: InputDecoration(
                                prefixIcon: Icon(
                                  Icons.mail,
                                  color: Colors.grey.shade300,
                                ),
                                filled: true,
                                fillColor:  Colors.grey.shade500,
                                hintText: 'Enter Email Address',
                                enabledBorder: OutlineInputBorder(
                                    borderRadius: BorderRadius.circular(20),
                                    borderSide: BorderSide(
                                      color: Colors.grey.shade500,
                                    )
                                ),
                                border: OutlineInputBorder(
                                  borderRadius: BorderRadius.circular(20),
                                ),
                                errorBorder: OutlineInputBorder(
                                  borderSide: BorderSide(
                                    color: Colors.red,
                                  ),
                                  borderRadius: BorderRadius.circular(20),
                                ),
                                errorStyle: TextStyle(
                                    color: Colors.red
                                ),
                                hintStyle: TextStyle(color: Colors.grey.shade300),
                                focusedBorder: OutlineInputBorder(
                                    borderRadius: BorderRadius.circular(20),
                                    borderSide: BorderSide(
                                      color: Colors.grey.shade500,
                                    )
                                )
                            ),
                          ),
                          SizedBox(height: 8),
                          TextFormField(
                            validator: (value) {
                              if(value == null || !Utils.isValidPassword(value)){
                                return 'Enter Valid Password';
                              }
                            },
                            cursorHeight: 27,
                            cursorColor: Colors.grey.shade300,
                            style: TextStyle(
                              color: Colors.grey.shade300,
                              fontWeight: FontWeight.bold,
                            ),
                            decoration: InputDecoration(
                                prefixIcon: Icon(
                                  Icons.key,
                                  color: Colors.grey.shade300,
                                ),
                                filled: true,
                                fillColor:  Colors.grey.shade500,
                                hintText: 'Enter PassWord',
                                hintStyle: TextStyle(color: Colors.grey.shade300),
                                enabledBorder: OutlineInputBorder(
                                    borderRadius: BorderRadius.circular(20),
                                    borderSide: BorderSide(
                                      color: Colors.grey.shade500,
                                    )
                                ),
                                border: OutlineInputBorder(
                                  borderRadius: BorderRadius.circular(20),
                                ),
                                errorBorder: OutlineInputBorder(
                                  borderSide: BorderSide(
                                    color: Colors.red,
                                  ),
                                  borderRadius: BorderRadius.circular(20),
                                ),
                                errorStyle: TextStyle(
                                    color: Colors.red
                                ),
                                focusedBorder: OutlineInputBorder(
                                    borderRadius: BorderRadius.circular(20),
                                    borderSide: BorderSide(
                                      color: Colors.grey.shade500,
                                    )
                                )
                            ),
                            obscureText: true,
                          ),
                          SizedBox(height: 8),
                          TextFormField(
                            validator: (value) {
                            if(value == null || !Utils.isValidPassword(value)){
                              return 'Enter Right Password';
                            }
                            return null;
                          },
                            cursorHeight: 27,
                            cursorColor: Colors.grey.shade300,
                            style: TextStyle(
                              color: Colors.grey.shade300,
                              fontWeight: FontWeight.bold,
                            ),
                            decoration: InputDecoration(
                                prefixIcon: Icon(
                                  Icons.key,
                                  color: Colors.grey.shade300,
                                ),
                                filled: true,
                                fillColor: Colors.grey.shade500,
                                hintText: 'Confirm PassWord',
                                hintStyle: TextStyle(color: Colors.grey.shade300),
                                enabledBorder: OutlineInputBorder(
                                    borderRadius: BorderRadius.circular(20),
                                    borderSide: BorderSide(
                                      color: Colors.grey.shade500,
                                    )
                                ),
                                border: OutlineInputBorder(
                                  borderRadius: BorderRadius.circular(20),
                                ),
                                errorBorder: OutlineInputBorder(
                                  borderSide: BorderSide(
                                    color: Colors.red,
                                  ),
                                  borderRadius: BorderRadius.circular(20),
                                ),
                                errorStyle: TextStyle(
                                    color: Colors.red
                                ),
                                focusedBorder: OutlineInputBorder(
                                    borderRadius: BorderRadius.circular(20),
                                    borderSide: BorderSide(
                                      color: Colors.grey.shade500,
                                    )
                                )
                            ),
                            obscureText: true,
                          ),
                       /*  Row(
                           children: [
                             RadioListTile(
                               title: Text('Male'),
                               value: 'male',
                               groupValue: gender,
                               onChanged:(value) {
                                 setState(() {
                                   gender = value.toString();
                                 });
                               },
                             ),
                             RadioListTile(
                               title: Text('Female'),
                               value: 'female',
                               groupValue: gender,
                               onChanged:(value) {
                                 setState(() {
                                   gender = value.toString();
                                 });
                               },
                             ),
                             RadioListTile(
                               title: Text('Other'),
                               value: 'other',
                               groupValue: gender,
                               onChanged:(value) {
                                 setState(() {
                                   gender = value.toString();
                                 });
                               },
                             ),
                           ],
                         ),*/
                          SizedBox(
                            height: 16,
                          ),
                          GestureDetector(
                            onTap: () {
                              if(_formkey.currentState!.validate()){
                                ScaffoldMessenger.of(context).showSnackBar(
                                  const SnackBar(content: Text('Processing Data')),
                                );
                                Navigator.pushNamed(context,'/home');
                              }
                            },
                            child: Container(
                              height: 55,
                              alignment: Alignment.center,
                              decoration: BoxDecoration(
                                borderRadius: BorderRadius.circular(20),
                                color: Colors.black,
                              ),
                              child: Text(
                                'SignUp NoW',
                                style: TextStyle(
                                  fontWeight: FontWeight.bold,
                                  fontSize: 17,
                                  color: Colors.grey.shade300,
                                ),
                              ),
                            ),
                          ),
                        ],
                      ),
                    ),
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
