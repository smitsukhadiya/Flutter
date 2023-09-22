import 'dart:async';
import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:flutter_slidable/flutter_slidable.dart';
import 'package:http/http.dart';
import 'package:interview/constants.dart';
import 'package:interview/routes/app_route.dart';
import 'package:interview/screens/data_add/data_screen.dart';
import 'package:interview/screens/home/Responce.dart';
import 'package:interview/screens/home/Student.dart';


class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {

  List<Student> personList = [];


  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    getData();
  }
  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
      appBar: AppBar(
        shape: RoundedRectangleBorder(borderRadius: BorderRadius.vertical(bottom:Radius.circular(20))),
        elevation: 20,
        backgroundColor: Colors.black,
      title: Text('Bull Breed Club'),
        centerTitle: true,
      ),
        body: ListView.builder(
          padding: EdgeInsets.all(12),
          itemCount: personList.length,
          itemBuilder: (context, index) {
           return getLisTile(personList[index]);
        },),

      ),
    );
  }

  Widget? getLisTile(Student? student) {
    return Padding(
      padding: EdgeInsets.symmetric(vertical: 6),
      child: Slidable(
        key:const ValueKey(0),
        endActionPane: ActionPane(
          dismissible: DismissiblePane(
           confirmDismiss: () {
              return Future(() async =>await giveConformation(student!));
            },
              closeOnCancel: true,

              onDismissed: () {}),
          motion:const DrawerMotion(),
          children: [
               SlidableAction(
            flex: 2,
            onPressed: (context) {

              Navigator.push(context,MaterialPageRoute(builder: (context) => dataScreen(student: student,callback: getData,),));
            },
                  autoClose: true,
                 label: 'Update',
                 icon: Icons.settings_suggest_outlined,
                 backgroundColor: Colors.blue,
                 foregroundColor: Colors.white,
                 borderRadius: BorderRadius.circular(20),
               ),
            SlidableAction(
               flex: 3,
              autoClose: true,
              onPressed: (context) {
                  showDialog(context: context, builder: (context) {
                   return AlertDialog(
                     shape: RoundedRectangleBorder(
                         borderRadius: BorderRadius.circular(12)),
                     backgroundColor: Colors.white,
                     elevation: 20,
                     icon:Icon(Icons.delete),
                     title: Text('Are You Sure Want To Delete?'),
                     actions: [
                       Row(
                         mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                         children: [
                           ElevatedButton(
                               style: ElevatedButton.styleFrom(
                                 shape: RoundedRectangleBorder(
                                     borderRadius:
                                     BorderRadius.circular(12)),
                                 side: BorderSide(
                                     color: Colors.grey, width: 1),
                                 backgroundColor: Colors.black,
                                 elevation: 20,
                               ),
                               onPressed: () {
                                 Navigator.pop(context);
                               },
                               child: Text('cencel')),
                           ElevatedButton(
                               style: ElevatedButton.styleFrom(
                                 shape: RoundedRectangleBorder(
                                     borderRadius:
                                     BorderRadius.circular(12)),
                                 side: BorderSide(
                                     color: Colors.red, width: 1),
                                 backgroundColor: Colors.red,
                                 elevation: 20,
                               ),
                               onPressed: () {
                                deleteUser(student);
                                Navigator.pop(context);
                               },
                               child: Text('Delete'))
                         ],
                       )
                     ],
                   );
                 },);
              },
              icon: Icons.delete_outline,
              backgroundColor: Colors.red,
              foregroundColor: Colors.white,
              label: 'Delete',
              borderRadius: BorderRadius.circular(20),
            ),
          ],
        ),
        child: ListTile(
          isThreeLine: true,
          shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(20)),
          tileColor:Colors.brown.shade900,
          title: Text('${student?.name}',style: TextStyle(color: Colors.white,fontWeight: FontWeight.bold)),
          subtitle:Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text('${student?.email}',style: TextStyle(color: Colors.white)),
              SizedBox(height: 5,),
              Text('Contact No : ${student?.mobile}',style: TextStyle(color: Colors.white)),
            ],
          )
          // Text('${student?.email}',style: TextStyle(color: Colors.white)),
        ),
      ),
    );
  }

  Future<List<Student>?>getData() async {
    var res = await get(Uri.parse('http://$ipAddress/api/student.php?flag=4'));

    if(res.statusCode==200){
        Responce responce = Responce.fromJson(jsonDecode(res.body));
        setState(() {
          personList = responce.student as List<Student>;
        });
    }else{
      throw Exception("Failed to load Data");
    }
  }

  Future<Responce?> deleteUser(Student? student) async {
    var id = student?.id;
    final bodyData = <String,dynamic>{
      'flag':'3',
      'id':id
    };
    var res = await post(Uri.parse('http://$ipAddress/api/student.php'),body: bodyData);
    if(res.statusCode==200){
      getData();
   return Responce.fromJson(jsonDecode(res.body));
    }
  }

  giveConformation(Student student) async {
   await showDialog(context: context, builder: (context) {
      return AlertDialog(
        shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(12)),
        backgroundColor: Colors.white,
        elevation: 20,
        icon:Icon(Icons.delete),
        title: Text('Are You Sure Want To Delete?'),
        actions: [
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            children: [
              ElevatedButton(
                  style: ElevatedButton.styleFrom(
                    shape: RoundedRectangleBorder(
                        borderRadius:
                        BorderRadius.circular(12)),
                    side: BorderSide(
                        color: Colors.grey, width: 1),
                    backgroundColor: Colors.black,
                    elevation: 20,
                  ),
                  onPressed: () {

                   return Navigator.pop(context,false);
                  },
                  child: Text('cencel')),
              ElevatedButton(
                  style: ElevatedButton.styleFrom(
                    shape: RoundedRectangleBorder(
                        borderRadius:
                        BorderRadius.circular(12)),
                    side: BorderSide(
                        color: Colors.red, width: 1),
                    backgroundColor: Colors.red,
                    elevation: 20,
                  ),
                  onPressed: () {
                    deleteUser(student);
                    Navigator.pop(context);
                  },
                  child: Text('Delete'))
            ],
          )
        ],
      );
    },);
  }
  
}
