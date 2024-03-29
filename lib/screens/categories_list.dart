import 'package:flutter/material.dart';

import '../dummy_data.dart';
import '../widgets/categories_list_item.dart';

class CategoriesList extends StatelessWidget {
  const CategoriesList({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: GridView(
        padding: const EdgeInsets.all(25),
        gridDelegate: const SliverGridDelegateWithMaxCrossAxisExtent(
          maxCrossAxisExtent: 200,
          childAspectRatio: 3 / 2,
          crossAxisSpacing: 20,
          mainAxisSpacing: 20,
        ),
        children: dummyCategories.map((categoryItem) {
          return CategoriesListItem(
            categoryItem.id,
            categoryItem.title,
            categoryItem.color,
          );
        }).toList(),
      ),
    );
  }
}
