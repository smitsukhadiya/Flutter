import 'package:flutter/material.dart';
import 'package:flutter_practical/practice/project/Routes/app_route.dart';
import 'package:flutter_practical/practice/project/Screens/category_list/components/body.dart';


class CatagoryListScreen extends StatelessWidget {
  const CatagoryListScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(

        title: Text('Category List'),
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () {
         Navigator.pushNamed(context,AppRoute.categoryScreen);
        },
        shape: RoundedRectangleBorder(borderRadius:BorderRadius.circular(20)),
        elevation: 5,
        child: Icon(Icons.add,color: Colors.white),
      ),
      body: Body(),
    );
  }
}
