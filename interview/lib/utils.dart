import 'package:flutter/material.dart';
class Utils{
  //Regex to check valid password
  static String regexpass =
      "^(?=.*[0-9])(?=.*[a-z])(?=.*[A-Z])(?=.*[@#\$%^&+=])(?=\\S+\$).{8,20}\$";
  static String regexemail =
      "^(?=.{1,64}@)[A-Za-z0-9_-]+(\\.[A-Za-z0-9_-]+)*@" +
          "[^-][A-Za-z0-9-]+(\\.[A-Za-z0-9-]+)*(\\.[A-Za-z]{2,})\$";

  static bool isValidEmail(String email){
    return RegExp(regexemail).hasMatch(email);
  }
  static bool isValidPassword(String pass){
    return RegExp(regexpass).hasMatch(pass);
  }
}