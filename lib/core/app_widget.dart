import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';
import '../routes/router.gr.dart' as r;

class FedemasApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Federico Mastrini - Software Developer',
      theme: ThemeData(
        buttonColor: const Color.fromRGBO(54, 124, 255, 1.0),
        accentColor: const Color.fromRGBO(54, 124, 255, 1.0),
        canvasColor: Colors.black,
        textTheme: Theme.of(context).textTheme.apply(
            bodyColor: const Color(0xFFE4E7EB),
            displayColor: const Color(0xFFE4E7EB),
            fontFamily: 'SF Pro'),
        visualDensity: VisualDensity.adaptivePlatformDensity,
      ),
      builder: ExtendedNavigator(router: r.Router()),
    );
  }
}
