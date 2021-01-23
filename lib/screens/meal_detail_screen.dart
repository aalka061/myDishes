import 'package:flutter/material.dart';

import '../widgets/meal_detail.dart';
import '../dummy_data.dart';

class MealDetailScreen extends StatelessWidget {
  static const ROUTE = '/meal-detail';

  final Function toggleFavorite;
  final Function isFavorite;

  MealDetailScreen(this.toggleFavorite, this.isFavorite);

  @override
  Widget build(BuildContext context) {
    final mealId = ModalRoute.of(context).settings.arguments as String;
    final selectedMeal = DUMMY_MEALS.firstWhere((meal) => meal.id == mealId);
    return Scaffold(
      appBar: AppBar(
        title: Text('${selectedMeal.name}'),
      ),
      body: MealDetail(selectedMeal),
      floatingActionButton: FloatingActionButton(
        child: Icon(
          isFavorite(mealId) ? Icons.star : Icons.star_border,
        ),
        onPressed: () {
          this.toggleFavorite(mealId);
        },
      ),
    );
  }
}
