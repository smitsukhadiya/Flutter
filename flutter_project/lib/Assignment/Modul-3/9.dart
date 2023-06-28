import 'package:flutter/material.dart';
import 'dart:math';


void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Material App',
      home: d9(),
    );
  }
}
class d9 extends StatefulWidget {
  const d9({Key? key}) : super(key: key);

  @override
  State<d9> createState() => _d9State();
}

class _d9State extends State<d9> {
  var namecontroller = TextEditingController();
  var emailcontroller = TextEditingController();
  List<Person> personList = [];
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('User List'),
      ),
      body: ListView.builder(
        itemCount: personList.length,
        itemBuilder: (context, index) {
        return getListItem(context,personList[index]);
       },
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () {
            showfloatingbtn(context);
        },
        child: Icon(Icons.add),
      ),
    );
  }

  void showfloatingbtn(BuildContext context , [Person? person]) {
    namecontroller.text = person!=null? person.name : '';
    emailcontroller.text = person!=null? person.email : '';
    showModalBottomSheet(
      shape:OutlineInputBorder(borderRadius: BorderRadius.circular(20)),
      isScrollControlled: true,
      context: context, builder:(context) {
       return Padding(
         padding: MediaQuery.of(context).viewInsets,
         child: Padding(
           padding: EdgeInsets.all(20),
           child: Column(
             mainAxisSize: MainAxisSize.min,
             children: [
               TextField(
                 controller: namecontroller,
                 keyboardType: TextInputType.name,
                 decoration: InputDecoration(
                   border: OutlineInputBorder(
                     borderRadius: BorderRadius.circular(20),
                   ),
                   prefixIcon: Icon(Icons.drive_file_rename_outline_sharp),
                   hintText: 'Name :',
                 ),
               ),
               SizedBox(height: 20,),
               TextField(
                 controller: emailcontroller,
                 keyboardType: TextInputType.emailAddress,
                 decoration: InputDecoration(
                   border: OutlineInputBorder(
                     borderRadius: BorderRadius.circular(20),
                   ),
                   prefixIcon: Icon(Icons.attach_email_rounded),
                   hintText: 'Email-Address :',
                 ),
               ),
               SizedBox(height: 20,),
               ElevatedButton(
                   onPressed: () {
                     var name = namecontroller.text;
                     var email = emailcontroller.text;
                    if(person==null){
                      addPerson(name,email,context);
                    }else{
                      Person mPerson = Person(id: person.id, name: name, email: email);
                      updatePerson(mPerson,context);
                    }

               }, child:Text(person!=null? '                              UPDATE                              ':'                              ADD                              ')),
             ],
           ),
         ),
       );
     },
    );
  }

  Widget getListItem(BuildContext context,Person person){
    return ListTile(
      title: Text(person.name),
      subtitle: Text(person.email),
      leading: Icon(Icons.person_pin),
      trailing: PopupMenuButton(
        onSelected: (value) {
          if(value=='view'){
           Navigator.push(context,MaterialPageRoute(builder: (context) => personScreen(sPerson :person,),));
          }else if(value=='update'){
            showfloatingbtn(context,person);
          }else{
              deletePerson(person);
          }
        },
        itemBuilder: (context) => [
          PopupMenuItem(
            value: 'view',
            child: Text('View'),
          ),
          PopupMenuItem(
            value: 'update',
            child: Text('Update'),
          ),
          PopupMenuItem(
            value: 'delete',
            child: Text('Delete'),
          ),
        ],
      ),
    );
  }

  void addPerson(String name,String email,BuildContext context) {
    setState(() {
      var id = Random().nextInt(9999);
      personList.add(Person(id: id, name: name, email: email));
      namecontroller.clear();
      emailcontroller.clear();
      Navigator.pop(context);
    });
  }

  void updatePerson(Person mPerson,BuildContext context) {
   setState(() {
     var index = personList.indexWhere((element) => element.id==mPerson.id);
     personList[index]=mPerson;
     Navigator.pop(context);
   });
  }

  void deletePerson(Person person) {
    setState(() {
      personList.removeWhere((element) => element.id==person.id);
    });
  }
}

class Person{
  int id;
  String name;
  String email;

  Person({required this.id, required this.name, required this.email});
}

class personScreen extends StatelessWidget {
     final Person sPerson;

  personScreen({required this.sPerson});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(sPerson.name),
      ),
      body:  Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            CircleAvatar(
              child: Image.asset("assets/Person.png"),
              radius: 100,
            ),
            SizedBox(height: 20,),
            Text(sPerson.name,style: TextStyle(fontWeight: FontWeight.bold,fontSize: 20)),
            SizedBox(height: 10,),
            Text(sPerson.email,style: TextStyle(fontWeight: FontWeight.bold,fontSize: 20)),
          ],
        ),
      ),
    );
  }
}

