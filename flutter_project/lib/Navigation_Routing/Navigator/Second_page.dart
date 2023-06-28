import 'package:flutter/material.dart';

class Second_page extends StatelessWidget {
  const Second_page({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Second Route'),
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Text(
              "Second page",
              style: TextStyle(fontSize: 30),
            ),
            SizedBox(height: 20,),
            ElevatedButton(onPressed: () {
              // print('Button Clicked');
              Navigator.pop(context);
            },
              child: Text('Go Back'),
            ),
          ],
        ),
      ),
    );
  }
}



