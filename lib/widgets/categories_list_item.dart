import 'package:flutter/material.dart';

class CategoriesListItem extends StatelessWidget {
  final String categoryId;
  final String categoryTitle;
  final Color categoryColor;

  const CategoriesListItem(
      this.categoryId, this.categoryTitle, this.categoryColor,
      {super.key});

  void _navigateToCategoryMeals(BuildContext context) {
    // TODO: Navigate to category meals screen
  }

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: () => _navigateToCategoryMeals(context),
      splashColor: Theme.of(context).primaryColor,
      borderRadius: BorderRadius.circular(15),
      child: Container(
        padding: const EdgeInsets.all(15),
        decoration: BoxDecoration(
          gradient: LinearGradient(
            colors: [
              categoryColor.withOpacity(0.7),
              categoryColor,
            ],
            begin: Alignment.topLeft,
            end: Alignment.bottomRight,
          ),
          borderRadius: BorderRadius.circular(15),
        ),
        child: Text(
          categoryTitle,
          style: Theme.of(context).textTheme.titleLarge,
        ),
      ),
    );
  }
}
