import 'package:flutter/material.dart';
import 'package:url_launcher/url_launcher.dart';

void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Material App',
      home: intent(),
    );
  }
}
class intent extends StatefulWidget {
  const intent({Key? key}) : super(key: key);

  @override
  State<intent> createState() => _intentState();
}

class _intentState extends State<intent> {
  TextEditingController number = TextEditingController();
  TextEditingController sms = TextEditingController();
  TextEditingController email = TextEditingController();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Communication App'),
      ),
      body: Center(
        child:Padding(
          padding: EdgeInsets.all(20),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              TextField(
                controller:number,
                maxLength: 10,
                keyboardType: TextInputType.number,
                textAlign: TextAlign.center,
                decoration: InputDecoration(
                  hintText: 'Enter Phone Number',
                  border: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(20),
                  )
                ),
              ),
              SizedBox(height: 5,),

              TextField(
                controller:email,
                keyboardType: TextInputType.emailAddress,
                textAlign: TextAlign.center,
                decoration: InputDecoration(
                    hintText: 'Type E-mail Address Here',
                    border: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(20),
                    )
                ),
              ),
              SizedBox(height: 5,),
              TextField(
                controller:sms,
                keyboardType: TextInputType.text,
                textAlign: TextAlign.center,
                decoration: InputDecoration(
                    hintText: 'Type Text Here',
                    border: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(20),
                    )
                ),
              ),
              SizedBox(height: 5,),
              ElevatedButton(onPressed: () {
                var contact = number.text.trim();
                MakePhoneCall(contact);
              }, child:Text('Make CALL')),
              ElevatedButton(onPressed:() {
                var num = number.text.trim();
                var SMS = sms.text.trim();
                MakeSms(num,SMS);
              }, child: Text('Send SMS')),
              ElevatedButton(onPressed: () {
                var mail = email.text.trim();
                var SMS = sms.text.trim();
                if(mail.isNotEmpty && SMS.isNotEmpty)
                MakeMail(mail,SMS);
              }, child:Text('Send Mail')),
            ],
          ),
        ),
      ),
    );
  }

  Future<void> MakePhoneCall(String contact) async {
   var url = await Uri(scheme:'tel',path: contact);
   await launchUrl(url);
  }

  void MakeSms(String num, String sms) {
    launch('sms:$num?body=$sms');
  }

  void MakeMail(String mail, String sms) {
    launch('mailto:$mail?subject=This is Subject Title&body=$sms');
  }
}
