import 'package:cooking_book/screens/category_item_screen.dart';
import 'package:flutter/material.dart';

class CategoryItem extends StatelessWidget {
  final String id;
  final String title;
  final Color color;

  const CategoryItem(this.id, this.title, this.color, {super.key});

  void selectCategory(BuildContext ctx) {
    Navigator.of(ctx).pushNamed(
      CategoryItemScreen.routeName,
      arguments: {'id': id, 'title': title},
    );
  }

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: () => selectCategory(context),
      splashColor: Theme.of(context).backgroundColor,
      child: Container(
        padding: const EdgeInsets.all(15),
        decoration: BoxDecoration(
            boxShadow: const <BoxShadow>[
              BoxShadow(
                color: Color.fromARGB(204, 122, 122, 122),
                offset: Offset(0, 2),
                blurRadius: 4,
              ),
              BoxShadow(
                color: Color.fromARGB(128, 61, 61, 61),
                offset: Offset(0, 6),
                blurRadius: 20,
              ),
            ],
            gradient: LinearGradient(
                colors: [color.withOpacity(0.7), color],
                begin: Alignment.bottomCenter,
                end: Alignment.topCenter),
            borderRadius: BorderRadius.circular(15)),
        child: Text(
          title,
          style: Theme.of(context).textTheme.headline6,
        ),
      ),
    );
  }
}
