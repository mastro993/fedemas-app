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
                    FlatButton(
                        onPressed: () => onPageSelect(0),
                        child: Text('Projects'),
                        textColor: Colors.white),
                    FlatButton(
                        onPressed: () => onPageSelect(1),
                        child: Text('About'),
                        textColor: Colors.white)
                  ],
                ),
              ),
            Flexible(
              flex: 1,
              fit: FlexFit.loose,
              child: Text(
                'Federico Mastrini',
                style: TextStyle(
                  fontSize: _expanded ? 32 : 24,
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
                    Icon(FontAwesomeIcons.linkedinIn, color: Colors.white),
                    SizedBox(
                      width: 16,
                    ),
                    Icon(FontAwesomeIcons.github, color: Colors.white),
                    SizedBox(
                      width: 16,
                    ),
                    Icon(FontAwesomeIcons.hackerrank, color: Colors.white),
                    SizedBox(
                      width: 16,
                    ),
                    Icon(FontAwesomeIcons.stackOverflow, color: Colors.white),
                  ],
                ),
              ),
            if (!_expanded)
              IconButton(
                icon: Icon(FontAwesomeIcons.bars),
                onPressed: () {},
                color: Colors.white,
              )
          ],
        ),
      ),
    );
    // ? reference: https://stackoverflow.com/a/57942351/5372892
  }
}
