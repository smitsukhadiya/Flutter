import 'package:flutter/material.dart';
import 'package:flutter_practical/practice/project/Routes/app_route.dart';
import 'package:flutter_practical/practice/project/constants.dart';
import 'package:flutter_practical/practice/project/praference/pref_manager.dart';
import 'package:flutter_practical/practice/project/theme.dart';

Future<void> main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await PrefManager.init();
  runApp(MyApp());
}

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
