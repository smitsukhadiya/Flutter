import 'dart:io';

import 'package:flutter/material.dart';
import 'package:flutter_practical/practice/project/database/db_helper.dart';
import 'package:flutter_practical/practice/project/model/category.dart';
import 'package:image_picker/image_picker.dart';
import 'package:path_provider/path_provider.dart';

class Body extends StatefulWidget {
  const Body({super.key});

  @override
  State<Body> createState() => _BodyState();
}

class _BodyState extends State<Body> {

  DBHelper? dbHelper;

  addCategory(Category category) async {
   var id = await dbHelper?.insert(category);
   if(id!=-1){
     print('Category Added Successfully');
     Navigator.pop(context);
   }else{
     print('error found');
   }
  }

  final titleController = TextEditingController();
  final descController = TextEditingController();

  final ImagePicker imagePicker = ImagePicker();
  File? imageFile;
  
   pickImageFromGallery() async {
    var image = await imagePicker.pickImage(source: ImageSource.gallery);
    if(image!=null){
      setState(() {
        imageFile = File(image.path);
      });
    }
  }

  Future<String?> saveImage(File? imageFile) async {
     try{
       var supportdir = await getApplicationSupportDirectory();
       String path = supportdir.path;
       String fileName = '${DateTime.now().millisecondsSinceEpoch}.jpg';
       File mFile = await imageFile!.copy('${path}/${fileName}');
       if(mFile != null){
         return mFile.path;
       }
     }catch(e){
        print(e.toString());
     }
     return null;
   }
  @override
  Widget build(BuildContext context) {
    return Center(
      child: SingleChildScrollView(
        reverse: true,
        physics: const BouncingScrollPhysics(),
        child: Padding(
          padding: const EdgeInsets.all(20),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              InkWell(
                onTap: () {
                  pickImageFromGallery();
                },
                child: CircleAvatar(
                  backgroundImage:imageFile !=null?  FileImage(imageFile!) : const AssetImage('assets/Person.png') as ImageProvider,
                  backgroundColor: Colors.grey,
                  radius: 80,
                ),
              ),
              const SizedBox(height: 24,),
              buildTitleFormField(),
              const SizedBox(height: 24,),
              buildDescriptionFormField(),
              const SizedBox(height: 30,),
              buildAddCatagoryButtonWidget(),
            ],
          ),
        ),
      ),
    );
  }
  buildTitleFormField() {
    return TextFormField(
      keyboardType: TextInputType.text,
      controller: titleController,
      decoration: const InputDecoration(
        hintText: 'Category',
        labelText: 'Category Name',
        alignLabelWithHint: true,
        floatingLabelBehavior: FloatingLabelBehavior.auto,
      ),
    );
  }
  buildDescriptionFormField() {
    return TextFormField(
      keyboardType: TextInputType.text,
      controller: descController,
      decoration: const InputDecoration(
        hintText: 'Description',
        labelText: 'Description',
        alignLabelWithHint: true,
        floatingLabelBehavior: FloatingLabelBehavior.auto,
      ),
    );
  }

  buildAddCatagoryButtonWidget() {
    return MaterialButton(
      color: Colors.green,
      minWidth: double.infinity,
      padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 16),
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(28),
      ),
      onPressed: () async {
        String title = titleController.text.toString().trim();
        String desc = descController.text.toString().trim();

        if(imageFile == null){
          print('please select image first');
        }else if(title.isEmpty){
          print('Please enter category name');
        }else if(desc.isEmpty){
          print('Please enter category description');
        }else{
          String? path = await saveImage(imageFile);
          if(path!=null){

            Category category = Category(title: title,description: desc,imagePath: path);
           addCategory(category);
          }
        }
      },
      child: const Text(
        'Add Category',
        style: TextStyle(
          fontSize: 20,
          color: Colors.white,
        ),
      ),
    );
  }
}
