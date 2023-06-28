import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:flutter_network_request/Model/UserListResponse.dart';
import 'package:http/http.dart';

import 'Model/User.dart';

void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Material App',
      home:UserListScreen(),
    );
  }
}
class UserListScreen extends StatefulWidget {
  const UserListScreen({Key? key}) : super(key: key);

  @override
  State<UserListScreen> createState() => _UserListScreenState();
}

class _UserListScreenState extends State<UserListScreen> {
  List<User> userList = [];
  @override
  void initState() {
    // TODO: implement initState
    super.initState();
      //fetchData();
  }
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('User List'),
        centerTitle: true,
      ),
      body:FutureBuilder(
        future: fetchData(),
        builder: (context, snapshot) {
         if(snapshot.hasData){
          userList = snapshot.data as List<User>;
           return ListView.builder(
             itemCount: userList.length,
             itemBuilder: (context, index) {
                return ListTile(
                  title: Text(
                    '${userList[index].firstName}${userList[index].lastName}'
                  ),
                  subtitle: Text('${userList[index].email}'),
                  leading: Image.network('${userList[index].avatar}'),
                );
           },);
         }else if (snapshot.hasError){
                return Center(
                  child:Text('Error Occured') ,
                );
         }else{
        return Center(
          child: CircularProgressIndicator(
            color: Colors.cyan,
            semanticsLabel: 'Loading',
          ),
        );
         }
        },
      )
    );
  }
  Future<List<User>?> fetchData() async {
    Response  res = await get(Uri.parse("https://reqres.in/api/users?page=1"));
    if(res.statusCode==200){
      UserListResponse responce = UserListResponse.fromJson(jsonDecode(res.body));
      return responce.userList;
    }else{
      throw Exception('Faild to Load Data');
    }
  }

 /* Future<void> fetchData() async {
   Response  res = await get(Uri.parse("https://reqres.in/api/users?page=1"));
   if(res.statusCode==200){
        UserListResponse responce = UserListResponse.fromJson(jsonDecode(res.body));
    setState(() {
      userList = responce.userList as List<User>;
    });
   }else{
     throw Exception('Faild to Load Data');
   }
  }*/
}
