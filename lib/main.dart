import 'package:flutter/material.dart';

import './screens/category_meals.dart';
import './screens/category_meal_detail.dart';
import './screens/tabs_screen.dart';

void main() => runApp(const MyApp());

class MyApp extends StatelessWidget {
  const MyApp({super.key});

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
        CategoryMeals.categoryMealsRoute: (ctx) => const CategoryMeals(),
        CategoryMealDetail.categoryMealDetailRoute: (ctx) =>
            const CategoryMealDetail(),
      },
    );
  }
}
