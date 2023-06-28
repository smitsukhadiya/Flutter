import 'package:flutter/material.dart';

class MyMobilepage extends StatelessWidget {
  const MyMobilepage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      drawer: Drawer(
        width: 190,
        backgroundColor: Colors.grey.shade400,
     ),
        appBar: AppBar(
          backgroundColor:Colors.black,
          title: Text('MOBILE'),
        ),
        body: Row(
          children: [
            Expanded(
                child: Column(
              children: [
                Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: AspectRatio(
                      aspectRatio: 16/9,
                      child: Container(
                       // color: Colors.grey.shade400,
                        decoration: BoxDecoration(
                            color: Colors.black,
                          borderRadius: BorderRadius.circular(10),
                        ),

                         child:Stack(
                        children: [
                            Image.network (
                            "https://c.tenor.com/9VaFJibHEUUAAAAC/siri-taiga.gif",
                            fit: BoxFit.contain,
                            ),
                         Positioned(
                           bottom: 100,
                          right: 200,
                          child: Icon(
                            Icons.play_arrow,
                            color: Colors.white,
                            size: 60,
                          ),
                         ),
                        ],
                         ),
                 ),
            ),
            ),
                Expanded(
                    child: ListView.builder(
                      itemCount: 11,
                        itemBuilder: (context,index) {
                          return Container(
                            height: 100,
                            margin: EdgeInsets.all(8),
                            decoration: BoxDecoration(
                              color: Colors.pinkAccent.shade100,
                              borderRadius: BorderRadius.circular(10),
                            ),
                          );
                        },
                ),
                ),
            ],
           ),
          ),
         ],
        ),

    );
  }
}

