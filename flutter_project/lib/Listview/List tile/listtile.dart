import 'package:flutter/material.dart';

void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Material App',
      home:listtile(),
    );
  }
}
class listtile extends StatelessWidget {
  const listtile({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return  Scaffold(
      backgroundColor: Colors.grey.shade300,
      appBar: AppBar(
        title: Text('List tile'),
      ),
      body: Padding(
        padding: EdgeInsets.all(10),
        child: ListView(
          children: [
            ListTile(
              tileColor: Colors.white,
              title: Text('Dummy Text'),
              subtitle: Text('Dummy Subtitle text'),
              leading: Icon(
                Icons.account_circle,
                size: 30,
              ),
              trailing: Icon(
                Icons.navigate_next,
              ),
            ),
            ListTile(
              tileColor: Colors.white,
              title: Text('Dummy Text'),
              subtitle: Text('Dummy Subtitle text'),
              leading: Icon(
                Icons.account_circle,
                size: 30,
              ),
              trailing: Icon(
                Icons.navigate_next,
              ),
              //dense: true,
              //contentPadding: EdgeInsets.all(10),
             //enabled: false,
              selected: true,
              selectedColor: Colors.amber.shade800,
              selectedTileColor: Colors.amber.shade200,
              shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(20)),
            ),
          ],
        ),
      ),
    );
  }
}
