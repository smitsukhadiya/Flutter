import 'package:flutter/material.dart';
import 'package:flutter_practical/Routing%20Extras/first_route.dart';


class thirdroute extends StatelessWidget {
  const thirdroute({Key? Key}) : super(key: Key);
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Third Route'),
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Text(
              'Third Route',
              style: TextStyle(fontSize: 30),
            ),
            SizedBox(
              height: 20,
            ),
            ElevatedButton(onPressed: (){
              Navigator.pop(context);
            }, child:Text('HOME'),
            ),
           ElevatedButton(onPressed: (){
              Navigator.popUntil(context,ModalRoute.withName('/first'),
              );
            },
              child: Text('pop until'),
            ),
            ElevatedButton(
              onPressed: () {
                Navigator.pushAndRemoveUntil(
                    context,
                    MaterialPageRoute(builder:(context) => firstroute(),
                    ),
                        (route) => false);
              },
              child: Text('Push and RemoveUntill'),
            ),
            ElevatedButton(
              onPressed: () {
                Navigator.pushNamedAndRemoveUntil(context,( '/first'), (Route<dynamic>route) => false);
              },
              child: Text('Push named and removeuntill'),
            ),
          ],
        ),
      ),
    );
  }
}
