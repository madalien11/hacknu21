import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'screens/changePasswordScreen.dart';
import 'screens/chatScreen.dart';
import 'screens/eventScreen.dart';
import 'widgets/bottomNavBar.dart';
import 'screens/chatsListScreen.dart';
import 'screens/mainScreen.dart';

void main() {
  WidgetsFlutterBinding.ensureInitialized();
  SystemChrome.setPreferredOrientations([
    DeviceOrientation.portraitUp,
    DeviceOrientation.portraitDown,
  ]);
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Join Us',
      theme: ThemeData.dark(),
      routes: {
        MainScreen.id: (context) => MainScreen(),
        EventScreen.id: (context) => EventScreen(),
        ChatScreen.id: (context) => ChatScreen(),
        ChangePasswordScreen.id: (context) => ChangePasswordScreen(),
        ChatsListScreen.id: (context) => ChatsListScreen(),
      },
      home: BottomNavBar(),
    );
  }
}
