import 'package:flutter/material.dart';

void main() => runApp(MyApp());

class MyApp extends StatelessWidget {

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Material App',
      home:counterpage(),
    );
  }
}
class counterpage extends StatefulWidget{
  const counterpage({Key ? Key}) : super(key: Key);

  @override
  State<counterpage> createState()=> _counterpageState();
}
class _counterpageState extends State<counterpage> {

  var counter = 0;
  increament(){
    setState(() {
    });
    counter++;
  }
  decreament(){
    setState(() {
    });
    counter--;
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Counter app'),
      ),
      body: Center(
        child: Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            ElevatedButton(onPressed: (){
              decreament();
            },
              child: Text('-'),
            ),
            SizedBox(width: 30,),
            Text('$counter',
              style: TextStyle(fontSize: 30),
            ),
            SizedBox(width: 30,),
            ElevatedButton(onPressed:(){
              increament();
            },
              child: Text('+'),),
          ],
        ),
      ),
    );
  }
}
