import 'package:flutter/material.dart';

class slidescreen extends StatelessWidget {
  String title;
  String desc;
  String image;


  slidescreen({required this.title, required this.desc, required this.image});

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        Image.network(image),
        SizedBox(height: 15,),
        Text(
          textAlign: TextAlign.center,
            title,
          style: TextStyle(
            wordSpacing: 1,
            color: Colors.grey.shade500,
            fontWeight: FontWeight.bold,
            fontSize: 26,
          ),
        ),
        SizedBox(height: 15,),
        Text(
          textAlign: TextAlign.center,
            desc,
          style: TextStyle(
            letterSpacing: 1,
              color: Colors.grey.shade400,
              fontWeight: FontWeight.bold,
              fontSize: 16
          ),
        ),
      ],
    );
  }
}
