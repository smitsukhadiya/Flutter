import 'package:flutter/material.dart';
import 'package:flutter_practical/practice/project/Screens/category/components/body.dart';

class CatagoryScreen extends StatefulWidget {
  const CatagoryScreen({super.key});

  @override
  State<CatagoryScreen> createState() => _CatagoryScreenState();
}

class _CatagoryScreenState extends State<CatagoryScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text('Add Category')),
      body: Body(),
    );
  }
}
