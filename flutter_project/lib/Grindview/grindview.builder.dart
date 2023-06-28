import 'package:flutter/material.dart';

void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Grindview . Builder',
      home:grindviewbuilderexample(),
      debugShowCheckedModeBanner: false,
    );
  }
}
class grindviewbuilderexample extends StatefulWidget {
  const grindviewbuilderexample({Key? key}) : super(key: key);

  @override
  State<grindviewbuilderexample> createState() => _grindviewbuilderexampleState();
}
class _grindviewbuilderexampleState extends State<grindviewbuilderexample> {
  List<Data> datalist = [];
  @override
  void initState(){
    super.initState();
    datalist.add(Data(text: "He'd have you all unravel at the", color:Colors.pink.shade100));
    datalist.add(Data(text: "Heed not the rabble", color:Colors.pink.shade200));
    datalist.add(Data(text: "Sound of screams but the", color:Colors.pink.shade300));
    datalist.add(Data(text: "Who scream", color:Colors.pink.shade400));
    datalist.add(Data(text: "Revolution is coming...", color:Colors.pink.shade500));
    datalist.add(Data(text: "Revolution, they...", color:Colors.pink.shade600));
  }
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.pink,
        title: Text('Grindview builder'),
      ),
      body: Container(
        padding: EdgeInsets.all(10),
        child: GridView.builder(
          shrinkWrap: true,
          itemCount: datalist.length,
          gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
            crossAxisCount: 3,
            mainAxisSpacing: 10,
            crossAxisSpacing: 10,
          ),
          itemBuilder: (context, index) {
            return Container(
              padding: EdgeInsets.all(8),
              color: datalist[index].color,
              child: Text(datalist[index].text),
            );
          },),
      ),
    );
  }
}
class Data{
  String text;
  Color color;

  Data({required this.text, required this.color});
}