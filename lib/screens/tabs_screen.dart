import './categories_screen.dart';
import './favorites_screen.dart';
import 'package:flutter/material.dart';

class TabsScreen extends StatefulWidget {
  const TabsScreen({super.key});

  @override
  State<TabsScreen> createState() => _TabsScreenState();
}

class _TabsScreenState extends State<TabsScreen> {
  @override
  Widget build(BuildContext context) {
    return DefaultTabController(
      length: 2,
      child: Scaffold(
        appBar: AppBar(
          title: Text('Coocking book'),
          bottom: TabBar(
            tabs: [
              Tab(icon: Icon(Icons.category_rounded), text: 'Categories'),
              Tab(icon: Icon(Icons.star_border_rounded), text: 'Favorites'),
            ],
          ),
        ),
        body: TabBarView(
          children: [CategoriesScreen(), FavoritesScreen()],
        ),
      ),
    );
  }
}
