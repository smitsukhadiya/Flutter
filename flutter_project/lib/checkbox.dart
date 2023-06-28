import 'package:flutter/material.dart';

void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Material App',
      home:checkboxexample(),
    );
  }
}
class checkboxexample extends StatefulWidget {
  const checkboxexample({Key? key}) : super(key: key);

  @override
  State<checkboxexample> createState() => _checkboxexampleState();
}

class _checkboxexampleState extends State<checkboxexample> {
  bool ischecked = false;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Check Box'),
      ),
      body:Center(
        child:ListTile(
          title: Text('Term & Conditions'),
          onTap: () {
          },
          leading:Checkbox(
            value:ischecked,
            onChanged: (value) {
              setState(() {
                ischecked = value!;
              });
            },
          ),
        )
      ),
    );
  }
}
