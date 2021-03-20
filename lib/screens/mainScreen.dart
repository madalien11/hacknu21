import 'package:flutter/material.dart';
import 'package:hacknu21/widgets/Category.dart';
import 'package:hacknu21/widgets/categoriesListView.dart';
import 'package:hacknu21/widgets/eventCard.dart';

class MainScreen extends StatelessWidget {
  static const String id = 'mainScreen';
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      drawer: Drawer(
        child: ListView(
          children: [
            Container(
              color: Colors.amber,
              height: 100,
              child: Align(
                alignment: Alignment.centerLeft,
                child: Padding(
                  padding:
                      const EdgeInsets.symmetric(vertical: 10, horizontal: 30),
                  child: Text(
                    'Join Us',
                    style: TextStyle(
                        fontSize: 50,
                        fontWeight: FontWeight.w500,
                        fontStyle: FontStyle.italic),
                  ),
                ),
              ),
            ),
            SizedBox(height: 10),
            ListTile(
              leading: CircleAvatar(child: Icon(Icons.account_circle_rounded)),
              title: Text('Madi Karsybekov', style: TextStyle(fontSize: 18)),
            ),
            SizedBox(height: 10),
            ListTile(
              leading: CircleAvatar(child: Icon(Icons.ac_unit_rounded)),
              title: Text('Some random screen', style: TextStyle(fontSize: 18)),
            ),
            SizedBox(height: 10),
            ListTile(
              leading: CircleAvatar(child: Icon(Icons.description)),
              title:
                  Text('Terms and Conditions', style: TextStyle(fontSize: 18)),
            ),
            SizedBox(height: 10),
            ListTile(
              leading: CircleAvatar(child: Icon(Icons.apps)),
              title: Text('About us', style: TextStyle(fontSize: 18)),
            ),
          ],
        ),
      ),
      appBar: AppBar(
        title: Text('Main Screen'),
      ),
      body: ListView(
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
      ),
    );
  }
}
