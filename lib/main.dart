import 'package:flutter/material.dart';
import 'package:platepal_app/models/meal.dart';

import './screens/category_meals.dart';
import './screens/category_meal_detail.dart';
import './screens/tabs_screen.dart';
import './screens/filters_screen.dart';

import './dummy_data.dart';

void main() => runApp(const MyApp());

class MyApp extends StatefulWidget {
  const MyApp({super.key});

  @override
  State<MyApp> createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  Map<String, Object> _availableFilters = {
    'isGlutenFree': false,
    'isVegan': false,
    'isVegetarian': false,
    'isLactoseFree': false,
  };

  List<Meal> _availableMeals = dummyMeals;

  void setFilters(Map<String, Object> filters) {
    setState(() {
      _availableFilters = filters;

      _availableMeals = dummyMeals.where((meal) {
        if (_availableFilters['isGlutenFree'] as bool && !meal.isGlutenFree) {
          return false;
        }
        if (_availableFilters['isVegan'] as bool && !meal.isVegan) {
          return false;
        }
        if (_availableFilters['isVegetarian'] as bool && !meal.isVegetarian) {
          return false;
        }
        if (_availableFilters['isLactoseFree'] as bool && !meal.isLactoseFree) {
          return false;
        }
        return true;
      }).toList();
    });
  }

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Material App',
      theme: ThemeData(
        appBarTheme: const AppBarTheme(
          centerTitle: true,
          backgroundColor: Colors.white,
          elevation: 0,
          iconTheme: IconThemeData(color: Colors.black),
          titleTextStyle: TextStyle(
            color: Colors.black,
            fontSize: 20,
            fontWeight: FontWeight.bold,
            fontFamily: 'Raleway',
          ),
        ),
        textTheme: const TextTheme(
            bodyLarge: TextStyle(
              color: Colors.white,
              fontSize: 20,
              fontWeight: FontWeight.bold,
              fontFamily: 'Raleway',
            ),
            titleLarge: TextStyle(
              color: Colors.black,
              fontSize: 20,
              fontWeight: FontWeight.bold,
              fontFamily: 'Raleway',
            )),
        primarySwatch: Colors.blue,
        primaryColor: Colors.purple,
      ),
      routes: {
        "/": (context) => const TabsScreen(),
        CategoryMeals.categoryMealsRoute: (ctx) =>
            CategoryMeals(_availableMeals),
        CategoryMealDetail.categoryMealDetailRoute: (ctx) =>
            const CategoryMealDetail(),
        Filters.filtersRoute: (ctx) => Filters(setFilters, _availableFilters),
      },
    );
  }
}
