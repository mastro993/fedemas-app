import 'package:fedemas_app/utils/custom_cursor.dart';
import 'package:fedemas_app/utils/url_utils.dart';
import 'package:fedemas_app/widgets/navigation_bar_button.dart';
import 'package:fedemas_app/widgets/navigation_bar_icon_button.dart';
import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';

class NavigationBar extends StatelessWidget implements PreferredSizeWidget {
  @override
  final Size preferredSize;
  final int selectedPage;
  final Function onPageSelect;

  NavigationBar({this.onPageSelect, this.selectedPage})
      : preferredSize = Size.fromHeight(96.0);

  @override
  Widget build(BuildContext context) {
    final bool _expanded = MediaQuery.of(context).size.width >= 1000;
    return SafeArea(
      child: Container(
        padding: EdgeInsets.all(24),
        height: preferredSize.height,
        color: Colors.black,
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: <Widget>[
            if (_expanded)
              Flexible(
                flex: 1,
                fit: FlexFit.loose,
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.start,
                  crossAxisAlignment: CrossAxisAlignment.center,
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
              flex: 1,
              fit: FlexFit.loose,
              child: Text(
                'Federico Mastrini',
                style: TextStyle(
                  fontSize: _expanded ? 32 : 21,
                  fontWeight: FontWeight.w800,
                ),
              ),
            ),
            if (_expanded)
              Flexible(
                flex: 1,
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.end,
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
              ),
            if (!_expanded)
              CustomCursor(
                cursorStyle: CustomCursor.pointer,
                child: IconButton(
                  icon: Icon(FontAwesomeIcons.bars),
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


