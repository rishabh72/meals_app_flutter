import 'package:flutter/material.dart';
import '../models/meal.dart';
import '../widgets/meal_item.dart';

class FavoritesScreen extends StatelessWidget {
  final List<Meal> favMeals;

  FavoritesScreen(this.favMeals);

  @override
  Widget build(BuildContext context) {
    if (favMeals.isEmpty) {
      return Center(
        child: Text('No Favorites yet! start adding some.'),
      );
    } else {
      return ListView.builder(
        itemBuilder: (ctx, index) {
          var item = favMeals[index];
          return MealItem(
            mealId: item.id,
            title: item.title,
            imageUrl: item.imageUrl,
            duration: item.duration,
            complexity: item.complexity,
            affordability: item.affordability,
            removeItem: null,
          );
        },
        itemCount: favMeals.length,
      );
    }
  }
}
