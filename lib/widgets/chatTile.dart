import 'package:flutter/material.dart';
import 'package:hacknu21/screens/chatScreen.dart';

class ChatTile extends StatelessWidget {
  final String title;
  ChatTile(this.title);
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 10, vertical: 4),
      child: Card(
        child: ListTile(
          onTap: () {
            Navigator.pushNamed(context, ChatScreen.id);
          },
          leading: CircleAvatar(
            child: Icon(Icons.message_rounded, color: Colors.amber),
          ),
          title: Text(title),
          subtitle: Text("Last Message: Let's Go!"),
        ),
      ),
    );
  }
}
