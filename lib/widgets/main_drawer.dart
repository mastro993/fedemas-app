import 'package:fedemas_app/widgets/navigation_bar_button.dart';
import 'package:fedemas_app/widgets/navigation_bar_icon_button.dart';
import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';

class MainDrawer extends StatelessWidget {
  final int selectedPage;
  final Function onPageSelect;

  MainDrawer({this.selectedPage, this.onPageSelect});

  @override
  Widget build(BuildContext context) {
    return Drawer(
      // Add a ListView to the drawer. This ensures the user can scroll
      // through the options in the drawer if there isn't enough vertical
      // space to fit everything.
      child: Stack(
        children: <Widget>[
          Center(
            child: Column(
              mainAxisSize: MainAxisSize.min,
              mainAxisAlignment: MainAxisAlignment.center,
              crossAxisAlignment: CrossAxisAlignment.center,
              // Important: Remove any padding from the ListView.
              children: <Widget>[
                NavigationBarButton(
                  title: 'Projects',
                  isSelected: selectedPage == 0,
                  onPressed: () {
                    onPageSelect(0);
                    Navigator.of(context).pop();
                  },
                  fontSize: 24,
                ),
                NavigationBarButton(
                  title: 'About',
                  isSelected: selectedPage == 1,
                  onPressed: () {
                    onPageSelect(1);
                    Navigator.of(context).pop();
                  },
                  fontSize: 24,
                ),
              ],
            ),
          ),
          Positioned(
            right: 0,
            left: 0,
            bottom: 48,
            child: Row(
              mainAxisAlignment: MainAxisAlignment.center,
              crossAxisAlignment: CrossAxisAlignment.center,
              children: <Widget>[
                NavigationBarIconButton(
                  iconData: FontAwesomeIcons.linkedinIn,
                  destinationUrl: 'https://www.linkedin.com/in/fedemas/',
                ),
                NavigationBarIconButton(
                  iconData: FontAwesomeIcons.github,
                  destinationUrl: 'https://github.com/mastro993',
                ),
                NavigationBarIconButton(
                  iconData: FontAwesomeIcons.hackerrank,
                  destinationUrl: 'https://www.hackerrank.com/fedemas',
                ),
                NavigationBarIconButton(
                  iconData: FontAwesomeIcons.stackOverflow,
                  destinationUrl: 'https://stackoverflow.com/story/fedemas',
                ),
              ],
            ),
          )
        ],
      ),
    );
  }
}
