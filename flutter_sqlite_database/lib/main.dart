import 'package:flutter/material.dart';
import 'package:flutter_sqlite_database/Database/database_helper.dart';
import 'package:flutter_sqlite_database/add_user.dart';

import 'Database/Model/user.dart';

void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Sqlite Database',
      home: Userlistpage(),
    );
  }
}

class Userlistpage extends StatefulWidget {
  const Userlistpage({Key? key}) : super(key: key);

  @override
  State<Userlistpage> createState() => _UserlistpageState();
}

class _UserlistpageState extends State<Userlistpage> {

  List<User>userList = [];
  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    //userList.add(User(name: 'Smit', email: 'smit@gmail.com', contact: '8320532031', age: 21));
    //userList.add(User(name: 'Dhiren', email: 'dhiren@gmail.com', contact: '8320532031', age: 31));
    refreshList();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('User List'),
      ),
      floatingActionButton:FloatingActionButton(
        onPressed: () async {
         navigateToNext(null,context);
        },
        child: Icon(Icons.add),
      ),
      body: ListView.builder(
        itemCount: userList.length,
        itemBuilder: (context, index) {
        return ListTile(
          onTap: () {

            navigateToNext(userList[index],context);
          },
          title:Text(userList[index].name),
          subtitle:Text('${userList[index].email} \n${userList[index].contact}') ,
          isThreeLine: true,
        );
      },)
    );
  }

  Future<void> refreshList() async {
     var mList = await DatabaseHelper.instance.getUserList();
    setState(() {
      userList = mList;
    });
  }

  Future<void> navigateToNext(User? user,BuildContext context) async {
    var id = await Navigator.push(
        context, MaterialPageRoute(
      builder: (context) => adduserpage(user),
    )
    );
    if(id!=-1){
      refreshList();
    }
  }

}
