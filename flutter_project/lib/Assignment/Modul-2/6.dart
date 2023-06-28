import 'package:flutter/material.dart';

void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Material App',
      home:d6(),
    );
  }
}
class d6 extends StatefulWidget {
  const d6({Key? key}) : super(key: key);

  @override
  State<d6> createState() => _d6State();
}

class _d6State extends State<d6> {
  TextEditingController _value = TextEditingController();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('D6'),
      ),
      body: Center(
        child: Padding(
          padding: EdgeInsets.all(20),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              TextField(
                controller: _value,
                decoration: InputDecoration(
                  hintText: 'Enter here',
                  border: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(20),
                  )
                ),
              ),
              SizedBox(
                height: 30,
              ),
              TextField(
                controller: _value,
                decoration: InputDecoration(
                    hintText: 'Enter here',
                    border: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(20),
                    )
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
