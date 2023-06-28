import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:flutter_http_request/Call%20Back/user_list_responce.dart';
import 'package:http/http.dart';

import 'Model/user.dart';

void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'HTTP Request',
      home:Userlistexample(),
    );
  }
}
class Userlistexample extends StatefulWidget {
  const Userlistexample({Key? key}) : super(key: key);

  @override
  State<Userlistexample> createState() => _UserlistexampleState();
}

class _UserlistexampleState extends State<Userlistexample> {
  List<User> userlist = [];
  @override
   initState(){
    // TODO: implement initState
    super.initState();
   fetchUsers().then((value) {
     userlist = value;
   });
  }
  @override
  Widget build(BuildContext context) {
    return  Scaffold(
      appBar: AppBar(
        title: Text('User List'),
      ),
      body:FutureBuilder(
        builder: (context, snapshot) {
          return Container();
        },
      )
    );
  }

  Future<List<User>> fetchUsers() async{
    var res = await get(Uri.parse("https://reqres.in/api/users?page=1"));
    if(res.statusCode == 200){
      //jsondecode convert's json string to map object
       UserListResponse response = UserListResponse.fromJson(jsonDecode(res. body));
       return response.userlist;
    }else{
      throw Exception('Failed to Load User');
    }
  }
}
