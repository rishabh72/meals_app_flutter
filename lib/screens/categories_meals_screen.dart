import 'package:flutter/material.dart';
import 'package:meals_app/models/meal.dart';
import '../widgets/meal_item.dart';
import '../dummy-data.dart';

class CategoriesMealsScreen extends StatefulWidget {
  static const routeName = '/cat-meals';

  @override
  State<CategoriesMealsScreen> createState() => _CategoriesMealsScreenState();
}

class _CategoriesMealsScreenState extends State<CategoriesMealsScreen> {
  // final String catId;
  String catTitle;
  List<Meal> catMeals;

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
  }

  @override
  void didChangeDependencies() {
    // TODO: implement didChangeDependencies
    final routeArgs =
        ModalRoute.of(context).settings.arguments as Map<String, String>;
    catTitle = routeArgs['title'];
    final catId = routeArgs['id'];
    catMeals = DUMMY_MEALS.where((item) {
      return item.catIds.contains(catId);
    }).toList();
    super.didChangeDependencies();
  }

  void _removeMeal(String mealId) {
    setState(() {
      catMeals.removeWhere((item) {
        return item.id == mealId;
      });
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: Text(catTitle),
        ),
        body: ListView.builder(
          itemBuilder: (ctx, index) {
            var item = catMeals[index];
            return MealItem(
              mealId: item.id,
              title: item.title,
              imageUrl: item.imageUrl,
              duration: item.duration,
              complexity: item.complexity,
              affordability: item.affordability,
              removeItem: _removeMeal,
            );
          },
          itemCount: catMeals.length,
        ));
  }
}
