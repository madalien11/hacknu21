import 'package:flutter/material.dart';
import 'package:hacknu21/screens/eventScreen.dart';
import 'categoriesListView.dart';

class EventCard extends StatelessWidget {
  final String title;
  final String subtitle;
  final bool isOnline;
  final int maxCapacity;
  final int currentCapacity;
  final List<String> categories;
  EventCard({
    @required this.title,
    @required this.subtitle,
    @required this.isOnline,
    @required this.maxCapacity,
    this.currentCapacity = 0,
    @required this.categories,
  });

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: InkWell(
        onTap: () {
          Navigator.pushNamed(context, EventScreen.id);
        },
        child: Card(
          child: Column(
            children: [
              Stack(
                children: [
                  Image.network(
                    'https://picsum.photos/400/300',
                    fit: BoxFit.fill,
                    height: 170,
                    width: double.infinity,
                  ),
                  Container(
                    height: 170,
                    width: double.infinity,
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.end,
                      mainAxisSize: MainAxisSize.max,
                      children: [
                        Padding(
                          padding: const EdgeInsets.all(8),
                          child: FittedBox(
                            fit: BoxFit.fitWidth,
                            child: Container(
                                color: Colors.black26,
                                padding: const EdgeInsets.all(2),
                                child: Text('$currentCapacity/$maxCapacity')),
                          ),
                        ),
                        Spacer(),
                        ConstrainedBox(
                          constraints: BoxConstraints(
                            minHeight: 34.0,
                            maxHeight: 36.0,
                          ),
                          child: CategoriesListView(
                              myCategories: false, categories: categories),
                        ),
                      ],
                    ),
                  ),
                ],
              ),
              Padding(
                padding:
                    const EdgeInsets.symmetric(vertical: 10, horizontal: 12),
                child: Column(
                  children: [
                    SizedBox(
                      width: double.infinity,
                      child: Stack(
                        children: [
                          Padding(
                            padding: const EdgeInsets.only(right: 33),
                            child: Text(
                              title,
                              style: TextStyle(
                                  fontSize: 20, fontWeight: FontWeight.w500),
                            ),
                          ),
                          Positioned(
                            right: 0,
                            child: Text(isOnline ? 'Online' : 'Offline',
                                style: TextStyle(
                                    fontSize: 14, color: Colors.amber)),
                          ),
                        ],
                      ),
                    ),
                    SizedBox(height: 10),
                    Text(subtitle),
                    // SizedBox(height: 10),
                    // Row(
                    //   children: [
                    //     Expanded(
                    //       flex: 10,
                    //       child: ConstrainedBox(
                    //         constraints: BoxConstraints(
                    //           minHeight: 34.0,
                    //           maxHeight: 36.0,
                    //         ),
                    //         child: ListView(
                    //           shrinkWrap: true,
                    //           scrollDirection: Axis.horizontal,
                    //           children:
                    //               categories.map((e) => Category(e)).toList(),
                    //         ),
                    //       ),
                    //     ),
                    //     Expanded(
                    //       flex: 2,
                    //       child: Padding(
                    //         padding: const EdgeInsets.only(left: 10),
                    //         child: FittedBox(
                    //           fit: BoxFit.fitWidth,
                    //           child: Text('$currentCapacity/$maxCapacity'),
                    //         ),
                    //       ),
                    //     )
                    //   ],
                    // ),
                  ],
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
