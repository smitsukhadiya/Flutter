import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:http/http.dart';

import 'PracticeRespoce.dart';

void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Material App',
      debugShowCheckedModeBanner: false,
      home:practice(),
    );
  }
}

class practice extends StatefulWidget {
  const practice({super.key});

  @override
  State<practice> createState() => _practiceState();
}

class _practiceState extends State<practice> {

  List<PracticeRespoce> itemList = [];

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    getData();
  }
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Practice (Api)'),
      ),
      body:ListView.builder(
        itemCount: itemList.length,
        itemBuilder: (context, index) {
        return getListile(context,itemList[index]);
      },)
    );
  }

  Widget getListile(BuildContext context,PracticeRespoce itemList) {
    return Padding(
      padding: EdgeInsets.fromLTRB(12,12,12,12),
      child: Container(
        height: 120,
        padding: EdgeInsets.all(10),
        decoration: BoxDecoration(
          color: Colors.yellow.shade900,
          borderRadius: BorderRadius.circular(20),
        ),
        child: Row(
          children: [
            CircleAvatar(child: Image.network('${itemList.avatar}'),backgroundColor: Colors.black,radius: 50.00),
           SizedBox(width: 30,),
           Column(
             mainAxisAlignment: MainAxisAlignment.spaceEvenly,
             children: [
               Text('${itemList.name}',style: TextStyle(fontSize: 17,color: Colors.white,fontWeight: FontWeight.bold)),
               Text('${itemList.email}',style: TextStyle(fontSize: 17,color: Colors.white,fontWeight: FontWeight.bold)),
               Text('${itemList.role}',style: TextStyle(fontSize: 17,color: Colors.white,fontWeight: FontWeight.bold)),
             ],
           ),
          ],
        ),
      ),
    );
  }

 Future <void> getData()async {
    var response = await get(Uri.parse("https://api.escuelajs.co/api/v1/users"));
    var data = jsonDecode(response.body.toString());

    if(response.statusCode == 200){
      for(var item in data){
        setState(() {
          itemList.add(PracticeRespoce.fromJson(item));
        });
      }
    }
  }
}
