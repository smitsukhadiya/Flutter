import 'package:flutter/material.dart';
import 'package:flutter_sqlite_database/Database/Model/user.dart';
import 'package:flutter_sqlite_database/Database/database_helper.dart';

class adduserpage extends StatefulWidget {
 User? user;

 adduserpage(this.user, {super.key});

  @override
  State<adduserpage> createState() => _adduserpageState(user);
}

class _adduserpageState extends State<adduserpage> {
  var _namecontroller = TextEditingController();
  var _emailcontroller = TextEditingController();
  var _contactcontroller = TextEditingController();
  var _agecontroller = TextEditingController();

  var appBarTitle = "";
  var btnText = "";

  User? user;

  _adduserpageState(this.user);

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    if(user!=null){
      appBarTitle = "Edit User";
      btnText = "Update";
      _namecontroller.text = user!.name;
      _emailcontroller.text = user!.email;
      _agecontroller.text = user!.age.toString();
      _contactcontroller.text = user!.contact;
    }else{
      appBarTitle = "Add User";
      btnText = "Add";
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(appBarTitle),
      ),
      body: Padding(
        padding: EdgeInsets.all(20),
        child: Column(
          children: [
            TextField(
              controller: _namecontroller,
              decoration: InputDecoration(
                hintText: 'Enter Name',
                border: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(20),
                ),
              ),
              keyboardType: TextInputType.name,
            ),
            SizedBox(height: 16,),
            TextField(
              controller: _emailcontroller,
              decoration: InputDecoration(
                hintText: 'Enter Email',
                border: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(20),
                ),
              ),
              keyboardType: TextInputType.emailAddress,
            ),
            SizedBox(height: 16,),
            TextField(
              controller: _contactcontroller,
              decoration: InputDecoration(
                hintText: 'Enter Contact',
                border: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(20),
                ),
              ),
              keyboardType: TextInputType.number,
            ),
            SizedBox(height: 16,),
            TextField(
              controller: _agecontroller,
              decoration: InputDecoration(
                hintText: 'Enter Age',
                border: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(20),
                ),
              ),
              keyboardType: TextInputType.number,
            ),
            SizedBox(height: 16,),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceAround,
              children: [
                ElevatedButton(onPressed: () {
                  DatabaseHelper.instance.intsertUser(user!);
                 String name = _namecontroller.text;
                 String email = _emailcontroller.text;
                 String contact = _contactcontroller.text;
                 int age = int.parse(_agecontroller.text);

                 if(user!=null){
                   User mUser = User.withId(id:user!.id,name: name, email: email, contact: contact, age: age);
                   updateUser(mUser,context);
                 }else{
                   User user = User(name: name, email: email, contact: contact, age: age);
                   addUser(user,context);
                 }
                }, child:Text(btnText)),
               user!= null?
               ElevatedButton(onPressed: () {
                 deleteUser(user);

               }, child:Text('Delete'))
                   :Expanded(child: Container()),
              ],
            )
          ],
        ),
      ),
    );
  }

  Future<void> addUser(User user, BuildContext context) async {
   var id = await DatabaseHelper.instance.intsertUser(user);
   if(id!=-1){
     Navigator.pop(context,id);
   }else{
     print('error occured');
   }
  }

  Future<void> updateUser(User mUser, BuildContext context) async {
    var id = await DatabaseHelper.instance.updateUser(mUser);
    if(id!=-1){
      Navigator.pop(context,id);
    }else{
      print('error occured');
    }
  }

  Future<void> deleteUser(User? user) async {
    var id = await DatabaseHelper.instance.deleteUser(user!.id);
    if(id!=-1){
      Navigator.pop(context,id);
    }else{
      print('error occured');
    }
  }
}
