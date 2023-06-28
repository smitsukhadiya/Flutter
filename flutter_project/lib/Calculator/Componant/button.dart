import 'package:flutter/material.dart';

class mybutton extends StatelessWidget {

  final color;
  final textcolor;
  final String buttontext;
  final ontapped;

  mybutton({this.color, this.textcolor, required this.buttontext,this.ontapped});

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: ontapped,
      child: Container(
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(50),
          color:color,
        ),
        child: Align(
          alignment: Alignment.center,
            child: Text(
              buttontext,
              style: TextStyle(
                fontSize: 27,
                color:textcolor,
                fontWeight: FontWeight.w600
              ),
            ),
        ),
      ),
    );
  }
}
