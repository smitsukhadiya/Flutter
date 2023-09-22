import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:http/http.dart';
import 'package:interview/constants.dart';
import 'package:interview/screens/home/Responce.dart';
import 'package:interview/screens/home/Student.dart';

class dataScreen extends StatefulWidget {

  Student? student;
  VoidCallback? callback;

   dataScreen({super.key, this.student,this.callback});

  @override
  State<dataScreen> createState() => _dataScreenState();
}

class _dataScreenState extends State<dataScreen> {

  var nameController = TextEditingController();
  var contactController = TextEditingController();


  var outlineBorder = OutlineInputBorder(
    borderRadius: BorderRadius.circular(8),
    borderSide: BorderSide.none,
  );

  @override
  Widget build(BuildContext context) {
    nameController.text = widget.student?.name as String;
    contactController.text = widget.student?.mobile as String;
    return Scaffold(
      backgroundColor: Colors.black,
      body: Padding(
        padding: EdgeInsets.all(20),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Icon(Icons.settings_backup_restore,color: Colors.white,size: 90),
            SizedBox(height: 10,),
            Text('Upgrade Your Data',style: TextStyle(color: Colors.white,fontSize: 30,fontWeight: FontWeight.bold)),
            SizedBox(height: 30,),
            TextField(
              controller: nameController,
              cursorColor: Colors.black,
              keyboardType: TextInputType.text,
              decoration: InputDecoration(
                filled: true,
                fillColor: Colors.white,
                enabledBorder: outlineBorder,
                border: outlineBorder,
                focusedBorder: outlineBorder,
                hintText: 'Name',
                alignLabelWithHint: true,
                contentPadding: EdgeInsets.symmetric(vertical: 10, horizontal: 16),
              ),
            ),
            SizedBox(height: 20,),
            TextFormField(
              controller: contactController,
              cursorColor: Colors.black,
              keyboardType: TextInputType.number,
              decoration: InputDecoration(
                filled: true,
                fillColor: Colors.white,
                enabledBorder: outlineBorder,
                border: outlineBorder,
                focusedBorder: outlineBorder,
                hintText: 'Contact Number',
                alignLabelWithHint: true,
                contentPadding: EdgeInsets.symmetric(vertical: 10, horizontal: 16),
              ),
            ),
            SizedBox(height: 20,),
            MaterialButton(
                color: Colors.red,
                minWidth: double.infinity,
                shape: RoundedRectangleBorder(
                    borderRadius:
                    BorderRadius.circular(8)),
                child: Text(
                  'Update',
                  style: TextStyle(
                      fontSize: 16, color: Colors.white,fontWeight: FontWeight.bold),
                ),
                padding: EdgeInsets.symmetric(
                    vertical: 14),
                onPressed: () {
                 var name = nameController.text.trim();
                 var contact = contactController.text.trim();
                 var id = widget.student?.id;
                 upDate(name,contact,id,);
                 widget.callback?.call();
                 Navigator.pop(context);
                },
            ),
          ],
        ),
      ),
    );
  }

  Future<Responce?> upDate(String name, String contact, String? id) async {

   final  bodyData = <String,dynamic>{
      'flag':'2',
     'id': id,
     'name':name,
     'mobile':contact
    };

    var res = await post(Uri.parse('http://$ipAddress/api/student.php'),body: bodyData);

    if(res.statusCode==200){
       return Responce.fromJson(jsonDecode(res.body));
    }
  }

}
