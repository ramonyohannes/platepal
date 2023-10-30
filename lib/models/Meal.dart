enum Complexity {
  simple,
  challenging,
  hard,
}

enum Affordability {
  affordable,
  pricy,
  luxurious,
}

class Meal {
  final String id;
  final List<String> categories;
  final String title;
  final Complexity complexity;
  final Affordability affordability;
  final String imageUrl;
  final double duration;
  final List<String> ingredients;
  final List<String> steps;
  final bool isGlutenFree;
  final bool isLactoseFree;
  final bool isVegan;
  final bool isVegetarian;

  const Meal({
    required this.id,
    required this.categories,
    required this.title,
    required this.complexity,
    required this.affordability,
    required this.imageUrl,
    required this.duration,
    required this.ingredients,
    required this.steps,
    required this.isGlutenFree,
    required this.isLactoseFree,
    required this.isVegan,
    required this.isVegetarian,
  });
}
