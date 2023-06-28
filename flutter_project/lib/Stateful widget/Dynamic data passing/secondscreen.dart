import 'package:flutter/material.dart';
import 'package:flutter_practical/Stateful%20widget/Dynamic%20data%20passing/user.dart';

class secondscreen extends StatelessWidget {
  User user;
  secondscreen({required this.user});
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: Text('Second Screen'),
        ),
        body: Center(
          child: Center(
            child: Text(
               ''''
               Name : ${user.name}
               Email : ${user.email}
               Contact number : ${user.contact}
               Age : ${user.age}
                ''',
              style: TextStyle(fontSize: 17),
            ),
          ),
        ),
    );
  }
}
