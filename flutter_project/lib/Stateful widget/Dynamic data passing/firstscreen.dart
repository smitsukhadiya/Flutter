import 'package:flutter/material.dart';
import 'package:flutter_practical/Stateful%20widget/Dynamic%20data%20passing/user.dart';
import 'secondscreen.dart';

class firstscreen extends StatefulWidget {
  const firstscreen({Key ? Key}) : super(key: Key);

  @override
  State<firstscreen> createState() => _firstscreenState();
}

class _firstscreenState extends State<firstscreen> {
var _namecontroller = TextEditingController();
var _emialcontroller = TextEditingController();
var _contactcontroller = TextEditingController();
var _agecontroller = TextEditingController();


  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: Text('Dynamic Data Passing'),
        ),
        body: Center(
              child:SingleChildScrollView(
                child: Padding(
                  padding: EdgeInsets.all(20),
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      TextField(
                        controller:_namecontroller,
                        cursorHeight: 25,
                        keyboardType: TextInputType.text,
                        decoration: InputDecoration(
                          labelText: 'Enter Name',
                          border: OutlineInputBorder(borderRadius: BorderRadius.circular(20),),
                        ),
                      ),
                      SizedBox(height: 12,),
                      TextField(
                        controller: _emialcontroller,
                        cursorHeight: 25,
                        keyboardType: TextInputType.emailAddress,
                        decoration: InputDecoration(
                          labelText: 'Enter Email Adress',
                          border: OutlineInputBorder(borderRadius: BorderRadius.circular(20),),
                        ),
                      ),
                      SizedBox(height: 12,),
                      TextField(
                        controller:_contactcontroller ,
                        maxLength: 10,
                        cursorHeight: 25,
                        keyboardType: TextInputType.number,
                        decoration: InputDecoration(
                          labelText: 'Enter Contact Number',
                          border: OutlineInputBorder(borderRadius: BorderRadius.circular(20),),
                        ),
                      ),
                      SizedBox(height: 12,),
                      TextField(
                        controller: _agecontroller,
                        maxLength: 3,
                        cursorHeight: 25,
                        keyboardType: TextInputType.number,
                        decoration: InputDecoration(
                          labelText: 'Enter Age',
                          border: OutlineInputBorder(borderRadius: BorderRadius.circular(20),),
                        ),
                      ),
                      SizedBox(height: 12,),
                      ElevatedButton(onPressed:(){
                        String _name = _namecontroller.text;
                        String _email = _emialcontroller.text;
                        String _contact = _contactcontroller.text;
                        int _age = int.parse(_agecontroller.text);
                        User _user= User(name: _name, email: _email, contact: _contact, age: _age);
                        Navigator.push(context, MaterialPageRoute(builder: (context) => secondscreen(user:_user,),
                         ),
                        );
                      },
                        child:
                        Text('Log In'),
                      ),
                    ],
                  ),
                ),
              ),
        ),
    );
  }
 }
