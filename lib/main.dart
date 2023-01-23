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
        primarySwatch: Colors.indigo,
        accentColor: Colors.blueGrey,
        canvasColor: Color.fromRGBO(255, 254, 229, 1),
        fontFamily: 'Raleway',
      ),
      routes: {
        '/': (context) => TabsScreen(),
        CategoryItemScreen.routeName: (ctx) => CategoryItemScreen(),
        MealDetailScreen.routeName: (ctx) => MealDetailScreen(),
      },
      onGenerateRoute: (settings) =>
          MaterialPageRoute(builder: (ctx) => const CategoriesScreen()),
      onUnknownRoute: (setting) =>
          MaterialPageRoute(builder: (ctx) => const CategoriesScreen()),
    );
  }
}
