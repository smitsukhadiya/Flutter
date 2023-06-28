import 'dart:io';

import 'package:firebase_core/firebase_core.dart';
import 'package:firebase_storage/firebase_storage.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:image_picker/image_picker.dart';

Future<void> main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp();
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Material App',
      home:Profilescreen(),
    );
  }
}

class Profilescreen extends StatefulWidget {
  const Profilescreen({Key? key}) : super(key: key);

  @override
  State<Profilescreen> createState() => _ProfilescreenState();
}

class _ProfilescreenState extends State<Profilescreen> {

  File? image;

  Future<void> pickImageFromGallary() async {
    try{
      var imagefile = await ImagePicker().pickImage(source:ImageSource.gallery);
      if(imagefile == null) return;
      var tempImageFile = imagefile.path;
      setState(() {
        image = File(tempImageFile);
      });
    }on PlatformException catch (e) {
      print('error in image Picker : $e');
    }
  }
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Image Picker'),
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            InkWell(
              onTap: () {
          pickImageFromGallary();

              },
              child: CircleAvatar(
                radius:120,
                backgroundImage: image == null? NetworkImage('https://www.dmarge.com/wp-content/uploads/2021/01/dwayne-the-rock-.jpg'):Image.file(image!).image,
              ),
            ),
            SizedBox(height: 20,),
            ElevatedButton(onPressed: () {
              if(image==null){
                print('please select image');
                return;
              }
              uploadImageToFirebase();
            }, child: Text('Upload Image')),
          ],
        ),
      ),
    );
  }

  Future<void> uploadImageToFirebase() async {
  final storageRef = FirebaseStorage.instance.ref();
  try{
    var filename = DateTime.now().microsecondsSinceEpoch;
    
    await storageRef.child('profile').child('$filename.png').putFile(image!.absolute).then( (p0) {
     print('image uplod');
    },);
    var url = await storageRef.child('profile').child('$filename.png').getDownloadURL();
    print('URL : $url');
  } on FirebaseException catch (e){
             print('$e');
  }
  

  }
}
