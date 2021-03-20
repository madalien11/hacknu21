import 'package:flutter/material.dart';
import 'package:hacknu21/widgets/chatTile.dart';

List<String> chatTitles = <String>[
  'Mountain Chat',
  'Nature Chat',
  'Cinema Chat',
  'Hiking Chat',
  'Tourism Chat',
  'Sport Chat',
  'Football Chat',
  'Music Chat',
  'Programming Chat',
  'Start-up Chat',
  'Astronomy Chat',
  'Theatre Chat',
];

class ChatsListScreen extends StatelessWidget {
  static const String id = 'chatsListScreen';
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: Text('Chats'),
        ),
        body: ListView(
          children: chatTitles.map((e) => ChatTile(e)).toList(),
        ));
  }
}
