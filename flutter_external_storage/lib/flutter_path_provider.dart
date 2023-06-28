import 'dart:io';

import 'package:flutter/material.dart';
import 'package:path_provider/path_provider.dart';

void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Path Provider',
      home:pathproviderexample(),
    );
  }
}
class pathproviderexample extends StatefulWidget {
  const pathproviderexample({Key? key}) : super(key: key);

  @override
  State<pathproviderexample> createState() => _pathproviderexampleState();
}

class _pathproviderexampleState extends State<pathproviderexample> {
  String filename = "tops.txt";
  Future<String>get _localPath async{
    final directory = await getApplicationDocumentsDirectory();
    return directory.path;
  }
  Future<File> get _localfile async{
    final path = await _localPath;
    var file = File('$path/$filename');
    return file;
  }
  _writedata(String message) async {
    var file = await _localfile;
    file.writeAsString(message);
    print(file);
  }
  _readdata() async {
    var file = await _localfile;
    var message = await file.readAsString();
    print("message : $message");
  }

  Future<void> _getDirectoryPath() async {
    var tempdir = await getTemporaryDirectory();
    print('temp dir : ${tempdir.path}');

    var documentdir = await getApplicationDocumentsDirectory();
    print('document dir : ${documentdir.path}');

    var supportdir = await getApplicationSupportDirectory();
    print('support dir : ${supportdir.path}');
  }
  final messageController = TextEditingController();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Path Provider'),
      ),
      body: Center(
        child: Padding(
          padding: EdgeInsets.all(20),
          child: Container(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                TextField(
                  controller: messageController,
                  decoration: InputDecoration(
                    hintText: 'Enter Massage',
                  ),
                ),
                SizedBox(height: 20,),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                  children: [
                    ElevatedButton(onPressed: () {
                       _readdata();
                    }, child:Text('Read')),
                    ElevatedButton(onPressed: () {
                       _writedata(messageController.text);
                    }, child:Text('Write')),
                  ],
                ),
              ],
            ),
           /* child:ElevatedButton(
              onPressed: () {
                _getDirectoryPath();
              },
              child: Text('Get Path'),
            ),*/
          ),
        ),
      ),
    );
  }
}

