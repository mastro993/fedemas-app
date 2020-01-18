import 'dart:math';

import 'package:fedemas_app/screens/home_screen_landscape.dart';
import 'package:fedemas_app/screens/home_screen_portrait.dart';
import 'package:flutter/material.dart';

class HomeScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    var _mediaQuery = MediaQuery.of(context);
    return _mediaQuery.size.width >= 960 ? HomeScreenLandscape() : HomeScreenPortrait();
  }
}
