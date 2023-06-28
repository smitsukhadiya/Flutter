import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

class statefulWidget extends StatefulWidget {
  const statefulWidget({Key? key}) : super(key: key);

  @override
  State<statefulWidget> createState() => _statefulWidgetState();
}

class _statefulWidgetState extends State<statefulWidget> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Stateful widget'),
      ),
      body: Center(
        child: Padding(
          padding: EdgeInsets.all(25),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
             TextField(
               autofocus: false,
               keyboardType: TextInputType.text,
              // textAlign: TextAlign.center,
               cursorHeight: 22,
              decoration:InputDecoration(
               // hintText: 'Enter Name',
                labelText: 'Enter Name',
             labelStyle: TextStyle(
               fontSize: 20,
             ),
             // border: InputBorder.none,
              contentPadding: EdgeInsets.symmetric(horizontal: 25),
               border: OutlineInputBorder(
                  borderRadius: BorderRadius.all(Radius.circular(25)),
                ),
              ),
             ),
              SizedBox(height: 15,),
              TextField(
                keyboardType: TextInputType.emailAddress,
                cursorHeight: 22,
                decoration:InputDecoration(
                  labelText: 'Enter Email Address',
                  labelStyle: TextStyle(
                    fontSize: 20,
                  ),
                  contentPadding: EdgeInsets.symmetric(horizontal: 25),
                  border: OutlineInputBorder(
                    borderRadius: BorderRadius.all(Radius.circular(25)),
                  ),
                ),
              ),
              SizedBox(height: 15,),
              TextField(
                maxLength: 10,
               // readOnly: true,
                keyboardType: TextInputType.number,
                cursorHeight: 22,
                decoration:InputDecoration (
                labelText: 'Enter Number',
                  labelStyle: TextStyle(
                   fontSize: 20,
                  ),
                  contentPadding: EdgeInsets.symmetric(horizontal: 25),
                  border: OutlineInputBorder(
                    borderRadius: BorderRadius.all(Radius.circular(25),),
                  ),
                ),
              ),
              SizedBox(height: 10,),
              TextField(
                maxLength: 16,
                keyboardType: TextInputType.text,
                cursorHeight: 22,
                obscureText: true,
                obscuringCharacter: '*',
                decoration:InputDecoration(
                  labelText: 'Enter Password',
                  labelStyle: TextStyle(
                    fontSize: 20,
                  ),
                  contentPadding: EdgeInsets.symmetric(horizontal: 25),
                  border: OutlineInputBorder(
                    borderRadius: BorderRadius.all(Radius.circular(25)),
                  ),
                ),
              ),
              ElevatedButton(onPressed: (){}, child: Text('Log In'),),
            ],
          ),
        ),
      ),
    );
  }
}
