import 'package:flutter/material.dart';
import 'package:url_launcher/url_launcher.dart';

void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Material App',
      home:Email_example(),
    );
  }
}
class Email_example extends StatefulWidget {
  const Email_example({Key? key}) : super(key: key);

  @override
  State<Email_example> createState() => _Email_exampleState();
}

class _Email_exampleState extends State<Email_example> {
  var massages = TextEditingController();
  var email = TextEditingController();
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
                controller:massages,
                keyboardType: TextInputType.text,
                decoration: InputDecoration(
                  hintText: 'Enter Massage Here',
                ),
              ),
              SizedBox(height: 20,),
              TextField(
                controller:email,
                keyboardType: TextInputType.emailAddress,
                decoration: InputDecoration(
                  hintText: 'Enter Email-Address Here',
                ),
              ),
              SizedBox(height: 20,),
              ElevatedButton(onPressed: () {
                var massage = massages.text;
                var mail = email.text;
                if(mail.isEmpty && massage.isEmpty)
                  sendEmail(mail,massage);
              }, child: Text('Make E-Mail'))
            ],
          ),
        ),
      ),
    );
  }

  void sendEmail(String mail, String massage) {
     launch('mailto:$mail?subject=This is Subject Title&body=$massage');
  }
}
