import 'package:flutter/material.dart';
import 'package:flutter_practical/Navigation_Routing/Navigator/Second_page.dart';

class First_Page extends StatelessWidget {
  const First_Page({Key? key}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: Text('First Route'),
        ),
        body: Center(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Text(
                'First Page',
                style: TextStyle(fontSize: 30),
              ),
              SizedBox(
                height: 20,
              ),
              ElevatedButton(onPressed:(){
               // print('Button Clicked');
                Navigator.push(context,
                    MaterialPageRoute(
                        builder: (context)=>Second_page(),
                    ),
                );
              },
                child: Text('Go to Second'),
              ),
            ],
          ),
        )
      );
  }
}