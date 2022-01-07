import 'package:flutter/material.dart';
import '../widgets/meal_item.dart';
import '../dummy-data.dart';

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
    final catMeals = DUMMY_MEALS.where((item) {
      return item.catIds.contains(catId);
    }).toList();

    return Scaffold(
        appBar: AppBar(
          title: Text(catTitle),
        ),
        body: ListView.builder(
          itemBuilder: (ctx, index) {
            var item = catMeals[index];
            return MealItem(
              title: item.title,
              imageUrl: item.imageUrl,
              duration: item.duration,
              complexity: item.complexity,
              affordability: item.affordability,
            );
          },
          itemCount: catMeals.length,
        ));
  }
}
