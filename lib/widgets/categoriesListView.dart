import 'package:flutter/material.dart';

import 'Category.dart';

const List<String> myCategoriesList = [
  'General',
  'Hiking',
  'Cinema',
  'Concerts',
  'Karaoke',
  'Nature',
  'Night Club',
  'Drawing',
];

class CategoriesListView extends StatelessWidget {
  final bool myCategories;
  final List categories;
  CategoriesListView(
      {this.myCategories = false, this.categories = myCategoriesList});
  @override
  Widget build(BuildContext context) {
    return ListView(
      scrollDirection: Axis.horizontal,
      children: categories
          .map((e) => Category(title: e, myCategories: myCategories))
          .toList(),
    );
  }
}
