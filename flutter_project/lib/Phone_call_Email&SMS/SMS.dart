import 'package:flutter/material.dart';
import 'package:url_launcher/url_launcher.dart';

void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Material App',
      home:SMS_example(),
    );
  }
}
class SMS_example extends StatefulWidget {
  const SMS_example({Key? key}) : super(key: key);

  @override
  State<SMS_example> createState() => _SMS_exampleState();
}

class _SMS_exampleState extends State<SMS_example> {
  var number = TextEditingController();
  var SMS = TextEditingController();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Material App Bar'),
      ),
      body: Center(
        child: Padding(
          padding: EdgeInsets.all(20),
          child: Column(
            children: [
              TextField(
                controller:number,
                keyboardType: TextInputType.number,
                decoration: InputDecoration(
                  hintText: 'Enter Number Here',
                ),
              ),
              SizedBox(height: 20,),
              TextField(
                controller:SMS,
                keyboardType: TextInputType.text,
                decoration: InputDecoration(
                  hintText: 'Enter SMS Here',
                ),
              ),
              SizedBox(height: 20,),
              ElevatedButton(onPressed: () {
                var num = number.text;
                var massage = SMS.text;
                makeSMS(num,massage);
              }, child: Text('Make SMS'))
            ],
          ),
        ),
      ),
    );
  }

  void makeSMS(String num, String massage) {
    launch('sms:$num?body=$massage');
  }
  }

