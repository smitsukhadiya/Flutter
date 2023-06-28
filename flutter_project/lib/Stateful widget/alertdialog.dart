import 'package:flutter/material.dart';

void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Material App',
      home: alertdialogexample(),
    );
  }
}
class alertdialogexample extends StatefulWidget {
  const alertdialogexample({Key? key}) : super(key: key);

  @override
  State<alertdialogexample> createState() => _alertdialogexampleState();
}

class _alertdialogexampleState extends State<alertdialogexample> {

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Dialog Widget'),
      ),
      body: Center(
        child:Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            ElevatedButton(onPressed: () async {
            var result = await _showSimpleDialog(context);
            print(result);
            }, child: Text('Simple Dialog')),

            ElevatedButton(onPressed: () async {
              var result = await _showAlertDialog(context);
              print(result);
            }, child: Text('Alert Dialog')),

            ElevatedButton(onPressed: () async {
              var result = await _showCustomDialog(context);
              print(result);
            }, child: Text('Custom Dialog')),

            ElevatedButton(onPressed: () async {
              var result = await _showDatepickerDialog(context);
              print(result);
            }, child: Text('Date Picker Dialog')),
          ],
        ),
      ),
    );
  }

  _showSimpleDialog(BuildContext context) async {
    return await showDialog(context: context, builder:(context) {
       return SimpleDialog(
          title: Text('Select Language'),
          children: [
            SimpleDialogOption(
              onPressed: () {
            Navigator.pop(context,'Java Clicked');
              },
              child: Text('Java'),
            ),
            SizedBox(height: 8,),
            SimpleDialogOption(
              onPressed: () {
                Navigator.pop(context,'Flutter Clicked');
              },
              child: Text('Flutter'),
            ),
            SizedBox(height: 8,),
            SimpleDialogOption(
              onPressed: () {
                Navigator.pop(context,'Kotlin Clicked');
              },
              child: Text('Kotlin'),
            ),
          ],
        );
     },
    );
  }

  _showAlertDialog(BuildContext context) async {
    return  await showDialog(context: context, builder:(context) {
      return AlertDialog(
        title: Text('Delete Record'),
        content: Text('are you sure you want to delete this person'),
        actions: [
          TextButton(
            onPressed: () {
              Navigator.pop(context,'Cancel button clicked');
            },
            child:Text('Cancel'),
          ),
          TextButton(
            onPressed: () {
              Navigator.pop(context,'Delete Button Clicked');
            },
            child:Text('Delete'),
          ),
        ],
      );
     },
    );
  }

  _showCustomDialog(BuildContext context) async {
    return await showDialog(context: context, builder: (context) {
       return Dialog(
         shape: RoundedRectangleBorder(
           borderRadius: BorderRadius.circular(20),
         ),
         child: Padding(
           padding: EdgeInsets.all(20),
           child: Column(
             mainAxisSize: MainAxisSize.min,
             children: [
               Text('Custom Dialog',
                 style: TextStyle(
                   fontSize: 20,
                 ),
               ),
               SizedBox(height: 16,),
               TextField(
                 decoration:InputDecoration(
                   hintText: 'Enter Name',
                 ),
               ),
               TextField(
                 decoration:InputDecoration(
                   hintText: 'Enter Email Address',
                 ),
               ),
               SizedBox(height: 16,),
               Row(
                 mainAxisAlignment: MainAxisAlignment.end,
                 children: [
                   ElevatedButton(onPressed: () {
                      Navigator.pop(context);
                   }, child: Text('Cancel'),
                   ),
                   SizedBox(width: 10,),
                   ElevatedButton(onPressed: () {
                     Navigator.pop(context);
                   }, child: Text('Submit'),
                   ),
                 ],
               ),
             ],
           ),
         ),
       );
     },
    );
  }

  _showDatepickerDialog(BuildContext context) async {
    var date = await showDialog(context: context, builder:(context) {
       return DatePickerDialog(
           initialDate: DateTime.now(),
           firstDate:DateTime(2000),
           lastDate:DateTime(2025),
       );
     },
    );
  }
}

