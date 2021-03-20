import 'package:flutter/material.dart';

class TightProfile extends StatelessWidget {
  final String name;
  final int events;
  TightProfile({@required this.name, this.events = 0});
  @override
  Widget build(BuildContext context) {
    return Card(
      child: ListTile(
        onTap: () {},
        leading: CircleAvatar(
          backgroundImage: NetworkImage('https://picsum.photos/200/200'),
        ),
        title: Text(name),
        subtitle: Text('Events organized: $events'),
      ),
    );
  }
}
