import 'package:flutter/material.dart';
import 'package:url_launcher/url_launcher.dart';

void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Material App',
      home:phone_call_example(), 
    );
  }
}
class phone_call_example extends StatefulWidget {
  const phone_call_example({Key? key}) : super(key: key);

  @override
  State<phone_call_example> createState() => _phone_call_exampleState();
}

class _phone_call_exampleState extends State<phone_call_example> {
  var number = TextEditingController();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Material App Bar'),
      ),
      body: Center(
        child: Column(
          children: [
            Padding(
              padding: EdgeInsets.all(20),
              child: TextField(
                controller:number,
                keyboardType: TextInputType.number,
                decoration: InputDecoration(
                  hintText: 'Enter Number Here',
                ),
              ),
            ),
            ElevatedButton(onPressed: () {
              var contact = number.text;
              makePhoneCall(contact);
            }, child: Text('Make Call'))
          ],
        ),
      ),
    );
  }

  Future<void> makePhoneCall(String contact) async {
   final url = Uri(scheme: 'tel',path: contact);
   await launchUrl(url);
  }
}
