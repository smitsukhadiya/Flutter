import 'package:flutter/material.dart';

void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Material App',
      home: radiobuttonexample(),
    );
  }
}

class radiobuttonexample extends StatefulWidget {
  const radiobuttonexample({Key? key}) : super(key: key);

  @override
  State<radiobuttonexample> createState() => _radiobuttonexampleState();
}

class _radiobuttonexampleState extends State<radiobuttonexample> {
  String? gender;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Radio Button'),
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            RadioListTile(
              title: Text('MALE'),
              value: "male",
              groupValue: gender,
              onChanged: (value) {
                setState(() {
                  gender = value.toString();
                });
              },
            ),
            RadioListTile(
              title: Text('FEMALE'),
              value: "female",
              groupValue: gender,
              onChanged: (value) {
                setState(() {
                  gender = value.toString();
                });
              },
            ),
            RadioListTile(
              title: Text('OTHER'),
              value: "other",
              groupValue: gender,
              onChanged: (value) {
                setState(() {
                  gender = value.toString();
                });
              },
            ),
            SizedBox(
              height: 20,
            ),
            ElevatedButton(
              onPressed: () {
                if (gender == null) {
                  print('Select Gender First');
                } else {
                  print(gender);
                }
              },
              child: Text('Validate'),
            ),
          ],
        ),
      ),
    );
  }
}
