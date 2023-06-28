import 'package:flutter_practical/foodapp/modals/recipe.dart';

class RecipeApi{
  static Future<List<Recipe>> getRecipe ()async{
    var uri = Uri.https('yummly2.p.rapidapi.com','/feeds/list',
        {'limit': '24','start': '0','tag':'list.recipe.popular'});

    final responce = await http.get(uri,heades:{
      'X-RapidAPI-Key': 'SIGN-UP-FOR-KEY',
      'X-RapidAPI-Host': 'yummly2.p.rapidapi.com',

    })
  }
}