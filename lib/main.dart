import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:hacknu21/screens/eventScreen.dart';
import 'package:hacknu21/widgets/eventCard.dart';
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
      },
      home: MainScreen(),
    );
  }
}
