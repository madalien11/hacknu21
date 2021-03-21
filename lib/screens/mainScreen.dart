import 'package:flutter/material.dart';
import 'package:hacknu21/models/EventModel.dart';
import 'package:hacknu21/widgets/categoriesListView.dart';
import 'package:hacknu21/widgets/eventCard.dart';

List<Event> events = <Event>[
  Event(
    title: 'Watching the Snyder Cut together',
    subtitle:
        "Zack Snyder's Justice League, often referred to as the 'Snyder Cut,' is the 2021 director's cut of the 2017 American superhero film Justice League.",
    description:
        "Zack Snyder's Justice League, often referred to as the 'Snyder Cut,' is the 2021 director's cut of the 2017 American superhero film Justice League. Let's watch it together, and then we can discuss it. We will also compare it to the first version, and see if it was very better. Join our group here!",
    online: true,
    maxVisit: 20,
    visitorsID: [1, 2, 3, 4, 5, 6, 7, 8, 9, 10, 11],
    rules: 'No explicit language',
    dateStart: '25 March, 2021, 18:00',
    // place: 'Dostyk Plaza, Almaty',
    categories: [
      'Movies',
      'Art',
      'Cinematography',
      'Comics',
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
