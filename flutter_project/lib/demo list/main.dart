import 'package:flutter/material.dart';
import 'package:flutter_practical/demo%20list/person.dart';


void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Material App',
      home: multiselectlistexample(),
      debugShowCheckedModeBanner: false,
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
    personlist.add(Person(id: 1, name: 'Rutvik', email:'rutvik@gmail.com'));
    personlist.add(Person(id: 1, name: 'Jenisha', email:'jenisha@gmail.com'));
    personlist.add(Person(id: 1, name: 'Tulsi', email:'tulsi@gmail.com'));
    personlist.add(Person(id: 1, name: 'Darshali', email:'darshali@gmail.com'));
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
            return getlistitem(personlist[index]);
          },)
    );
  }

  Widget getlistitem(Person person) {
    return Padding(
      padding: EdgeInsets.all(10),
      child: ListTile(
        tileColor: Colors.grey.shade200,
        leading: Padding(
          padding: EdgeInsets.all(5),
          child: Icon(
            Icons.account_circle,
            size: 30,
          ),
        ),
        title: Text(person.name),
        subtitle: Text(person.email),
        onTap: () {
           setState(() {
             person.ischeked =!person.ischeked;
           });
        },
        selected: person.ischeked? true : false,
        selectedColor: Colors.grey.shade800,
        selectedTileColor: Colors.blue.shade300,
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.horizontal(
              right: Radius.elliptical(150, 50),
            left: Radius.circular(50)
          ),),
      ),
    );
  }
}