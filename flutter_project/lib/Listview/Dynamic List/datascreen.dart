import 'package:flutter/material.dart';
import 'package:flutter_practical/Listview/Dynamic%20List/user.dart';


class datascreen extends StatelessWidget {
  User user;

  datascreen(this.user);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(user.title),
      ),
      body: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Text('''
          Id : ${user.id}
          Name : ${user.title}
          E-mail : ${user.subtitle}
            ''',
            style: TextStyle(
              fontSize: 23,
            ),
          ),
        ],
      ),
    );
  }
}
