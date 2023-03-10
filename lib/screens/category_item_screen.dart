import 'package:cooking_book/widgets/meal_item.dart';
import 'package:flutter/material.dart';

import '../models/meal.dart';

class CategoryItemScreen extends StatefulWidget {
  static const routeName = '/categories_item';
  final List<Meal> availableMeals;

  const CategoryItemScreen(this.availableMeals, {super.key});

  @override
  State<CategoryItemScreen> createState() => _CategoryItemScreenState();
}

class _CategoryItemScreenState extends State<CategoryItemScreen> {
  late String? catTitle;
  late List<Meal> displayedMeals;
  var _loadedInitData = false;

  @override
  void didChangeDependencies() {
    if (!_loadedInitData) {
      final routeArgs =
          ModalRoute.of(context)!.settings.arguments as Map<String, String>;
      final catId = routeArgs['id'];
      catTitle = routeArgs['title'];
      displayedMeals = widget.availableMeals.where((element) {
        return element.categories.contains(catId);
      }).toList();
      _loadedInitData = true;
    }
    super.didChangeDependencies();
  }

  // ignore: unused_element
  void _removeMeal(String mealId) {
    setState(() {
      displayedMeals.removeWhere((meal) => meal.id == mealId);
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(catTitle.toString()),
      ),
      body: ListView.builder(
        itemBuilder: ((ctx, index) {
          return MealItem(
            id: displayedMeals[index].id,
            title: displayedMeals[index].title,
            imageUrl: displayedMeals[index].imageUrl,
            duration: displayedMeals[index].duration,
            complexity: displayedMeals[index].complexity,
            affordability: displayedMeals[index].affordability,
          );
        }),
        itemCount: displayedMeals.length,
      ),
    );
  }
}
