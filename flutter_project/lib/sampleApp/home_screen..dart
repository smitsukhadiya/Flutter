import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:flutter_practical/sampleApp/SampleList.dart';
import 'package:http/http.dart'as http;

class homeScreen extends StatefulWidget {
  const homeScreen({Key? key}) : super(key: key);

  @override
  State<homeScreen> createState() => _homeScreenState();
}

class _homeScreenState extends State<homeScreen> {
  List<SampleList> simpleList = [];
  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    getData();
  }

  Future<void> getData() async {
    var response = await http.get(Uri.parse("https://jsonplaceholder.typicode.com/posts"));
    var data = jsonDecode(response.body.toString());

    if (response.statusCode == 200) {
      setState(() {
        for (var item in data) {
          simpleList.add(SampleList.fromJson(item));
        }
      });
    }
  }
  
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.yellow.shade400,
      appBar: AppBar(
        title: Text('Sample App Bar'),
      ),
      body: FutureBuilder(
        future: getData(),
        builder: (context, snapshot) {
          if(snapshot.hasData){
            return ListView.builder(
              padding: EdgeInsets.symmetric(vertical: 5),
              shrinkWrap: true,
              itemCount: simpleList.length,
              itemBuilder: (context, index) {
                return Padding(
                  padding: EdgeInsets.fromLTRB(10,5,10,5),
                  child: ListTile(
                    shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(20)),
                    leading: Text('${simpleList[index].id}'),
                    title: Text('${simpleList[index].title}'),
                    subtitle: Text('${simpleList[index].body}'),
                    trailing: Text('${simpleList[index].userId}'),
                    tileColor: Colors.yellow.shade50,
                  ),
                );
              },
            );
          }else{
            return Center(child: CircularProgressIndicator());
          }
        },
      ),
    );
  }
}

