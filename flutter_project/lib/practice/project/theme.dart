import 'package:flutter/material.dart';

ThemeData appTheme() {
  return ThemeData(
      fontFamily: 'Mulish',
      primarySwatch: Colors.amber,
      scaffoldBackgroundColor: Colors.white,
      elevatedButtonTheme: elevatedButtonTheme(),
      textButtonTheme: textButtonTheme(),
      inputDecorationTheme: inputDecorationTheme(),
      appBarTheme: appBarTheme()
  );
}

appBarTheme() {
  return AppBarTheme(
      elevation: 0,
      color: Colors.white,
      centerTitle: true,
      iconTheme: IconThemeData(color: Colors.black)
  );
}

inputDecorationTheme() {
  OutlineInputBorder outlineInputBorder = OutlineInputBorder(
    borderRadius: BorderRadius.circular(28),
    borderSide: BorderSide(color: Colors.black45),
    gapPadding: 10,
  );

  return InputDecorationTheme(
    contentPadding: EdgeInsets.symmetric(horizontal: 20, vertical: 20),
    enabledBorder: outlineInputBorder,
    focusedBorder: outlineInputBorder,
    border: outlineInputBorder,
  );
}

// Text Button Theme
textButtonTheme() {
  return TextButtonThemeData(
    style: ButtonStyle(
      padding: MaterialStateProperty.all(
        EdgeInsets.symmetric(horizontal: 16),
      ),
      textStyle: MaterialStateProperty.all(
        TextStyle(
          fontSize: 18,
          fontWeight: FontWeight.w500,
        ),
      ),
      backgroundColor: MaterialStateProperty.all(Colors.white),
      foregroundColor: MaterialStateProperty.all(Colors.amber.shade600),
    ),
  );
}

// Elevated Button Theme
elevatedButtonTheme() {
  return ElevatedButtonThemeData(
    style: ButtonStyle(
      padding: MaterialStateProperty.all(EdgeInsets.symmetric(horizontal: 30)),
      backgroundColor: MaterialStateProperty.all(Colors.pink),
      foregroundColor: MaterialStateProperty.all(Colors.white),
    ),
  );
}
