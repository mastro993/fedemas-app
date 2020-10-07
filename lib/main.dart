import 'package:fedemas_app/screens/main_screen.dart';
import 'package:fedemas_app/screens/projects/home2work_project_screen.dart';
import 'package:firebase_analytics/firebase_analytics.dart';
import 'package:firebase_analytics/observer.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';

void main() {
  WidgetsFlutterBinding.ensureInitialized();
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  final Future<FirebaseApp> _initialization = Firebase.initializeApp();

  static FirebaseAnalytics analytics = FirebaseAnalytics();
  static FirebaseAnalyticsObserver observer = FirebaseAnalyticsObserver(
    analytics: analytics,
  );

  @override
  Widget build(BuildContext context) {
    return FutureBuilder(
      // Initialize FlutterFire:
      future: _initialization,
      builder: (context, snapshot) {
        // Check for errors
        if (snapshot.hasError) {
          return const Scaffold(
            body: Center(
              child: Text('Something went wrong!'),
            ),
          );
        }

        // Once complete, show your application
        if (snapshot.connectionState == ConnectionState.done) {
          return MaterialApp(
            title: 'Federico Mastrini - Software Developer',
            theme: ThemeData(
              buttonColor: const Color.fromRGBO(54, 124, 255, 1.0),
              accentColor: const Color.fromRGBO(54, 124, 255, 1.0),
              canvasColor: Colors.black, //const Color(0xFF1D2025),
              textTheme: Theme.of(context).textTheme.apply(
                  bodyColor: const Color(0xFFE4E7EB),
                  displayColor: const Color(0xFFE4E7EB),
                  fontFamily: 'SF Pro'),
              visualDensity: VisualDensity.adaptivePlatformDensity,
            ),
            home: MainScreen(),
            navigatorObservers: <NavigatorObserver>[observer],
            routes: {
              Home2WorkProjectScreen.ROUTE: (ctx) => Home2WorkProjectScreen(),
            },
          );
        }

        // Otherwise, show something whilst waiting for initialization to complete
        return const Scaffold(
          body: Center(
            child: CircularProgressIndicator(),
          ),
        );
      },
    );
  }
}
