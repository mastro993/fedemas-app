import 'package:fedemas_app/screens/main_screen.dart';
import 'package:flutter/material.dart';

void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Fedemas',
      theme: ThemeData(
        buttonColor: Color.fromRGBO(54, 124, 255, 1.0),
        accentColor: Color.fromRGBO(54, 124, 255, 1.0),
        canvasColor: Colors.black,//const Color(0xFF1D2025),
        textTheme: Theme.of(context).textTheme.apply(
          bodyColor: const Color(0xFFE4E7EB),
          displayColor: const Color(0xFFE4E7EB),
          fontFamily: 'Yantramanav'
        ),
      ),
      home: MainScreen(),
    );
  }
}
