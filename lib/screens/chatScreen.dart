import 'dart:io';
import 'package:flutter/material.dart';
import 'package:image_picker/image_picker.dart';

List<MessageBubble> messageBubbles = <MessageBubble>[
  MessageBubble(
      text: 'Damm, it\'s 4!!! hours long. WTFF',
      sender: 'Shane Long',
      isMe: false),
  MessageBubble(
      text:
          "C'mon it, it'll be interesting af. Just calm down, drink some water, and let's watch it",
      sender: 'Danny Drinkwater',
      isMe: false),
  MessageBubble(
      text: "Yo guys, pls don't make this chat too messy",
      sender: 'Lionel Messi',
      isMe: false),
];

class ChatScreen extends StatefulWidget {
  static const String id = 'chatScreen';

  @override
  _ChatScreenState createState() => _ChatScreenState();
}

class _ChatScreenState extends State<ChatScreen> {
  final messageTextController = TextEditingController();
  String messageText;
  PickedFile _imageFile;
  String _retrieveDataError;
  bool _isButtonDisabled = false;
  File _image;
  final imagePicker = ImagePicker();
  String imagePath;

  Future getImageCamera(BuildContext context) async {
    final pickedFile = await imagePicker.getImage(source: ImageSource.camera);

    setState(() {
      imagePath = pickedFile.path;
      _image = File(pickedFile.path);
    });
    Navigator.of(context).pop();
  }

  Future getImageGallery(BuildContext context) async {
    final pickedFile = await imagePicker.getImage(source: ImageSource.gallery);

    setState(() {
      imagePath = pickedFile.path;
      _image = File(pickedFile.path);
    });
    Navigator.of(context).pop();
  }

