import 'package:flutter/material.dart';

const appName = 'Shoppio App';
const iconEmail = 'assets/Mail.svg';
const iconCall = 'assets/Call.svg';

const kBackgroundGradient = RadialGradient(
  /*focalRadius: 1000,*/
  /*tileMode: TileMode.repeated,*/
    stops: [0.2, 0.5, 1],
    colors: [
      Color(0xFFFFFFFF),
      Color(0xFFFFF8E1),
      Color(0xFFFFD54F),
    ]);

const headingStyle = TextStyle(
  fontSize: 24,
  fontWeight: FontWeight.bold,
  color: Colors.black,
  height: 1.5,
);

