import 'package:flutter/material.dart';

void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Row & Column Widget',
      home: Scaffold(
        appBar: AppBar(
          title: Text('Row & Column Widget'),
        ),
        body: Center(
          child: Container(
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: [
                  Column(
                    mainAxisSize: MainAxisSize.min,
                    crossAxisAlignment: CrossAxisAlignment.center,
                    children: [
                      Icon(
                        size: 32,
                        Icons.train_outlined,
                        color: Colors.red,
                      ),
                      SizedBox(height: 5),
                      Text(
                          'Bus',
                        style: TextStyle(
                          fontSize: 22,
                          fontWeight: FontWeight.w500,
                        ),
                      )
                    ],
                  ),
                  Column(
                    mainAxisSize: MainAxisSize.min,
                    children: [
                      Icon(
                        Icons.train,
                        color: Colors.blue,
                        size: 32,
                      ),
                      SizedBox(
                        height: 5,
                      ),
                      Text(
                          'Train',
                        style: TextStyle(
                          fontSize: 22,
                          fontWeight: FontWeight.w500,
                        ),
                      ),
                    ],
                  ),
                  Column(
                    mainAxisSize: MainAxisSize.min,
                    children: [
                      Icon(
                        Icons.flight,
                        color: Colors.orange,
                        size: 32,
                      ),
                      SizedBox(
                        height: 5,
                      ),
                      Text(
                          'Airplane',
                        style: TextStyle(
                          fontSize: 22,
                          fontWeight: FontWeight.w500,
                        ),
                      ),
                    ],
                  ),
                ],
              ),
          ),
        ),
      ),
    );
  }
}
