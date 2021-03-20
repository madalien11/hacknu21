import 'package:flutter/material.dart';
import 'package:hacknu21/models/EventModel.dart';
import 'package:hacknu21/screens/eventScreen.dart';
import 'categoriesListView.dart';

class EventCard extends StatelessWidget {
  final Event event;
  EventCard({@required this.event});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: InkWell(
        onTap: () {
          Navigator.pushNamed(context, EventScreen.id,
              arguments: {"event": event});
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
                                child: Text(
                                    '${event.visitorsID != null ? event.visitorsID.length : 0}/${event.maxVisit}')),
                          ),
                        ),
                        Spacer(),
                        ConstrainedBox(
                          constraints: BoxConstraints(
                            minHeight: 34.0,
                            maxHeight: 36.0,
                          ),
                          child: CategoriesListView(
                              myCategories: false,
                              categories: event.categories),
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
                              event.title,
                              style: TextStyle(
                                  fontSize: 20, fontWeight: FontWeight.w500),
                            ),
                          ),
                          Positioned(
                            right: 0,
                            child: Text(event.online ? 'Online' : 'Offline',
                                style: TextStyle(
                                    fontSize: 14, color: Colors.amber)),
                          ),
                        ],
                      ),
                    ),
                    SizedBox(height: 10),
                    Text(event.subtitle),
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
