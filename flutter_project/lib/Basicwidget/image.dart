import 'package:flutter/material.dart';

void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Image Widget',
      home: Scaffold(
        appBar: AppBar(
          title: Text('Image Widget'),
        ),
        body: Center(
          child: Container(
            decoration: BoxDecoration(
              color: Colors.orange.shade100,
              borderRadius: BorderRadius.circular(20),
            ),
           child: const Opacity(
             opacity: 0.4,
             child: Image(
              height: 300,
             width: 200,
             fit: BoxFit.contain,
            color: Colors.redAccent,
              colorBlendMode: BlendMode.dstATop,
              image: NetworkImage(
                  "https://picsum.photos/200/300.jpg",
              ),
              ),
           ),
        ),
      ),
      ),
    );
  }
}
