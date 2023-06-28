import 'dart:math';

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
  var namecontroller = TextEditingController();
  List<User> userList = [];


  @override
  void initState() {
    // TODO: implement initState
    super.initState();
  }
  @override
  Widget build(BuildContext context) {
    return  Scaffold(
      appBar: AppBar(
        title: Text('D6'),
      ),
      body: ListView.builder(
        itemCount: userList.length,
        itemBuilder: (context, index) {
        return getListItem(context,userList[index]);
      },),
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          showModalBottomSheet(
            shape:OutlineInputBorder(borderRadius: BorderRadius.circular(20)),
            isScrollControlled: true,
            context: context, builder:(context) {
            return Padding(
              padding: MediaQuery.of(context).viewInsets,
              child: Padding(
                padding: EdgeInsets.all(20),
                child: Column(
                  mainAxisSize: MainAxisSize.min,
                  children: [
                    TextField(
                      controller: namecontroller,
                      keyboardType: TextInputType.text,
                      decoration: InputDecoration(
                        border: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(20),
                        ),
                        prefixIcon: Icon(Icons.drive_file_rename_outline_sharp),
                        hintText: 'Name :',
                      ),
                    ),
                    SizedBox(height: 20,),
                    ElevatedButton(
                      style: ElevatedButton.styleFrom(
                        shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(10)),
                        padding: EdgeInsets.fromLTRB(140, 15, 140, 15),
                      ),
                        onPressed: () {
                          var name = namecontroller.text;
                           addPerson(name,context);
                        }, child:Text('ADD')),
                  ],
                ),
              ),
            );
          },
          );
        },
        child: Icon(Icons.add),
      ),
    );
  }

  Widget getListItem(BuildContext context,[User? user]) {
    return ListTile(
      onLongPress: () {
        namecontroller.text = user!.name;
         showDialog(context: context, builder: (context) {
           return AlertDialog(
             shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(20)),
             title: Text('Pick an Option'),
             actions: [
               TextField(
                 controller: namecontroller,
                 keyboardType: TextInputType.text,
                 decoration: InputDecoration(
                   border: OutlineInputBorder(
                     borderRadius: BorderRadius.circular(20),
                   ),
                   prefixIcon: Icon(Icons.drive_file_rename_outline_sharp),
                   hintText: 'Name :',
                 ),
               ),
               SizedBox(height: 5,),
               ElevatedButton(
                 style: ElevatedButton.styleFrom(
                   shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(10)),
                   padding: EdgeInsets.fromLTRB(120, 7, 120, 7),
                 ),
                   onPressed: () {
                   var name = namecontroller.text;
                   User mUser = User(id: user.id, name: name);
                   UpdateUser(context, mUser);
               }, child: Text('UPDATE')),
               ElevatedButton(
                   style: ElevatedButton.styleFrom(
                   shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(10)),
                 padding: EdgeInsets.fromLTRB(120, 7, 120, 7),
               ),onPressed: () {
                 showDialog(context: context, builder:(context) {
                   return AlertDialog(
                     shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(20)),
                     title: Text("Are you sure want to delete Item?"),
                     elevation: 20,
                     actions: [
                       ElevatedButton(
                           style: ElevatedButton.styleFrom(
                             shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(10)),
                             padding: EdgeInsets.fromLTRB(120, 7, 120, 7),
                           ),
                           onPressed: () {
                         deleteUser(user);
                         Navigator.pop(context);
                        }, child:Text('DELETE')),
                       ElevatedButton(
                           style: ElevatedButton.styleFrom(
                             shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(10)),
                             padding: EdgeInsets.fromLTRB(120, 7, 120, 7),
                           ),
                           onPressed: () {
                             Navigator.pop(context);
                           }, child:Text('CANCEL')),
                     ],
                   );
                 },);
               }, child: Text('DELETE')),
               ElevatedButton(style: ElevatedButton.styleFrom(
                   shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(10)),
                 padding: EdgeInsets.fromLTRB(130, 7, 130, 7),
               ),onPressed: () {
                   Navigator.pop(context);
               }, child: Text('EXIT')),
             ],
           );
         },);
      },

      onTap: () {
        showDialog(context: context, builder:(context) {
          return AlertDialog(
            shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(20)),
            title: Text('Name : ${user!.name}',style: TextStyle(fontSize: 20,)),
          );
        },);
      },
      title: Text(user!.name),
      leading: Icon(Icons.person),
    );
  }

  void addPerson(String name,BuildContext context) {
    setState(() {
      var id = Random().nextInt(9999);
     userList.add(User(id: id, name: name));
      namecontroller.clear();
      Navigator.pop(context);
    });
  }

  void UpdateUser(BuildContext context,User mUser) {
   setState(() {
     var index = userList.indexWhere((element) => element.id==mUser.id);
     userList[index]=mUser;
     Navigator.pop(context);
   });
  }

  void deleteUser(User user) {
    setState(() {
      userList.removeWhere((element) => element.id==user.id);
      Navigator.pop(context);
    });
  }
}
class User{
  int id;
  String name;
  User({required this.id, required this.name});
}