import 'package:flutter/material.dart';
import 'package:hacknu21/screens/addEventScreen.dart';
import 'package:hacknu21/screens/mainScreen.dart';
import 'package:hacknu21/screens/profileScreen.dart';

class BottomNavBar extends StatefulWidget {
  @override
  _BottomNavBarState createState() => _BottomNavBarState();
}

class _BottomNavBarState extends State<BottomNavBar> {
  int _selectedIndex = 0;

  void _onItemTapped(int index) {
    setState(() {
      _selectedIndex = index;
    });
  }

  static List<Widget> _widgetOptions = <Widget>[
    MainScreen(),
    AddEventScreen(),
    ProfileScreen(),
  ];

  static List<String> _titleOptions = <String>[
    'Main Screen',
    'Add an event',
    'Profile',
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      bottomNavigationBar: BottomNavigationBar(
        items: const <BottomNavigationBarItem>[
          BottomNavigationBarItem(
            icon: Icon(Icons.home),
            label: 'Main',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.add_circle_outlined),
            label: 'Add Event',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.person),
            label: 'Profile',
          ),
        ],
        currentIndex: _selectedIndex,
        selectedItemColor: Colors.amber,
        onTap: _onItemTapped,
      ),
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
              title: Text('Madi Karsybekov', style: TextStyle(fontSize: 16)),
            ),
            SizedBox(height: 10),
            ListTile(
              leading: CircleAvatar(child: Icon(Icons.ac_unit_rounded)),
              title: Text('Some random screen', style: TextStyle(fontSize: 16)),
            ),
            SizedBox(height: 10),
            ListTile(
              leading: CircleAvatar(child: Icon(Icons.description)),
              title:
                  Text('Terms and Conditions', style: TextStyle(fontSize: 16)),
            ),
            SizedBox(height: 10),
            ListTile(
              leading: CircleAvatar(child: Icon(Icons.apps)),
              title: Text('About us', style: TextStyle(fontSize: 16)),
            ),
          ],
        ),
      ),
      appBar: AppBar(
        title: Text(_titleOptions.elementAt(_selectedIndex)),
      ),
      body: _widgetOptions.elementAt(_selectedIndex),
    );
  }
}
