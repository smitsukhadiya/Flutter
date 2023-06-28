import 'package:flutter/material.dart';

class MyTabletpage extends StatelessWidget {
  const MyTabletpage({Key? key}) : super(key: key);
  @override
 Widget build(BuildContext context) {
   return Scaffold(

        appBar: AppBar(
          title: Text('TABLET'),
          backgroundColor: Colors.black,
        ),
        body:  Row(
            children: [
        Padding(padding: EdgeInsets.all(8.0),
      child:AspectRatio(
        aspectRatio: 2.6/9,
        child: Container(
          //margin: EdgeInsets.all(8),
            width: 200,
            decoration: BoxDecoration(
              color: Colors.grey.shade400,
              borderRadius: BorderRadius.circular(10),
            )
        ),
      ),
    ),
    Expanded(
    child: Column(
    children: [
    Padding(
    padding: const EdgeInsets.all(8.0),
    child: AspectRatio(
    aspectRatio: 2/1.1,
    child: Container(
    height: 250,
    decoration: BoxDecoration(
    color: Colors.black,
    borderRadius: BorderRadius.circular(10),
    ),
    child:Stack(
    children: [
    AspectRatio(
    aspectRatio: 2/1.1,
    child: Image.network(
    "https://images.squarespace-cdn.com/content/v1/52e42b1ae4b083a7aeccaf46/1528397149021-35ED72OKYYZLIUB6J9NR/animated-icons-of-people-with-a-range-of-abilities-and-ages.gif",
    fit: BoxFit.contain,
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
    itemBuilder: (context, index) {
    return Container(
    height: 100,
    margin: EdgeInsets.all(8),
    decoration: BoxDecoration(
    color: Colors.green.shade100,
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