  Future<void> _showChoiceDialog(BuildContext context, bool isMessage) {
    return showDialog(
        context: context,
        builder: (BuildContext context) {
          return AlertDialog(
            title: Text('Choose:'),
            content: SingleChildScrollView(
              child: ListBody(
                children: <Widget>[
                  RaisedButton(
                    color: Colors.amber,
                    child: Text(
                      'Gallery',
                      style: TextStyle(color: Colors.black),
                    ),
                    onPressed: _isButtonDisabled
                        ? () => print('Gallery')
                        : () async {
                            setState(() {
                              _isButtonDisabled = true;
                            });
                            try {
                              await getImageGallery(context);
                            } catch (e) {
                              print(e);
                            } finally {
                              setState(() {
                                _isButtonDisabled = false;
                              });
                            }
                          },
                  ),
                  SizedBox(height: 2),
                  RaisedButton(
                    color: Colors.amber,
                    child: Text(
                      'Camera',
                      style: TextStyle(color: Colors.black),
                    ),
                    onPressed: _isButtonDisabled
                        ? () => print('Camera')
                        : () async {
                            setState(() {
                              _isButtonDisabled = true;
                            });
                            try {
                              await getImageCamera(context);
                            } catch (e) {
                              print(e);
                            } finally {
                              setState(() {
                                _isButtonDisabled = false;
                              });
                            }
                          },
                  )
                ],
              ),
            ),
          );
        });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      resizeToAvoidBottomPadding: true,
      appBar: AppBar(
        leading: null,
        title: Text('Chat'),
        backgroundColor: Colors.amber,
        actions: [
          IconButton(
              icon: Icon(
                Icons.add,
                color: Colors.white,
              ),
              onPressed: () {
                _showChoiceDialog(context, false);
              })
        ],
      ),
      body: SafeArea(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: <Widget>[
            MessagesStream(),
            Container(
              decoration: BoxDecoration(
                border: Border(
                  top: BorderSide(color: Colors.amber, width: 2.0),
                ),
              ),
              child: Row(
                crossAxisAlignment: CrossAxisAlignment.center,
                children: <Widget>[
                  IconButton(
                    icon: Icon(Icons.attach_file_rounded, color: Colors.amber),
                    onPressed: () {
                      _showChoiceDialog(context, true);
                    },
                  ),
                  Expanded(
                    child: TextField(
                      controller: messageTextController,
                      onChanged: (value) {
                        messageText = value;
                      },
                      decoration: InputDecoration(
                        contentPadding: EdgeInsets.symmetric(
                            vertical: 10.0, horizontal: 20.0),
                        hintText: 'Type your message here...',
                        border: InputBorder.none,
                      ),
                    ),
                  ),
                  FlatButton(
                    onPressed: () {
                      // print('IMAGE PATH: ' + imagePath);
                      print("THE SELECTED IMAGE: $_image");
                      setState(() {
                        messageBubbles.add(
                            // 0,
                            MessageBubble(
                                isImage: _image != null,
                                image: _image,
                                text: messageTextController.text,
                                sender: 'Madi Karsybekov',
                                isMe: true));
                        _image = null;
                      });
                      messageTextController.clear();
                      //Implement send functionality.
                    },
                    child: Text(
                      'Send',
                      style: TextStyle(
                        color: Colors.amber,
                        fontWeight: FontWeight.bold,
                        fontSize: 18.0,
                      ),
                    ),
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}

class MessagesStream extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Expanded(
      child: ListView(
        // reverse: true,
        padding: EdgeInsets.symmetric(horizontal: 10.0, vertical: 20.0),
        children: messageBubbles,
      ),
    );
  }
}

// class MessagesStream extends StatelessWidget {
//   @override
//   Widget build(BuildContext context) {
//     return StreamBuilder(
//       // stream: _fireStore
//       //     .collection('messages')
//       //     .orderBy('time', descending: true)
//       //     .snapshots(),
//       builder: (context, snapshot) {
//         if (!snapshot.hasData) {
//           return Center(
//             child: CircularProgressIndicator(
//               backgroundColor: Colors.amber,
//             ),
//           );
//         }
//         final messages = snapshot.data.documents;
//         List<MessageBubble> messageBubbles = [];
//         for (var message in messages) {
//           final messageText = message.data['text'];
//           final messageSender = message.data['sender'];
//           final messageBubble = MessageBubble(
//             sender: messageSender,
//             text: messageText,
//             isMe: false,
//           );
//           messageBubbles.add(messageBubble);
//         }
//         return Expanded(
//           child: ListView(
//             reverse: true,
//             padding: EdgeInsets.symmetric(horizontal: 10.0, vertical: 20.0),
//             children: messageBubbles,
//           ),
//         );
//       },
//     );
//   }
// }

class MessageBubble extends StatelessWidget {
  final String text;
  final String sender;
  final bool isMe;
  final bool isImage;
  final File image;

  MessageBubble(
      {@required this.text,
      @required this.sender,
      @required this.isMe,
      this.isImage = false,
      this.image});
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.all(10),
      child: Column(
        crossAxisAlignment:
            isMe ? CrossAxisAlignment.end : CrossAxisAlignment.start,
        children: <Widget>[
          Text(
            sender,
            style: TextStyle(fontSize: 12.0, color: Colors.white),
          ),
          Material(
            elevation: 5.0,
            borderRadius: BorderRadius.only(
              topLeft: Radius.circular(isMe ? 30 : 0),
              topRight: Radius.circular(isMe ? 0 : 30),
              bottomLeft: Radius.circular(30),
              bottomRight: Radius.circular(30),
            ),
            color: isMe ? Colors.amber : Colors.white,
            child: Padding(
              padding: EdgeInsets.symmetric(vertical: 10, horizontal: 20),
              child: isImage
                  ? Image.file(
                      image,
                      width: 100,
                      height: 100,
                      fit: BoxFit.cover,
                    )
                  : Text(
                      text,
                      style: TextStyle(
                          color: isMe ? Colors.white : Colors.black54,
                          fontSize: 15.0),
                    ),
            ),
          )
        ],
      ),
    );
  }
}
