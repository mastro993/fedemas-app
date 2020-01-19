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
        primarySwatch: Colors.blue,
        accentColor: Color.fromARGB(255, 54, 124, 255),
        canvasColor: Color.fromARGB(255, 251, 252, 253),
        textTheme: Theme.of(context).textTheme.apply(
          bodyColor: Color.fromARGB(255, 51, 70, 128),
          displayColor: Color.fromARGB(255, 51, 70, 128),
          fontFamily: 'Lato',
        )
      ),
      home: HomeScreen(),
    );
  }
}
