import 'package:flutter/material.dart';
import 'package:flutter_practical/foodapp/views/widgets/recipe_card.dart';

class HomePage extends StatefulWidget {
  const HomePage({Key? key}) : super(key: key);

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Icon(Icons.restaurant_menu),
            SizedBox(height: 10,),
           Text("Food Recipe"),
          ],
        ),
      ),
          body: RecipeCard(title: "My recipe", cookTime:" 1:30 Min", rating: "4.2", thumbnailUrl: "thumbnailUrl"),
    );
  }
}
