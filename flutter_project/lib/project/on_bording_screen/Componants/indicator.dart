import 'package:flutter/material.dart';

Widget getindicator(bool isactive){
  return Container(
    margin: EdgeInsets.symmetric(horizontal: 3.0),
    height:isactive? 14.0 : 10.0,
    width: isactive? 24.0 : 20.0,
    decoration: BoxDecoration(
      color:isactive? Colors.grey.shade600 : Colors.grey.shade300,
      borderRadius: BorderRadius.circular(12),
    ),
  );
}