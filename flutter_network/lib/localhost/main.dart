import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:flutter_network_request/localhost/Model/RegisterResponce.dart';
import 'package:http/http.dart';

void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Material App',
      home: signup(),
    );
  }
}
class signup extends StatefulWidget {
  const signup({Key? key}) : super(key: key);

  @override
  State<signup> createState() => _signupState();
}

class _signupState extends State<signup> {
  var name = TextEditingController();
  var email = TextEditingController();
  var contact = TextEditingController();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Sign Up'),
      ),
      body: Center(
        child: Padding(
          padding: EdgeInsets.all(20),
          child: Column(
            children: [
              TextField(
                controller:name,
                decoration: InputDecoration(
                  hintText: 'Enter Name',
                ),
              ),
              SizedBox(height: 10,),
              TextField(
                controller:email,
                decoration: InputDecoration(
                  hintText: 'Enter Email',
                ),
              ),
              SizedBox(height: 10,),
              TextField(
                controller:contact,
                decoration: InputDecoration(
                  hintText: 'Enter Contact',
                ),
              ),
              SizedBox(height: 16,),
              ElevatedButton(onPressed:() async {
                String name1 = name.text;
                String email1 = email.text;
                String contact1 = contact.text;
               var response = await register(name1,email1,contact1);

               print(response.message);
               if(response.status=='success'){
                 //Navigate to home screen
               }
              }, child: Text('Sign Up'))
            ],
          ),
        ),
      ),
    );
  }

  Future<RegisterReponce> register(String name1, String email1, String contact1) async {

    final formData =<String,dynamic> {
      'flag':"1",
      'name':name1,
      'email':email1,
      'mobile':contact1
    };
  var res= await post(
        Uri.parse(
        'http://192.168.1.11/api/student.php'
    ),
        body: formData);
  if(res.statusCode==200){
    return RegisterReponce.fromJson(jsonDecode(res.body));
  }else{
    throw Exception('Faild to Submit');
  }
  }
}
