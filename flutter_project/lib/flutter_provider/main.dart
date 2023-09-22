import 'package:flutter/material.dart';
import 'package:flutter_practical/flutter_provider/home_screen.dart';
import 'package:flutter_practical/flutter_provider/list_provider.dart';
import 'package:provider/provider.dart';

void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MultiProvider(
      providers: [
        ChangeNotifierProvider(
          create: (context) => ListProvider(),
        ),
      ],
      child: MaterialApp(
        debugShowCheckedModeBanner: false,
        theme: ThemeData(
          useMaterial3: true,
        ),
        title: 'Material App',
        home: HomeScreen(),
      ),
    );
  }
}
