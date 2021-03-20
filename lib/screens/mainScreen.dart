import 'package:flutter/material.dart';
import 'package:hacknu21/widgets/categoriesListView.dart';
import 'package:hacknu21/widgets/eventCard.dart';

class MainScreen extends StatefulWidget {
  static const String id = 'mainScreen';

  @override
  _MainScreenState createState() => _MainScreenState();
}

class _MainScreenState extends State<MainScreen> {
  @override
  Widget build(BuildContext context) {
    return ListView(
      children: [
        SizedBox(height: 8),
        SizedBox(
          height: 35,
          child: CategoriesListView(myCategories: true),
        ),
        EventCard(
          title: 'First Event',
          subtitle:
              'Lorem ipsum dolor sit amet, consectetur adipiscing elit, sed do eiusmod tempor incididunt ut labore et dolore magna aliqua. Ut enim ad minim veniam, quis nostrud',
          isOnline: true,
          maxCapacity: 35,
          currentCapacity: 13,
          categories: [
            'Hiking',
            'Tourism',
            'Mountains',
            'Health',
            'Nature',
            'Active Life',
          ],
        ),
        EventCard(
          title: 'Second Event',
          subtitle:
              'Lorem ipsum dolor sit amet, consectetur adipiscing elit, sed do eiusmod tempor incididunt ut labore et dolore magna aliqua. Ut enim ad minim veniam, quis nostrud',
          isOnline: false,
          maxCapacity: 100,
          categories: ['Cinema'],
        ),
        EventCard(
          title: 'Third Event',
          subtitle:
              'Lorem ipsum dolor sit amet, consectetur adipiscing elit, sed do eiusmod tempor incididunt ut labore et dolore magna aliqua. Ut enim ad minim veniam, quis nostrud',
          isOnline: false,
          maxCapacity: 120,
          categories: ['Category 1', 'Category 2', 'Category 3'],
        ),
        EventCard(
          title: 'Fourth Event',
          subtitle:
              'Lorem ipsum dolor sit amet, consectetur adipiscing elit, sed do eiusmod tempor incididunt ut labore et dolore magna aliqua. Ut enim ad minim veniam, quis nostrud',
          isOnline: true,
          maxCapacity: 10,
          categories: ['Category 1', 'Category 2'],
        ),
      ],
    );
  }
}
