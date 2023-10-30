import 'package:flutter/material.dart';

import '../dummy_data.dart';
import '../widgets/category_meals_item.dart';

class CategoryMeals extends StatelessWidget {
  const CategoryMeals({super.key});

  static const String categoryMealsRoute = '/category-meals';

  @override
  Widget build(BuildContext context) {
    final routeArgs =
        ModalRoute.of(context)?.settings.arguments as Map<String, dynamic>;
    final categoryTitle = routeArgs['title'] as String;
    final categoryId = routeArgs['id'] as String;

    final categoryMeals = dummyMeals.where((meal) {
      return meal.categories.contains(categoryId);
    }).toList();

    return Scaffold(
      appBar: AppBar(
        title: Text(categoryTitle),
      ),
      body: ListView.builder(
        itemCount: categoryMeals.length,
        itemBuilder: (ctx, index) {
          final meal = categoryMeals[index];
          return CategoryMealItem(
            meal.id,
            meal.title,
            meal.imageUrl,
            meal.duration,
            meal.complexity,
            meal.affordability,
          );
        },
      ),
    );
  }
}
