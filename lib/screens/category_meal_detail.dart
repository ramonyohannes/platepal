import 'package:flutter/material.dart';
import '../dummy_data.dart';

class CategoryMealDetail extends StatelessWidget {
  const CategoryMealDetail({super.key});

  static const String categoryMealDetailRoute = '/category-meals-detail';

  @override
  Widget build(BuildContext context) {
    final categoryMealId = ModalRoute.of(context)?.settings.arguments as String;
    final categoryMeal =
        dummyMeals.firstWhere((meal) => meal.id == categoryMealId);

    return Scaffold(
      appBar: AppBar(
        title: Text(categoryMeal.title),
      ),
      body: SingleChildScrollView(
        child: Column(
          children: [
            SizedBox(
              height: 300,
              child: FittedBox(
                fit: BoxFit.cover,
                child: Image.network(
                  categoryMeal.imageUrl,
                ),
              ),
            ),
            const SizedBox(
              height: 10,
            ),
            Text(
              "Ingredients",
              style: Theme.of(context).textTheme.titleLarge,
            ),
            const SizedBox(
              height: 10,
            ),
            SizedBox(
              height: 200,
              child: ListView.builder(
                itemCount: categoryMeal.ingredients.length,
                itemBuilder: (ctx, index) {
                  return Card(
                    color: Theme.of(context).primaryColor,
                    child: Padding(
                      padding: const EdgeInsets.symmetric(
                        vertical: 5,
                        horizontal: 10,
                      ),
                      child: Text(
                        categoryMeal.ingredients[index],
                        style: const TextStyle(
                          color: Colors.white,
                        ),
                      ),
                    ),
                  );
                },
              ),
            ),
            const SizedBox(
              height: 10,
            ),
            Text(
              "Steps",
              style: Theme.of(context).textTheme.titleLarge,
            ),
            const SizedBox(
              height: 10,
            ),
            SizedBox(
              height: 200,
              child: ListView.separated(
                itemCount: categoryMeal.steps.length,
                separatorBuilder: (ctx, index) => const Divider(),
                itemBuilder: (ctx, index) {
                  return ListTile(
                    leading: CircleAvatar(
                      child: Text("# ${index + 1}"),
                    ),
                    title: Text(categoryMeal.steps[index]),
                  );
                },
              ),
            ),
            const SizedBox(
              height: 50,
            ),
          ],
        ),
      ),
      floatingActionButton: FloatingActionButton(
        backgroundColor: Theme.of(context).colorScheme.error,
        onPressed: () {
          Navigator.of(context).pop(categoryMealId);
        },
        child: const Icon(Icons.delete),
      ),
      floatingActionButtonLocation: FloatingActionButtonLocation.endFloat,
    );
  }
}
