import 'package:flutter/material.dart';

class account extends StatelessWidget {
  const account({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.grey.shade400,
      appBar: AppBar(
        centerTitle: true,
        leading: Padding(
          padding: EdgeInsets.symmetric(horizontal: 130),
          child: Icon(
            color: Colors.grey.shade500,
            Icons.person_pin,
          ),
        ),
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(30),
        ),
        backgroundColor: Colors.black,
        title: Text('Account', style: TextStyle(color: Colors.grey.shade500)),
      ),
      body: Center(
        child: Text(
          'Account Screen',
          style: TextStyle(
            fontSize: 20,
          ),
        ),
      ),
    );
  }
}