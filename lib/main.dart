import 'package:fedemas_app/screens/home_screen.dart';
import 'package:flutter/material.dart';

void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Fedemas',
      theme: ThemeData(
        buttonColor: Color.fromARGB(255, 54, 124, 255),
        accentColor: Color.fromARGB(255, 54, 124, 255),
        canvasColor: const Color(0xFF191919),//Color.fromARGB(255, 251, 252, 253),
        textTheme: Theme.of(context).textTheme.apply(
          bodyColor: const Color(0xFFAAAAAA),
          displayColor: Color.fromARGB(255, 51, 70, 128),
        ),
      ),
      home: HomeScreen(),
    );
  }
}
