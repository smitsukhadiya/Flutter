import 'package:flutter/material.dart';

const appName = 'ToDo-App';


OutlineInputBorder focusBorder = OutlineInputBorder(
  borderSide: const BorderSide(color: Colors.transparent),
  borderRadius: BorderRadius.circular(10),
);

OutlineInputBorder enabledBorder = OutlineInputBorder(
    borderSide: const BorderSide(color: Colors.transparent),
    borderRadius: BorderRadius.circular(10));

OutlineInputBorder border = OutlineInputBorder(
  borderRadius: BorderRadius.circular(10),
);

OutlineInputBorder errorBorder = OutlineInputBorder(
  borderSide: const BorderSide(color: Colors.transparent),
  borderRadius: BorderRadius.circular(10),
);

Color fillColor = Colors.white;

TextStyle textStyle =
TextStyle(color: Colors.grey.shade700, fontWeight: FontWeight.w400);

const contentPadding =
EdgeInsets.only(left: 20, right: 10, bottom: 10, top: 10);
