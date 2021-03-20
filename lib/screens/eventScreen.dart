import 'package:flutter/material.dart';
import 'package:hacknu21/widgets/tightProfile.dart';

class EventScreen extends StatelessWidget {
  static const String id = 'eventScreen';
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Event Screen'),
      ),
      body: ListView(
        children: [
          Image.network(
            'https://picsum.photos/400/300',
            height: 250,
            width: double.infinity,
            fit: BoxFit.fill,
          ),
          Padding(
            padding: const EdgeInsets.all(10),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.start,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  'Some Long Title',
                  style: TextStyle(fontSize: 28, fontWeight: FontWeight.w500),
                ),
                SizedBox(height: 20),
                Text(
                  'Lorem ipsum dolor sit amet, consectetur adipiscing elit, sed do eiusmod tempor incididunt ut labore et dolore magna aliqua. Ut enim ad minim veniam, quis nostrud exercitation ullamco laboris nisi ut aliquip ex ea commodo consequat. Duis aute irure dolor in reprehenderit in voluptate velit esse cillum dolore eu fugiat nulla pariatur. Excepteur sint occaecat cupidatat non proident, sunt in culpa qui officia deserunt mollit anim id est laborum.\n\nLorem ipsum dolor sit amet, consectetur adipiscing elit, sed do eiusmod tempor incididunt ut labore et dolore magna aliqua. Ut enim ad minim veniam, quis nostrud exercitation ullamco laboris nisi ut aliquip ex ea commodo consequat. Duis aute irure dolor in reprehenderit in voluptate velit esse cillum dolore eu fugiat nulla pariatur. Excepteur sint occaecat cupidatat non proident, sunt in culpa qui officia deserunt mollit anim id est laborum.',
                ),
                SizedBox(height: 20),
                Text(
                  'Organizer(s):',
                  style: TextStyle(fontSize: 16),
                ),
                SizedBox(height: 10),
                Column(
                  children: [
                    TightProfile(name: 'Karsybekov Madi', events: 1),
                    TightProfile(name: 'Orazbek Islam'),
                    TightProfile(name: 'Sagynbek Bekzat'),
                  ],
                ),
                SizedBox(height: 20),
                Text(
                  'Place: Abay Gagarin 20/2',
                  style: TextStyle(fontSize: 16),
                ),
                SizedBox(height: 20),
                Text(
                  'Time: 20:30, Sat, March 20, 2021',
                  style: TextStyle(fontSize: 16),
                ),
                SizedBox(height: 20),
                Center(
                  child: RaisedButton(
                    color: Colors.amber,
                    onPressed: () {},
                    child: Text(
                      'JOIN US',
                      style: TextStyle(color: Colors.black),
                    ),
                  ),
                )
              ],
            ),
          )
        ],
      ),
    );
  }
}
