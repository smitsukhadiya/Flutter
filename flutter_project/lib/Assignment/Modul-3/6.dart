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
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Material App Bar'),
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            ElevatedButton(onPressed: () async {
             var result = await datepicker(context);
            }, child:Text('Pick a Date')
            ),
          ],
        ),
      ),
    );
  }

  datepicker(BuildContext context) async {
    return  await showDialog(context: context, builder:(context) {
            return DatePickerDialog(
                initialDate: DateTime.now(),
                firstDate:DateTime(2000),
                lastDate:DateTime(2025)
            );
     },
    );
  }
}
