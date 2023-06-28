import 'package:flutter/material.dart';

void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'text widget',
      home: Scaffold(
        appBar: AppBar(
          title: Text('text widget Bar'),
        ),
        body: Container(
          padding: EdgeInsets.all(50),
          width: 500,
          height: 500,
          decoration: BoxDecoration(
            gradient: LinearGradient(
              colors: [
                Colors.blue,
                Colors.blueAccent.shade100,
                Colors.blueGrey.shade200,
                Colors.lightBlue.shade200,
              ],
            )
          ),
          alignment: Alignment.center,
          child: Image.asset('assets/download.png'),
          // child: Image.network('https://i.ytimg.com/an/7oIAs-0G4mw/3687264029678630069_mq.jpg?v=6082f311'),  
          // child: Text(
            //
            //   'Hello vijayHello vijayHello vijayHello vijayHello vijayHello vijayHello vijayHello vijayHello vijayHello vijayHello vijayHello vijayHello vijayHello vijayHello vijayHello vijayHello vijayHello vijayHello vijayHello vijayHello vijayHello vijayHello vijayHello vijayHello vijayHello vijayHello vijayHello vijayHello vijayHello vijayHello vijayHello vijayHello vijayHello vijayHello vijay',
            //     overflow: TextOverflow.ellipsis,
            //     style: TextStyle(
            //
            //  // color:Colors.amber,
            //       fontSize: 30,
            //       fontWeight: FontWeight.bold,
            //       decoration: TextDecoration.combine([
            //         TextDecoration.underline,
            //         TextDecoration.overline,
            //       ]),
            //         decorationColor: Colors.brown,
            //       decorationStyle: TextDecorationStyle.dotted,
            //       shadows: [
            //        Shadow(
            //             color: Colors.brown,
            //             blurRadius: 20,
            //             offset: Offset(9,3)
            //         )
            //       ],
            //       foreground: Paint()..color = Colors.brown..style = PaintingStyle.stroke..strokeWidth = 2,
            //         letterSpacing: 3,
            // ),
            // ),
        ),
      ),
    );
  }
}
