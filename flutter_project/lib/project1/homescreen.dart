import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:flutter_practical/project1/Student.dart';
import 'package:flutter_practical/project1/User.dart';
import 'package:http/http.dart';

import 'Responce.dart';


class homescreen extends StatefulWidget {
  const homescreen({Key? key}) : super(key: key);

  @override
  State<homescreen> createState() => _homescreenState();
}

class _homescreenState extends State<homescreen> {
  var name = TextEditingController();
  var mobile = TextEditingController();
  List<Student> userList = [];
  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    setState(() {
      userList=[];
      getData();
    });
  }
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.black,
        centerTitle: true,
        title: Text(
          'User List 📜',
          style:TextStyle(
              fontWeight: FontWeight.bold,
              color: Colors.blue.shade300
          ),
        ),
      ),
      body:Container(
        height: MediaQuery.of(context).size.height,
        width: MediaQuery.of(context).size.width,
        child: ListView.builder(
             itemCount: userList.length,
             itemBuilder: (context, index) {
             return Padding(
               padding: EdgeInsets.fromLTRB(10, 10, 10, 5),
               child: ListTile(
                 shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(20),
                     side: BorderSide(color: Colors.blue.shade400,width: 3)),
                 tileColor: Colors.blue.shade100,
                 title: Text('${userList[index].name}',style: TextStyle(color: Colors.blue.shade900)),
                 subtitle: Text('${userList[index].email}',style: TextStyle(color: Colors.blue.shade900)),
                 leading: Icon(Icons.person_2_rounded,color: Colors.blue.shade900),
                 trailing: PopupMenuButton(
                   onSelected: (value) {
                     if(value=='update'){
                       Update(context, userList[index]);
                     }else if(value=='delete'){
                       showDialog(context: context, builder: (context) {
                         return AlertDialog(
                           shape:OutlineInputBorder(borderRadius: BorderRadius.circular(20),
                               borderSide: BorderSide(color: Colors.blue.shade500,width: 3)),
                           title: Text('Are you sure want to Delete ?',
                               style: TextStyle(color: Colors.blue.shade900,
                               fontWeight: FontWeight.w500)),
                           elevation: 50,
                           actions: [
                             SizedBox(height: 10,),
                             ElevatedButton(
                                 style: ElevatedButton.styleFrom(
                                   elevation: 50,
                                   shape: RoundedRectangleBorder(
                                     side: BorderSide(color: Colors.blue.shade300,width: 2),
                                     borderRadius: BorderRadius.circular(20),
                                   ),
                                   backgroundColor: Colors.black,
                                   padding: EdgeInsets.only(left: 40,right: 40,top: 20,bottom: 20),
                                 ),
                                 onPressed: () {
                                     Navigator.pop(context);
                             }, child:Text('Cencel',
                               style: TextStyle(fontWeight: FontWeight.bold,fontSize: 20,color: Colors.blue.shade300),
                             )),
                             SizedBox(width: 1,),
                             ElevatedButton(
                                 style: ElevatedButton.styleFrom(
                                   elevation: 50,
                                   shape: RoundedRectangleBorder(
                                     side: BorderSide(color: Colors.blue.shade300,width: 2),
                                     borderRadius: BorderRadius.circular(20),
                                   ),
                                   backgroundColor: Colors.black,
                                   padding: EdgeInsets.only(left: 40,right: 40,top: 20,bottom: 20),
                                 ),
                                 onPressed: () {
                                   DeleteUser(context,userList[index]);
                                   Navigator.pop(context);
                             }, child:Text('Delete',
                               style: TextStyle(fontWeight: FontWeight.bold,fontSize: 20,color: Colors.blue.shade300),)),
                           ],
                         );
                       },);
                     }else if(value=='view'){
                       Navigator.push(context,MaterialPageRoute(builder: (context) => userScreen(),));
                     }
                   },
                   color: Colors.grey.shade200,
                   shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(20),
                       side: BorderSide(color: Colors.blue.shade400,width: 2)),
                  itemBuilder: (context) => [
                    PopupMenuItem(
                      value: 'view',
                      child: Text('View',style: TextStyle(color: Colors.blue.shade900,
                          fontWeight: FontWeight.w500)),
                    ),
                    PopupMenuItem(
                      value: 'update',
                      child: Text('Update',style: TextStyle(color: Colors.blue.shade900,
                          fontWeight: FontWeight.w500)),
                    ),
                    PopupMenuItem(
                      value: 'delete',
                      child: Text('Delete',style: TextStyle(color: Colors.blue.shade900,
                          fontWeight: FontWeight.w500)),
                    ),
                  ],
                 ),
               ),
             );
           },),
      ),
    );
  }

  Future<List<Student>?> getData() async {
  var res = await get(Uri.parse('http://192.168.1.7/api/student.php?flag=4'));
  if(res.statusCode==200){
    Responce responce = Responce.fromJson(jsonDecode(res.body));
   setState(() {
     userList = responce.student as List<Student>;
   });
  }else {
    throw Exception('Failed to load data');
    }
  }

  void Update(BuildContext context,[Student? student]){
    name.text = student?.name! as String;
    mobile.text = student?.mobile! as String;
    showModalBottomSheet(
      shape:OutlineInputBorder(borderRadius: BorderRadius.circular(20),
          borderSide: BorderSide(color: Colors.blue.shade500,width: 3)),
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
               controller:name,
                style : TextStyle(
                  color: Colors.blue.shade900,
                  fontWeight: FontWeight.bold,
                ),
                decoration: InputDecoration(
                  enabledBorder: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(20),
                      borderSide: BorderSide(
                          color: Colors.blue.shade100
                      )
                  ),
                  prefixIcon: Icon(
                    Icons.drive_file_rename_outline_sharp,
                  ),
                  filled: true,
                  fillColor:Colors.blue.shade100,
                  hintText: 'Update Name',
                  border: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(20),
                  ),
                ),
              ),
              SizedBox(height: 20,),
              TextField(
               controller:mobile,
                keyboardType: TextInputType.number,
                style : TextStyle(
                  color: Colors.blue.shade900,
                  fontWeight: FontWeight.bold,
                ),
                decoration: InputDecoration(
                    enabledBorder: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(20),
                        borderSide: BorderSide(
                            color: Colors.blue.shade100
                        )
                    ),
                    prefixIcon: Icon(
                      Icons.phone,
                    ),
                    filled: true,
                    fillColor:Colors.blue.shade100,
                    hintText: 'Update Mobile Number',
                    border: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(20),
                    )
                ),
              ),
              SizedBox(height: 20,),
              ElevatedButton(
                  style: ElevatedButton.styleFrom(
                    elevation: 50,
                    shape: RoundedRectangleBorder(
                      side: BorderSide(color: Colors.blue.shade300,width: 2),
                      borderRadius: BorderRadius.circular(20),
                    ),
                    backgroundColor: Colors.black,
                    padding: EdgeInsets.only(left: 140,right: 140,top: 20,bottom: 20),
                  ),
                  onPressed: () async {
                    var name1 = name.text;
                    var mobile1 = mobile.text;
                    var id = student?.id;

                    var ans = await UpdateBase(name1, mobile1,id!);
                    Navigator.pop(context);
                     getData();
                  },
              child:Text( 'Update',
                style: TextStyle(fontWeight: FontWeight.bold,fontSize: 20,color: Colors.blue.shade300),)),
      ],
          ),
        ),
      );
    },
    );
  }

  Future<Responce?> UpdateBase(String name1,String mobile1,String id) async {
    final Data = <String,dynamic>{
      'flag':"2",
      'id':id,
      'name':name1,
      'mobile':mobile1
    };
    var res = await post(Uri.parse('http://192.168.1.7/api/student.php'),
     body: Data
    );
    if(res.statusCode==200){
      return Responce.fromJson(jsonDecode(res.body));
    }
  }

  Future<Responce?> DeleteUser(BuildContext context,Student? student) async {
    var id = student?.id;
    final Data = <String,dynamic>{
      'flag':"3",
      'id':id,
    };
    var res = await post(Uri.parse('http://192.168.1.7/api/student.php'),
        body: Data
    );
    if(res.statusCode==200){
      getData();
    return  Responce.fromJson(jsonDecode(res.body));

    }

  }
}



