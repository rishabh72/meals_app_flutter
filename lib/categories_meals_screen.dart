import 'package:flutter/material.dart';

class CategoriesMealsScreen extends StatelessWidget {
  static const routeName = '/cat-meals';

  // final String catId;
  // final String catTitle;

  // CategoriesMealsScreen(this.catId, this.catTitle);

  @override
  Widget build(BuildContext context) {
    final routeArgs =
        ModalRoute.of(context).settings.arguments as Map<String, String>;
    final catTitle = routeArgs['title'];
    final catId = routeArgs['id'];
    return Scaffold(
      appBar: AppBar(
        title: Text(catTitle),
      ),
      body: Center(
        child: Text('The Recipes for the Category!'),
      ),
    );
  }
}
