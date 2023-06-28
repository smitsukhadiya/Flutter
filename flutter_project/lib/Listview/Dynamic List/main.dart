import 'package:flutter/material.dart';
import 'package:flutter_practical/Listview/Dynamic%20List/datascreen.dart';
import 'package:flutter_practical/Listview/Dynamic%20List/user.dart';

void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Material App',
      home:listtileexample(),
     debugShowCheckedModeBanner: false,
    );
  }
}
class listtileexample extends StatefulWidget {

  @override
  State<listtileexample> createState() => _listtileexampleState();
}

class _listtileexampleState extends State<listtileexample> {
  List<User> list = [];
  @override
  void initState() {
    super.initState();
    list.add(User(id: 1, title: 'Smith', subtitle: 'smith@gmail.com'));
    list.add(User(id: 2, title: 'Jenisha', subtitle: 'jenisha@gmail.com'));
    list.add(User(id: 3, title: 'Rutvik', subtitle: 'rutvik@gmail.com'));
    list.add(User(id: 4, title: 'Tulsi', subtitle: 'tulsi@gmail.com'));
    list.add(User(id: 5, title: 'Drashali', subtitle: 'drashali@gmail.com'));
  }
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          actions: [
            PopupMenuButton(itemBuilder: (context) {
              return  [
                PopupMenuItem(
                  value: 1,
                  child: Text('Item 1'),
                ),
                PopupMenuItem(
                  value: 2,
                  child: Text('Item 2'),
                ),
                PopupMenuItem(
                  value: 3,
                  child: Text('Item 3'),
                )
              ];
            },)
          ],
          title: Text('List Tile'),
        ),
      body:ListView.builder(
        itemCount: list.length,
        itemBuilder: (context, index) {
        return getlist(context,list[index]);
       },
      ),
    );
  }

  Widget getlist(BuildContext context, User user) {
    return Container(
      child: ListTile(
        leading: Icon(
          size: 24,
            Icons.person),
      title: Text(user.title),
      subtitle: Text(user.subtitle),
        trailing: Icon(
          Icons.navigate_next,
          size: 24,
        ),
        onTap: () {
          Navigator.push(context,MaterialPageRoute(builder: (context) =>datascreen(user),),);
        },
      ),
    );
  }
}
