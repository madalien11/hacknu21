import 'package:flutter/material.dart';

class Category extends StatelessWidget {
  final String title;
  final bool myCategories;
  final bool inProfile;
  final bool adder;
  final Function showDialog;
  Category({
    this.title,
    this.myCategories = false,
    this.inProfile = false,
    this.adder = false,
    this.showDialog,
  });
  @override
  Widget build(BuildContext context) {
    return Card(
      elevation: 0,
      color: myCategories ? Colors.amber : Colors.black38,
      child: Padding(
        padding: const EdgeInsets.all(5.0),
        child: adder
            ? FlatButton(
                onPressed: () {
                  showDialog(context);
                },
                child: Icon(
                  Icons.add,
                  size: 30,
                ),
              )
            : Stack(
                children: [
                  inProfile
                      ? Image.network(
                          'https://placeimg.com/640/640/any',
                          fit: BoxFit.fitHeight,
                        )
                      : Container(),
                  inProfile
                      ? Container(color: Colors.black.withOpacity(0.333))
                      : Container(),
                  Center(
                    child: Text(
                      title,
                      style: TextStyle(
                          color: myCategories ? Colors.black : Colors.white),
                    ),
                  ),
                ],
              ),
      ),
    );
  }
}
