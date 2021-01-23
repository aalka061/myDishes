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
        child: Text('You no favorite meals saved yet'),
      );
    } else {
      return ListView.builder(
        itemCount: favMeals.length,
        itemBuilder: (ctx, index) {
          return MealItem(
            id: favMeals[index].id,
            name: favMeals[index].name,
            duration: favMeals[index].duration,
            imageUrl: favMeals[index].imageUrl,
            complexity: favMeals[index].complexity,
            affordability: favMeals[index].affordability,
          );
        },
      );
    }
  }
}
