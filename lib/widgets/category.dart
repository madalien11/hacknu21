import 'package:flutter/material.dart';

class Category extends StatelessWidget {
  final String title;
  final bool myCategories;
  Category({this.title, this.myCategories = false});
  @override
  Widget build(BuildContext context) {
    return Card(
      elevation: 0,
      color: myCategories ? Colors.amber : Colors.black38,
      child: Padding(
        padding: const EdgeInsets.all(5.0),
        child: Center(
            child: Text(
          title,
          style: TextStyle(color: myCategories ? Colors.black : Colors.white),
        )),
      ),
    );
  }
}
