import 'package:flutter/material.dart';

void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Material App',
      home:listviewseparatedexample(),
    );
  }
}
class listviewseparatedexample extends StatefulWidget {
  const listviewseparatedexample({Key? key}) : super(key: key);

  @override
  State<listviewseparatedexample> createState() => _listviewseparatedexampleState();
}

class _listviewseparatedexampleState extends State<listviewseparatedexample> {
  var colorlist = [Colors.orange.shade100,Colors.orange.shade200,Colors.orange.shade300,Colors.orange.shade400,Colors.orange.shade500,Colors.orange.shade600,];
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.orange,
        title: Text(
          'Listview separated',
        ),
      ),
      body: ListView.separated(
        itemCount: 50,
        itemBuilder:(context, index) {
        return GestureDetector(
          onTap: () {
            print('Item $index Clicked');
          },
          child: Container(
            height: 50,
            color: index.isEven? Colors.orange.shade500 : Colors.orange.shade200,
            child: Center(child: Text('Item $index')),
          ),
        );
       },
        separatorBuilder: (context, index) {
          return Container(
            height: 40,
            color: Colors.white,
            child: Center(
              child: Text('Sub Item : $index'),
            ),
          );
        },
      ),
    );
  }
}
