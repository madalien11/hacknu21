import 'package:flutter/material.dart';

class TightProfile extends StatelessWidget {
  final String name;
  final int events;
  TightProfile({@required this.name, this.events = 0});
  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: () {},
      child: Card(
        child: ListTile(
          leading: CircleAvatar(
            backgroundImage: NetworkImage('https://picsum.photos/200/200'),
          ),
          title: Text(name),
          subtitle: Text('Events organized: $events'),
        ),
      ),
    );
  }
}
