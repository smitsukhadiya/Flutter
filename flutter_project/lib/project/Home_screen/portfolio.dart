import 'package:flutter/material.dart';

class portfolio extends StatelessWidget {
  const portfolio({Key? key}) : super(key: key);

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
            Icons.account_balance_wallet,
          ),
        ),
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(30),
        ),
        backgroundColor: Colors.black,
        title: Text('Portfolio', style: TextStyle(color: Colors.grey.shade500)),
      ),
      body: Center(
        child: Text(
          'Portfolio Screen',
          style: TextStyle(
            fontSize: 20,
          ),
        ),
      ),
    );
  }
}