import 'dart:math';

import 'package:fedemas_app/utils/screen_utils.dart';
import 'package:fedemas_app/widgets/main_footer.dart';
import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';

abstract class ProjectDetailsScreen extends StatelessWidget {
  String getTitle();
  String getSubtitle() => '';
  Widget getBody();
  double bodyTextSize = 0;

  TextStyle get paragraphStyle => TextStyle(
        fontSize: bodyTextSize,
        color: Color(0xFFA8A6A1),
        height: 1.8,
      );

  double _navbarHeight = 0;
  ScrollController _controller;

  @override
  Widget build(BuildContext context) {
    final mq = MediaQuery.of(context);
    final screenWidth = mq.size.width;
    final screenHeight = mq.size.height;

    double titleFontSize = 0;
    double subtitleFontSize = 0;
    double bodyWidth = 0;
    double backArrowPadding = 0;

    if (screenWidth >= ScreenUtils.WIDTH_M) {
      titleFontSize = 64.0;
      subtitleFontSize = 32.0;
      bodyTextSize = 19.0;
      bodyWidth = screenWidth * 0.80;
      _navbarHeight = 104.0;
      backArrowPadding = 24;
    } else if (screenWidth >= ScreenUtils.WIDTH_S) {
      titleFontSize = 64.0;
      subtitleFontSize = 32.0;
      bodyWidth = screenWidth * 0.90;
      bodyTextSize = 19.0;
      _navbarHeight = 96.0;
      backArrowPadding = 24;
    } else {
      titleFontSize = 40.0;
      subtitleFontSize = 21.0;
      bodyTextSize = 17.0;
      bodyWidth = screenWidth * 0.90;
      _navbarHeight = 72.0;
      backArrowPadding = 16;
    }

    final headingHeight = screenHeight * 0.2;
    final bodyHeight =
        mq.size.height - _navbarHeight - headingHeight - MainFooter.SIZE;

    final titleStyle = TextStyle(
      fontSize: titleFontSize,
      height: 1.2,
      fontWeight: FontWeight.w700,
    );

    final subtitleStyle = TextStyle(
      fontSize: subtitleFontSize,
      height: 1.2,
      fontWeight: FontWeight.bold,
      color: Color(0xFFA8A6A1),
    );

    return Scaffold(
      body: CustomScrollView(
        controller: _controller,
        physics: BouncingScrollPhysics(),
        slivers: <Widget>[
          SliverAppBar(
            elevation: 0,
            floating: true,
            pinned: false,
            backgroundColor: Colors.black,
            snap: false,
            expandedHeight: _navbarHeight,
            flexibleSpace: FlexibleSpaceBar(
              background: Container(
                padding: EdgeInsets.only(left: backArrowPadding),
                height: _navbarHeight,
                child: IconButton(
                  alignment: Alignment.centerLeft,
                  icon: Icon(FontAwesomeIcons.arrowLeft),
                  onPressed: () => Navigator.of(context).pop(),
                  color: Colors.white,
                ),
              ),
            ),
            leading: Container(),
          ),
          SliverList(
            delegate: SliverChildListDelegate([
              Column(
                children: <Widget>[
                  Container(
                    constraints: new BoxConstraints(
                      minHeight: headingHeight,
                      maxWidth: bodyWidth,
                    ),
                    alignment: Alignment.centerLeft,
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: <Widget>[
                        Text(
                          getTitle(),
                          style: titleStyle,
                        ),
                        Text(
                          getSubtitle(),
                          style: subtitleStyle,
                        ),
                      ],
                    ),
                  ),
                  Container(
                    constraints: new BoxConstraints(
                      minHeight: bodyHeight,
                      maxWidth: bodyWidth,
                    ),
                    alignment: Alignment.topCenter,
                    child: getBody(),
                  ),
                  MainFooter(),
                ],
              ),
            ]),
          )
        ],
      ),
    );
  }
}
