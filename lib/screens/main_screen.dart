import 'package:fedemas_app/screens/about_screen.dart';
import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';

class MainScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.transparent,
        elevation: 0,
        automaticallyImplyLeading: false,
        centerTitle: true,
        title: TopBar(),
        // ? reference: https://stackoverflow.com/a/57942351/5372892
      ),
      body: AboutScreen(),
    );
  }
}

class TopBar extends StatelessWidget {
  const TopBar({
    Key key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      crossAxisAlignment: CrossAxisAlignment.center,
      children: <Widget>[
        Expanded(
          child: Row(
            mainAxisAlignment: MainAxisAlignment.start,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: <Widget>[
              Text('Projects'),
              SizedBox(width: 16),
              Text('About'),
            ],
          ),
        ),
        Expanded(
          child: Center(
            child: Text('Federico Mastrini'),
          ),
        ),
        Expanded(
          child: Row(
            mainAxisAlignment: MainAxisAlignment.end,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: <Widget>[
              Icon(FontAwesomeIcons.accessibleIcon),
              Icon(FontAwesomeIcons.accessibleIcon),
              Icon(FontAwesomeIcons.accessibleIcon),
            ],
          ),
        )
      ],
    );
  }
}
