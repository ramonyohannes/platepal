import 'package:flutter/material.dart';

import '../models/Meal.dart';
import '../screens/category_meal_detail.dart';

class CategoryMealItem extends StatelessWidget {
  final String id;
  final String title;
  final String imageUrl;
  final double duration;
  final Complexity complexity;
  final Affordability affordability;
  final Function removeCategory;

  CategoryMealItem(this.id, this.title, this.imageUrl, this.duration,
      this.complexity, this.affordability, this.removeCategory)
      : super(key: ValueKey(id));

  String get complexityText {
    switch (complexity) {
      case Complexity.simple:
        return 'Simple';
      case Complexity.challenging:
        return 'Challenging';
      case Complexity.hard:
        return 'Hard';
      default:
        return 'Unknown';
    }
  }

  String get affordabilityText {
    switch (affordability) {
      case Affordability.affordable:
        return 'Affordable';
      case Affordability.pricy:
        return 'Pricey';
      case Affordability.luxurious:
        return 'Luxurious';
      default:
        return 'Unknown';
    }
  }

  @override
  Widget build(BuildContext context) {
    return Card(
      shape: const RoundedRectangleBorder(
        borderRadius: BorderRadius.only(
          topLeft: Radius.circular(15),
          topRight: Radius.circular(15),
        ),
      ),
      child: InkWell(
        onTap: () {
          Navigator.of(context)
              .pushNamed(
            CategoryMealDetail.categoryMealDetailRoute,
            arguments: id,
          )
              .then((value) {
            if (value != null) {
              removeCategory(value);
            }
          });
        },
        child: Column(
          children: [
            Stack(
              children: [
                ClipRRect(
                  borderRadius: const BorderRadius.only(
                    topLeft: Radius.circular(15),
                    topRight: Radius.circular(15),
                  ),
                  child: Image.network(imageUrl),
                ),
                Positioned(
                  bottom: 20,
                  right: 5,
                  width: 300,
                  child: Container(
                    padding: const EdgeInsets.all(15),
                    color: Colors.black54,
                    child: Text(
                      title,
                      overflow: TextOverflow.fade,
                      style: Theme.of(context).textTheme.bodyLarge,
                    ),
                  ),
                ),
              ],
            ),
            Padding(
              padding: const EdgeInsets.all(10.0),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceAround,
                children: [
                  Row(
                    children: [
                      const Icon(Icons.schedule),
                      const SizedBox(width: 6),
                      Text('$duration min'),
                    ],
                  ),
                  Row(
                    children: [
                      const Icon(Icons.work),
                      const SizedBox(width: 6),
                      Text(complexityText),
                    ],
                  ),
                  Row(
                    children: [
                      const Icon(Icons.attach_money),
                      const SizedBox(width: 6),
                      Text(affordabilityText),
                    ],
                  ),
                ],
              ),
            )
          ],
        ),
      ),
    );
  }
}
