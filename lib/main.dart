import 'package:cooking_book/screens/filters_screen.dart';
import 'package:flutter/material.dart';

import 'screens/categories_screen.dart';
import 'screens/category_item_screen.dart';
import 'screens/meal_detail_screen.dart';
import 'screens/tabs_screen.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Coocking Book!',
      theme: ThemeData(
        canvasColor: const Color.fromRGBO(255, 254, 229, 1),
        fontFamily: 'Raleway',
        colorScheme: ColorScheme.fromSwatch(primarySwatch: Colors.indigo)
            .copyWith(secondary: Colors.blueGrey),
      ),
      routes: {
        '/': (context) => const TabsScreen(),
        CategoryItemScreen.routeName: (ctx) => CategoryItemScreen(),
        MealDetailScreen.routeName: (ctx) => MealDetailScreen(),
        FiltersScreen.routeName: (ctx) => FiltersScreen(),
      },
      onGenerateRoute: (settings) =>
          MaterialPageRoute(builder: (ctx) => const CategoriesScreen()),
      onUnknownRoute: (setting) =>
          MaterialPageRoute(builder: (ctx) => const CategoriesScreen()),
    );
  }
}
