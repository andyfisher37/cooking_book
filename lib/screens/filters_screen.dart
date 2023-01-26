import 'dart:ui';

import 'package:cooking_book/widgets/main_drawer.dart';
import 'package:flutter/material.dart';

class FiltersScreen extends StatefulWidget {
  static const routeName = '/filters';
  final Function saveFilters;
  final Map<String, bool> currentFilters;

  FiltersScreen(this.currentFilters, this.saveFilters);

  @override
  State<FiltersScreen> createState() => _FiltersScreenState();
}

class _FiltersScreenState extends State<FiltersScreen> {
  bool _glutenFree = false;
  bool _vegeterian = false;
  bool _vegan = false;
  bool _lactoseFree = false;

  @override
  void initState() {
    _glutenFree = widget.currentFilters['gluten'] as bool;
    _vegeterian = widget.currentFilters['vegetarian'] as bool;
    _vegan = widget.currentFilters['vegan'] as bool;
    _lactoseFree = widget.currentFilters['lactose'] as bool;
    super.initState();
  }

  Widget _buildSwitchListTile(
    String title,
    bool curval,
    String subtitle,
    Function(bool) updateVal,
  ) {
    return SwitchListTile(
      title: Text(title),
      value: curval,
      subtitle: Text(subtitle),
      onChanged: updateVal,
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Filters'),
        actions: [
          IconButton(
              onPressed: () {
                final selectedFilters = {
                  'gluten': _glutenFree,
                  'lactose': _lactoseFree,
                  'vegan': _vegan,
                  'vegetarian': _vegeterian
                };
                widget.saveFilters(selectedFilters);
              },
              icon: Icon(Icons.save))
        ],
      ),
      drawer: MainDrawer(),
      body: Column(
        children: [
          Container(
            padding: const EdgeInsets.all(20),
            child: const Text(
              'Setup you filters for meal',
              style: TextStyle(fontSize: 20, fontWeight: FontWeight.w800),
            ),
          ),
          Expanded(
              child: ListView(
            children: [
              _buildSwitchListTile('Gluten-Free:', _glutenFree,
                  'Only include gluten-free meals.', (newVal) {
                setState(() {
                  _glutenFree = newVal;
                });
              }),
              const Divider(),
              _buildSwitchListTile(
                  'Vegetarian:', _vegeterian, 'Only include vegetarian meals.',
                  (newVal) {
                setState(() {
                  _vegeterian = newVal;
                });
              }),
              const Divider(),
              _buildSwitchListTile(
                  'Vegan:', _vegan, 'Only include vegan meals.', (newVal) {
                setState(() {
                  _vegan = newVal;
                });
              }),
              const Divider(),
              _buildSwitchListTile('Lactose-Free:', _lactoseFree,
                  'Only include lactose-free meals.', (newVal) {
                setState(() {
                  _lactoseFree = newVal;
                });
              }),
            ],
          ))
        ],
      ),
    );
  }
}
