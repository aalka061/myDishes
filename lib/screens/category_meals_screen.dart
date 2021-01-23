import 'package:flutter/material.dart';

import '../models/meal.dart';
import '../widgets/meal_item.dart';

class CategoryMealsScreen extends StatefulWidget {
  static const ROUTE = '/category-meals';

  final List<Meal> availableMeals;

  CategoryMealsScreen(this.availableMeals);

  @override
  _CategoryMealsScreenState createState() => _CategoryMealsScreenState();
}

class _CategoryMealsScreenState extends State<CategoryMealsScreen> {
  @override
  Widget build(BuildContext context) {
    final routeArgs =
        ModalRoute.of(context).settings.arguments as Map<String, String>;
    final categoryTitle = routeArgs['title'];
    final categoryId = routeArgs['id'];

    final categoryMeals = widget.availableMeals.where((meal) {
      return meal.categories.contains(categoryId);
    }).toList();

    return Scaffold(
      appBar: AppBar(
        title: Text(categoryTitle),
      ),
      body: ListView.builder(
        itemCount: categoryMeals.length,
        itemBuilder: (ctx, index) {
          return MealItem(
            id: categoryMeals[index].id,
            name: categoryMeals[index].name,
            duration: categoryMeals[index].duration,
            imageUrl: categoryMeals[index].imageUrl,
            complexity: categoryMeals[index].complexity,
            affordability: categoryMeals[index].affordability,
          );
        },
      ),
    );
  }
}
