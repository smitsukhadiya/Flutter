import 'package:flutter/material.dart';

void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Material App',
      home: Addition(),
    );
  }
}
class Addition extends StatefulWidget {
  const Addition({Key? key}) : super(key: key);

  @override
  State<Addition> createState() => _AdditionState();
}

class _AdditionState extends State<Addition> {
  TextEditingController num1 = TextEditingController();
  TextEditingController num2 = TextEditingController();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Addition App'),
      ),
      body: Center(
        child: Padding(
          padding: EdgeInsets.all(40),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              TextField(
                keyboardType: TextInputType.number,
                textAlign: TextAlign.center,
                controller: num1,
                decoration: InputDecoration(
                  hintText: 'Enter First Number here',
                  border: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(20),
                  ),
                ),
              ),
              SizedBox(height: 10,),
              TextField(
                keyboardType: TextInputType.number,
                textAlign: TextAlign.center,
                controller: num2,
                decoration: InputDecoration(
                  hintText: 'Enter Second Number here',
                  border: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(20),
                  ),
                ),
              ),
              SizedBox(
                height: 10,
              ),
              ElevatedButton(
                style: ElevatedButton.styleFrom(
                  elevation: 10,
                ),
                  onPressed: () {
                   Navigator.push(context,MaterialPageRoute(builder: (context) =>Result(
                     number1:int.parse(num1.text),
                     number2:int.parse(num2.text),
                   ),));
              }, child: Text('Make SUM')),
            ],
          ),
        ),
      ),
    );
  }
}

class Result extends StatelessWidget {

  final int number1;

  final int number2;

  Result({required this.number1, required this.number2});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        title: Text('Result Page'),
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Text("Entered first number by you : ${number1}",style: TextStyle(fontSize: 20)),
            SizedBox(height: 5,),
            Text('Entered second number by you : ${number2}',style: TextStyle(fontSize: 20)),
            SizedBox(height: 10,),
            Text('Total sum of both numbers: ${number1+number2}',style: TextStyle(fontSize: 20)),
          ],
        ),
      ),
    );
  }
}

