import 'dart:math';
import 'package:flutter/material.dart';
import 'package:flutter_practical/Listview/list-opration/person.dart';

void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Material App',
      home: multiselectlistexample(),
    );
  }
}
class multiselectlistexample extends StatefulWidget {
  const multiselectlistexample({Key? key}) : super(key: key);

  @override
  State<multiselectlistexample> createState() => _multiselectlistexampleState();
}

class _multiselectlistexampleState extends State<multiselectlistexample> {
  List<Person> personlist = [];
  List<Person> checklist = [];
  @override
  void initState() {
    super.initState();
    personlist.add(Person(id: 1, name: 'Smit', email:'smit@gmail.com'));
    personlist.add(Person(id: 2, name: 'Rutvik', email:'rutvik@gmail.com'));
    personlist.add(Person(id: 3, name: 'Jenisha', email:'jenisha@gmail.com'));
    personlist.add(Person(id: 4, name: 'Tulsi', email:'tulsi@gmail.com'));
    personlist.add(Person(id: 5, name: 'Darshali', email:'darshali@gmail.com'));
  }
  void _deletelist(Person person){
    setState(() {
      personlist.removeWhere((element) => element.id == person.id);
    });
  }

  var _nameController = TextEditingController();
  var _emailController = TextEditingController();

  void _addPerson(String name, String email, BuildContext context) {
    setState(() {
      var id = Random().nextInt(9999);
      personlist.add(Person(id: id, name: name, email: email));
      _nameController.clear();
      _emailController.clear();
      Navigator.pop(context);
    });
  }

  void _updatePerson(Person mPerson, BuildContext context) {
     setState(() {
       var index = personlist.indexWhere((element) =>element.id==mPerson.id);
       personlist[index]=mPerson;
       Navigator.pop(context);
     });
  }

   void _showbottomsheet(BuildContext context,[Person? person]){
     _nameController.text=person!=null? person.name : '';
     _emailController.text=person!=null? person.email :'';
    showModalBottomSheet(
      isScrollControlled: true,
      context: context, builder: (context) {
       return Padding(
         padding: MediaQuery.of(context).viewInsets,
         child: Container(
           child: Padding(
             padding: EdgeInsets.all(20),
             child: Column(
               mainAxisSize: MainAxisSize.min ,
          children: [
              TextField(
                controller: _nameController,
                cursorColor: Colors.grey,
                keyboardType: TextInputType.text,
                textAlign: TextAlign.center,
                decoration: InputDecoration(
                  border: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(20)
                  ),
                  hintText: 'Enter name',
                    hintStyle: TextStyle(
                      color: Colors.grey.shade700,
                      fontWeight: FontWeight.w400,
                    )
                ),
              ),
              SizedBox(height: 16,),
              TextField(
                controller: _emailController,
                cursorColor: Colors.grey,
                keyboardType: TextInputType.emailAddress,
                textAlign: TextAlign.center,
                decoration: InputDecoration(
                  border: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(20)
                  ),
                  hintText: 'Enter Email',
                  hintStyle: TextStyle(
                    color: Colors.grey.shade700,
                    fontWeight: FontWeight.w400,
                  ),
                ),
              ),
              SizedBox(height: 16,),
              ElevatedButton(onPressed: () {
                var name = _nameController.text;
                 var email = _emailController.text;
                 if(person==null){
                   _addPerson(name , email,context);
                 }else{
                   Person mPerson = Person(id: person.id, name: name, email: email);
                   _updatePerson(mPerson,context);
                 }
                // print('name : $name email $email');
              }, child: Text(person!=null? 'Update Person':'Add Person')),
          ],
             ),
           ),
         ),
       );
     },
    );
   }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: Text('Multi select List'),
        ),
        body: ListView.builder(
          itemCount: personlist.length,
          itemBuilder: (context, index) {
            return getlistitem(context,personlist[index]);
          },
        ),
      floatingActionButton: FloatingActionButton(
        onPressed: () {
         _showbottomsheet(context);
        },
        child: Icon(
          Icons.add
        ),
      ),
    );
  }
  Widget getlistitem(BuildContext context,Person person) {
    return ListTile(
      onTap: () {
        _showbottomsheet(context,person);
      },
      leading: Icon(
        Icons.account_circle,
        size: 30,
      ),
      trailing: PopupMenuButton(
        onSelected: (value) {
          switch(value){
            case 'delete':{
            _deletelist(person);
            }
            break;
            case 'cancel':{

            }
            break;
          }
        },
        itemBuilder: (context) => [
          PopupMenuItem(
            value: 'delete',
            child: Text('Delete'),
          ),
          PopupMenuItem(
            value: 'cancel',
            child: Text('Cancel'),
          ),
        ],
      ),
      title: Text(person.name),
      subtitle: Text(person.email),
    );
  }
}
