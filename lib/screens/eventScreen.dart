import 'package:flutter/material.dart';
import 'package:hacknu21/models/EventModel.dart';
import 'package:hacknu21/screens/chatScreen.dart';
import 'package:hacknu21/widgets/tightProfile.dart';

class EventScreen extends StatelessWidget {
  static const String id = 'eventScreen';

  void _showDialog(context) {
    showDialog(
        context: context,
        builder: (_) => AlertDialog(
              title: Text("Some Long Title"),
              content: Text("Do you want to join to the chat?"),
              actions: <Widget>[
                RaisedButton(
                  color: Colors.amber,
                  child: Text('Close'),
                  onPressed: () {
                    Navigator.of(context).pop();
                  },
                ),
                RaisedButton(
                  color: Colors.greenAccent,
                  child: Text('Join'),
                  onPressed: () {
                    Navigator.of(context).pop();
                    Navigator.pushNamed(context, ChatScreen.id);
                  },
                ),
              ],
            ));
  }

  @override
  Widget build(BuildContext context) {
    final Map args = ModalRoute.of(context).settings.arguments;
    final Event event = args['event'];
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
                  event.title,
                  style: TextStyle(fontSize: 28, fontWeight: FontWeight.w500),
                ),
                SizedBox(height: 20),
                Text(
                  event.description,
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
                  'Place: ${event.place}',
                  style: TextStyle(fontSize: 16),
                ),
                SizedBox(height: 20),
                Text(
                  'Time: ${event.dateStart}',
                  style: TextStyle(fontSize: 16),
                ),
                SizedBox(height: 20),
                Center(
                  child: RaisedButton(
                    color: Colors.amber,
                    onPressed: () {
                      _showDialog(context);
                    },
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
