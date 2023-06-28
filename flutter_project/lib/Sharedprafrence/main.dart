import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';

void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'SharedPreferences',
      home: sharedpreferenceexample(),
    );
  }
}
class sharedpreferenceexample extends StatefulWidget {
  const sharedpreferenceexample({Key? key}) : super(key: key);

  @override
  State<sharedpreferenceexample> createState() => _sharedpreferenceexampleState();
}

class _sharedpreferenceexampleState extends State<sharedpreferenceexample> {
  var _nameController = TextEditingController();
  var _emailController = TextEditingController();
  var _ageController = TextEditingController();

  var result = '';

  saveRecord({required String name,required String email,required int age}) async {
  final pref = await SharedPreferences.getInstance();
  pref.setString('_name', name);
  pref.setString('_email', email);
  pref.setInt('_age', age);

  setState(() {
    print('data saved');
   _ageController.text = '';
   _emailController.text = '';
   _nameController.text = '';
   });
  }

   readRecord() async {
    final pref = await SharedPreferences.getInstance();
    final name = pref.getString('_name') ?? '';
    final email =pref.getString('_email') ?? '';
    final age = pref.getInt('_age') ?? 0;
    setState(() {
      result = '''
      name : $name;
      email : $email;
      age : $age
      ''';
    });
  }
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Shared Preference'),
      ),
      body:Padding(
        padding: EdgeInsets.all(20),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            TextField(
              controller: _nameController,
              keyboardType: TextInputType.name,
              decoration:InputDecoration(
                hintText: 'Enter Name'
              ),
            ),
            SizedBox(height: 10),
            TextField(
              controller: _emailController,
              keyboardType: TextInputType.emailAddress,
              decoration:InputDecoration(
                  hintText: 'Enter Email'
              ),
            ),
            SizedBox(height: 10),
            TextField(
              controller: _ageController,
              keyboardType: TextInputType.number,
              decoration:InputDecoration(
                  hintText: 'Enter Age'
              ),
            ),
            SizedBox(height: 10),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: [
                ElevatedButton(onPressed: () {
                  readRecord();
                },
                    child: Text('Read')),
                ElevatedButton(onPressed: () {
                  saveRecord(
                    name: _nameController.text,
                    email: _emailController.text,
                    age: int.parse(_ageController.text)
                  );
                },
                    child: Text('Save')),
              ],
            ),
            SizedBox(height: 20,),
            Text(result,style: TextStyle(fontSize: 20),)
          ],
        ),
      ),
    );
  }
}
