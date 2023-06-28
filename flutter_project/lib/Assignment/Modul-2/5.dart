import 'package:flutter/material.dart';

void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Material App',
      home:d5(),
    );
  }
}
class d5 extends StatefulWidget {
  const d5({Key? key}) : super(key: key);

  @override
  State<d5> createState() => _d5State();
}

class _d5State extends State<d5> {
  double _fontsize = 10;
  increament(){
    setState(() {
    });
    _fontsize++;
  }
  decreament(){
    setState(() {
    });
    _fontsize--;
  }
  @override
  Widget build(BuildContext context) {
    return  Scaffold(
      appBar: AppBar(
        title: Text('D5'),
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.spaceAround,
          children: [
            ElevatedButton(
                onPressed: (){
                  increament();
                }, child:Text(
              '+',
              style: TextStyle(
                fontWeight: FontWeight.bold,
              ),
            )
            ),
            Text('SMIT',style: TextStyle(fontSize:_fontsize),),
            ElevatedButton(
                onPressed: (){
                  decreament();
                }, child:Text(
              '-',
              style: TextStyle(
                fontWeight: FontWeight.bold,
              ),
            )
            ),
          ],
        )
      ),
    );
  }
}

