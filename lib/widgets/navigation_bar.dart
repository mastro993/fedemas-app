import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';

import '../utils/custom_cursor.dart';
import '../utils/screen_utils.dart';
import 'navigation_bar_button.dart';
import 'navigation_bar_icon_button.dart';

class NavigationBar extends StatelessWidget implements PreferredSizeWidget {
  @override
  final Size preferredSize;
  final int selectedPage;
  final Function onPageSelect;

  const NavigationBar(
      {this.onPageSelect, this.selectedPage, this.preferredSize});

  @override
  Widget build(BuildContext context) {
    final mq = MediaQuery.of(context);
    final screenWidth = mq.size.width;
    final expanded = screenWidth >= ScreenUtils.WIDTH_M;
    return SafeArea(
      child: Container(
        padding: const EdgeInsets.symmetric(horizontal: 24.0),
        height: preferredSize.height,
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: <Widget>[
            if (expanded)
              Flexible(
                child: Row(
                  children: <Widget>[
                    NavigationBarButton(
                      title: 'Projects',
                      isSelected: selectedPage == 0,
                      onPressed: () => onPageSelect(0),
                    ),
                    NavigationBarButton(
                      title: 'About',
                      isSelected: selectedPage == 1,
                      onPressed: () => onPageSelect(1),
                    ),
                  ],
                ),
              ),
            Flexible(
              child: Text(
                'Federico Mastrini',
                style: TextStyle(
                  fontSize: expanded ? 32 : 21,
                  fontWeight: FontWeight.w800,
                ),
              ),
            ),
            if (expanded)
              Flexible(
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.end,
                  children: const <Widget>[
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
              ),
            if (!expanded)
              // ! Vertical alignment!
              CustomCursor(
                child: IconButton(
                  icon: const Icon(FontAwesomeIcons.bars),
                  onPressed: () => Scaffold.of(context).openEndDrawer(),
                  color: Colors.white,
                ),
              )
          ],
        ),
      ),
    );
    // ? reference: https://stackoverflow.com/a/57942351/5372892
  }
}
