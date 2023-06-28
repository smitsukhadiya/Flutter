import 'package:flutter/material.dart';
import 'package:flutter_practical/practice/project/Routes/app_route.dart';
import 'package:flutter_practical/practice/project/constants.dart';
import 'package:flutter_practical/practice/project/theme.dart';

void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title:appName,
      theme: appTheme(),
      debugShowCheckedModeBanner: false,
      initialRoute: AppRoute.splachScreen,
      onGenerateRoute: AppRoute.generateRoute,
    );
  }
}
