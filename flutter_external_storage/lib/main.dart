import 'dart:io';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:gallery_saver/gallery_saver.dart';
import 'package:image_picker/image_picker.dart';
import 'package:permission_handler/permission_handler.dart';

void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Image Picker',
      home:ImagePickerExample(),
    );
  }
}
class ImagePickerExample extends StatefulWidget {
  const ImagePickerExample({Key? key}) : super(key: key);

  @override
  State<ImagePickerExample> createState() => _ImagePickerExampleState();
}

class _ImagePickerExampleState extends State<ImagePickerExample> {
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
  Future<void> pickImageFromCamera() async {
    try{
      var imagefile = await ImagePicker().pickImage(source:ImageSource.camera);
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
    return  Scaffold(
      appBar: AppBar(
        title: Text('Image Picker'),
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            CircleAvatar(
              radius:120,
              backgroundImage: image == null? NetworkImage('https://in.images.search.yahoo.com/images/view;_ylt=Awrx.exMoYRjqRgfl6y9HAx.;_ylu=c2VjA3NyBHNsawNpbWcEb2lkAzQzYTBiY2QwNGMzY2FhMWM1NTJkMDE3NjczYjlmMTg4BGdwb3MDMzIEaXQDYmluZw--?back=https%3A%2F%2Fin.images.search.yahoo.com%2Fsearch%2Fimages%3Fp%3Dlogo%2Bpng%26type%3DE211IN885G91715%26fr%3Dmcafee%26fr2%3Dpiv-web%26tab%3Dorganic%26ri%3D32&w=1600&h=1200&imgurl=pngimg.com%2Fuploads%2Fmercedes%2Fmercedes_PNG80145.png&rurl=https%3A%2F%2Fpngimg.com%2Fdownload%2F80145&size=117.2KB&p=logo+png&oid=43a0bcd04c3caa1c552d017673b9f188&fr2=piv-web&fr=mcafee&tt=Mercedes+logo+PNG&b=0&ni=21&no=32&ts=&tab=organic&sigr=r.Gfe8ky9LIH&sigb=MzrshX1_GPZ1&sigi=4yHGTKAjIOgO&sigt=K28zCZeH3PUJ&.crumb=QHeVifit8Ti&fr=mcafee&fr2=piv-web&type=E211IN885G91715'):Image.file(image!).image,
            ),
            SizedBox(height: 20,),
            ElevatedButton(onPressed: () {
              pickImageFromGallary();
            }, child: Text('From Gallary')),
            SizedBox(height: 16,),
            ElevatedButton(onPressed: () {
             pickImageFromCamera();
            }, child: Text('From Camera')),
            SizedBox(height: 16,),
            ElevatedButton(onPressed: () {
              if(image==null){
               print('Please pick image first');
               return;
              }
              _requastforstoragepermission();
            }, child: Text('Save to Gallery')),
          ],
        ),
      ),
    );
  }
  Future<void> _requastforstoragepermission()async {
    var status = await Permission.storage.status;

    if(status.isGranted){
      saveimagetogallary();
      print('Permission granted');
    }else if(status.isDenied){
      var status = await Permission.storage.request().isGranted;
      if(status){
        saveimagetogallary();
        print('Permission was granted');
      }else{
        if(await Permission.storage.shouldShowRequestRationale){
          print('navigate to setting');
          openAppSettings();
        }
      }
    }
  }

  void saveimagetogallary() {
    if(image!=null && image?.path!=null){
      GallerySaver.saveImage(image!.path).then((path) => {
        print("FILE PATH : $path"),
      });
    }
  }
}
