import 'package:flutter/material.dart';
import 'package:hacknu21/widgets/category.dart';

Map<String, bool> additionalCategories = {
  'Category 1': false,
  'Category 2': false,
  'Category 3': false,
  'Category 4': false,
  'Category 5': false,
  'Category 6': false,
  'Category 7': false,
  'Category 8': false,
  'Category 9': false,
  'Category 10': false,
};

List<String> myCategories = <String>[
  'Hiking',
  'Sport',
  'Books',
  'Movies',
  'Music',
];

List<Widget> myCategoriesW = <Widget>[];

class ProfileScreen extends StatefulWidget {
  @override
  _ProfileScreenState createState() => _ProfileScreenState();
}

class _ProfileScreenState extends State<ProfileScreen> {
  List<Widget> checkboxCreator(setState) {
    List<Widget> result = <Widget>[];
    additionalCategories.forEach((key, val) {
      result.add(CheckboxListTile(
        value: val,
        onChanged: (value) {
          setState(() {
            val = value;
            additionalCategories[key] = value;
          });
        },
        title: Text(key),
      ));
    });
    return result;
  }

  void _showDialog(context) {
    showDialog(
        context: context,
        builder: (_) => StatefulBuilder(
              builder: (context, setStates) {
                return AlertDialog(
                  title: Text("Select new categories you are interested in"),
                  content: ListView(
                    shrinkWrap: true,
                    children: checkboxCreator(setStates),
                  ),
                  actions: <Widget>[
                    RaisedButton(
                      color: Colors.amber,
                      child: Text('Close'),
                      onPressed: () {
                        additionalCategories.forEach(
                            (key, value) => additionalCategories[key] = false);
                        Navigator.of(context).pop();
                      },
                    ),
                    RaisedButton(
                      color: Colors.greenAccent,
                      child: Text('Add'),
                      onPressed: () {
                        setState(() {
                          additionalCategories.forEach((key, value) {
                            // if (value)
                            //   myCategoriesW
                            //       .add(Category(title: key, inProfile: true));
                            additionalCategories[key] = false;
                          });
                        });
                        Navigator.of(context).pop();
                      },
                    ),
                  ],
                );
              },
            ));
  }

  @override
  void initState() {
    super.initState();
    myCategoriesW.add(Category(adder: true, showDialog: _showDialog));
    myCategories.forEach((element) {
      myCategoriesW.add(
        Category(title: element, inProfile: true),
      );
    });
    additionalCategories
        .forEach((key, value) => additionalCategories[key] = false);
  }

  @override
  Widget build(BuildContext context) {
    return ListView(
      children: [
        Column(
          crossAxisAlignment: CrossAxisAlignment.stretch,
          mainAxisAlignment: MainAxisAlignment.start,
          children: [
            SizedBox(height: 20),
            CircleAvatar(
              child: Icon(Icons.account_circle_rounded, size: 110),
              radius: 60,
            ),
            SizedBox(height: 10),
            Text(
              'Madi Karsybekov',
              textAlign: TextAlign.center,
              style: TextStyle(fontSize: 30, fontWeight: FontWeight.w500),
            ),
            SizedBox(height: 6),
            Text('madalien11', textAlign: TextAlign.center),
            SizedBox(height: 10),
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 10),
              child: Text(
                  'Lorem ipsum dolor sit amet, consectetur adipiscing elit, sed do eiusmod tempor incididunt ut labore et dolore magna aliqua. Ut enim ad minim veniam, quis nostrud exercitation ullamco laboris nisi ut aliquip ex ea commodo consequat. Duis aute irure dolor in reprehenderit in voluptate velit esse cillum dolore eu fugiat nulla pariatur. Excepteur sint occaecat cupidatat non proident, sunt in culpa qui officia deserunt mollit anim id est laborum.',
                  textAlign: TextAlign.justify),
            ),
            SizedBox(height: 20),
            Padding(
              padding: const EdgeInsets.only(left: 10),
              child: Text(
                'My Interests:',
                textAlign: TextAlign.left,
                style: TextStyle(fontSize: 18, fontWeight: FontWeight.w500),
              ),
            ),
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: GridView.count(
                primary: false,
                shrinkWrap: true,
                crossAxisCount: 3,
                children: myCategoriesW,
              ),
            ),
            SizedBox(height: 20),
          ],
        )
      ],
    );
  }
}