class userScreen extends StatefulWidget {
 // final Student uid;

 //  userScreen({required this.uid});

  @override
  State<userScreen> createState() => _userScreenState();
}

class _userScreenState extends State<userScreen> {
  List<Student> singelList = [];
  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    singelData(context,Student());
  }
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.black,
        centerTitle: true,
        title: Text('{$singelList[index].name}',
          style:TextStyle(
            fontWeight: FontWeight.bold,
            color: Colors.blue.shade300
        ),),
      ),
      body:  Container(
        color: Colors.grey.shade800,
        child: Center(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              CircleAvatar(
                backgroundImage: AssetImage("assets/Person.png"),
                radius: 130,
              ),
              SizedBox(height: 20,),
              Text('{$singelList[index].name}',style: TextStyle(color: Colors.blue.shade500,fontWeight: FontWeight.bold,fontSize: 20)),
              SizedBox(height: 10,),
              Text('kevin@gmail.com',style: TextStyle(color: Colors.blue.shade600,fontWeight: FontWeight.bold,fontSize: 20)),
            ],
          ),
        ),
      ),
    );
  }

  Future<void> singelData(BuildContext context,Student? student) async {
    var id = student?.id;
       var ro = await get(Uri.parse("http://localhost/api/student.php?flag=5&id=$id"));
    if(ro.statusCode==200){
      Responce responce = Responce.fromJson(jsonDecode(ro.body));
      setState(() {
        singelList = responce.student as List<Student>;
      });
    }else {
      throw Exception('Failed to load data');
    }
  }
}

