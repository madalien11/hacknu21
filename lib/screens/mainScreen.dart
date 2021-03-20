import 'package:flutter/material.dart';
import 'package:hacknu21/models/EventModel.dart';
import 'package:hacknu21/widgets/categoriesListView.dart';
import 'package:hacknu21/widgets/eventCard.dart';

List<Event> events = <Event>[
  Event(
    title: 'First Event',
    subtitle:
        'Lorem ipsum dolor sit amet, consectetur adipiscing elit, sed do eiusmod tempor incididunt ut labore et dolore magna aliqua. Ut enim ad minim veniam, quis nostrud',
    description:
        'Lorem ipsum dolor sit amet, consectetur adipiscing elit, sed do eiusmod tempor incididunt ut labore et dolore magna aliqua. Ut enim ad minim veniam, quis nostrud exercitation ullamco laboris nisi ut aliquip ex ea commodo consequat. Duis aute irure dolor in reprehenderit in voluptate velit esse cillum dolore eu fugiat nulla pariatur. Excepteur sint occaecat cupidatat non proident, sunt in culpa qui officia deserunt mollit anim id est laborum.\n\n    Lorem ipsum dolor sit amet, consectetur adipiscing elit, sed do eiusmod tempor incididunt ut labore et dolore magna aliqua. Ut enim ad minim veniam, quis nostrud exercitation ullamco laboris nisi ut aliquip ex ea commodo consequat. Duis aute irure dolor in reprehenderit in voluptate velit esse cillum dolore eu fugiat nulla pariatur. Excepteur sint occaecat cupidatat non proident, sunt in culpa qui officia deserunt mollit anim id est laborum.',
    online: true,
    maxVisit: 35,
    visitorsID: [1, 2, 3, 4, 5],
    rules: '',
    dateStart: '31 March, 2021, 18:00',
    place: 'Dostyk Plaza, Almaty',
    categories: [
      'Hiking',
      'Tourism',
      'Mountains',
      'Health',
      'Nature',
      'Active Life',
    ],
  ),
  Event(
    title: 'Second Event',
    subtitle:
        'Lorem ipsum dolor sit amet, consectetur adipiscing elit, sed do eiusmod tempor incididunt ut labore et dolore magna aliqua. Ut enim ad minim veniam, quis nostrud',
    online: false,
    maxVisit: 100,
    categories: ['Cinema'],
  ),
  Event(
    title: 'Third Event',
    subtitle:
        'Lorem ipsum dolor sit amet, consectetur adipiscing elit, sed do eiusmod tempor incididunt ut labore et dolore magna aliqua. Ut enim ad minim veniam, quis nostrud',
    online: false,
    maxVisit: 120,
    categories: ['Category 1', 'Category 2', 'Category 3'],
  ),
  Event(
    title: 'Fourth Event',
    subtitle:
        'Lorem ipsum dolor sit amet, consectetur adipiscing elit, sed do eiusmod tempor incididunt ut labore et dolore magna aliqua. Ut enim ad minim veniam, quis nostrud',
    visitorsID: [1, 2, 3, 4, 5, 6, 7, 8],
    online: true,
    maxVisit: 10,
    categories: ['Category 1', 'Category 2'],
  ),
];

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
        Column(children: events.map((e) => EventCard(event: e)).toList())
      ],
    );
  }
}
