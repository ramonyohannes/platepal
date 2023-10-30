import 'package:flutter/material.dart';

import '../dummy_data.dart';
import '../models/meal.dart';
import '../widgets/category_meals_item.dart';

class CategoryMeals extends StatefulWidget {
  const CategoryMeals({super.key});

  static const String categoryMealsRoute = '/category-meals';

  @override
  State<CategoryMeals> createState() => _CategoryMealsState();
}

class _CategoryMealsState extends State<CategoryMeals> {
  late String categoryTitle;
  late String categoryId;
  late List<Meal> categoryMeals;

  var isLoaded = false;

  @override
  void didChangeDependencies() {
    if (isLoaded == false) {
      final routeArgs =
          ModalRoute.of(context)?.settings.arguments as Map<String, dynamic>;
      categoryTitle = routeArgs['title'] as String;
      categoryId = routeArgs['id'] as String;

      categoryMeals = dummyMeals.where((meal) {
        return meal.categories.contains(categoryId);
      }).toList();
    }
    isLoaded = true;

    super.didChangeDependencies();
  }

  void removeCategory(String catId) {
    setState(() {
      categoryMeals.removeWhere((element) => element.id == catId);
    });
  }

  @override
  Widget build(BuildContext context) {
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
            removeCategory,
          );
        },
      ),
    );
  }
}
