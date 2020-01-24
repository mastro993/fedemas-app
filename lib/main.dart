import 'package:fedemas_app/screens/main_screen.dart';
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
        canvasColor: const Color(0xFF1D2025),//Color.fromARGB(255, 251, 252, 253),
        textTheme: Theme.of(context).textTheme.apply(
          bodyColor: const Color(0xFFE4E7EB),
          displayColor: const Color(0xFFE4E7EB),
          fontFamily: 'Lato'
        ),
      ),
      home: MainScreen(),
    );
  }
}
