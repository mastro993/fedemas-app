import 'package:fedemas_app/screens/about_screen.dart';
import 'package:fedemas_app/screens/projects_screen.dart';
import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';

class MainScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: NestedScrollView(
        physics: BouncingScrollPhysics(),
        headerSliverBuilder: (context, innerBoxIsScrolled) => <Widget>[
          SliverAppBar(
            backgroundColor: Colors.black,
            elevation: 0,
            floating: true,
            title: Row(
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
                      Icon(FontAwesomeIcons.facebook,
                          color: Colors.white),
                      Icon(FontAwesomeIcons.twitter,
                          color: Colors.white),
                      Icon(FontAwesomeIcons.linkedinIn,
                          color: Colors.white),
                    ],
                  ),
                )
              ],
            ),
            // ? reference: https://stackoverflow.com/a/57942351/5372892
          )
        ],
        body: AboutScreen(),
      ),
    );
  }
}
