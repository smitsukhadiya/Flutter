import 'package:flutter/material.dart';

import 'model/person.dart';

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
    return ListTile(
      leading: Icon(
        Icons.account_circle,
        size: 30,
      ),
      trailing: Checkbox(
        value: person.ischeked,
        onChanged: (value) {
               setState(() {
                 person.ischeked = value!;
                 if(person.ischeked){
                   checklist.add(person);
                 }else{
                   checklist.removeWhere((element) =>element.id == person.id );
                 }
               });
               print(checklist);
        },
      ),
      title: Text(person.name),
      subtitle: Text(person.email),
    );
  }
}
