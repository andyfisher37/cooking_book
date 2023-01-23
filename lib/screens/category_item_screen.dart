import 'package:cooking_book/widgets/meal_item.dart';
import 'package:flutter/material.dart';

import '../dummy_data.dart';

class CategoryItemScreen extends StatelessWidget {
  static const nameRoute = '/categories_item';
  // final String categoryId;
  // final String categoryTitle;

  // CategoryItemScreen(this.categoryId, this.categoryTitle);

  @override
  Widget build(BuildContext context) {
    final routeArgs =
        ModalRoute.of(context)!.settings.arguments as Map<String, String>;
    final catId = routeArgs['id'];
    final catTitle = routeArgs['title'];
    final categoryMeals = DUMMY_MEALS.where((element) {
      return element.categories.contains(catId);
    }).toList();

    return Scaffold(
        appBar: AppBar(
          title: Text(catTitle.toString()),
        ),
        body: ListView.builder(
          itemBuilder: ((ctx, index) {
            return MealItem(
                title: categoryMeals[index].title,
                imageUrl: categoryMeals[index].imageUrl,
                duration: categoryMeals[index].duration,
                complexity: categoryMeals[index].complexity,
                affordability: categoryMeals[index].affordability);
          }),
          itemCount: categoryMeals.length,
        ));
  }
}
