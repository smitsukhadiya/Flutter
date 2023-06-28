import 'package:flutter/material.dart';
import 'package:flutter_practical/Routing%20Extras/second_route.dart';
import 'package:flutter_practical/Routing%20Extras/third_route.dart';

class firstroute extends StatelessWidget{
  const firstroute({Key? Key}) : super(key: Key);

  @override
  Widget build(BuildContext context){
    return Scaffold(
      appBar: AppBar(
        title: Text("First Route"),
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Text(
              'First Route',
              style: TextStyle(fontSize: 30),
            ),
            SizedBox(
              height: 20,
            ),
            ElevatedButton(onPressed: (){
              Navigator.push(
                  context,
                  MaterialPageRoute(
                      builder: (context) => secondroute(),
                  ),
              );
            },
              child: Text('Go to Second',),
            ),
           ElevatedButton(onPressed: (){
              Navigator.pushReplacement(
                context,
                MaterialPageRoute(
                  builder: (context) =>secondroute(),
                ),
              );
            },
              child: Text('Push Replacement'),
            ),
          ],
        ),
      ),
    );
  }
}
