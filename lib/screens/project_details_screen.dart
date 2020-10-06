import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';

import '../utils/screen_utils.dart';
import '../utils/text_style_utils.dart';
import '../widgets/main_footer.dart';

abstract class ProjectDetailsScreen extends StatelessWidget {
  String getTitle();
  String getSubtitle() => '';
  Widget getBody(BuildContext context);

  @override
  Widget build(BuildContext context) {
    final mq = MediaQuery.of(context);
    final screenWidth = mq.size.width;
    final screenHeight = mq.size.height;
    double bodyWidth = 0;
    double backArrowPadding = 0;
    double navbarHeight = 0;

    if (screenWidth >= ScreenUtils.WIDTH_M) {
      bodyWidth = screenWidth * 0.70;
      navbarHeight = 104.0;
      backArrowPadding = 24;
    } else if (screenWidth >= ScreenUtils.WIDTH_S) {
      bodyWidth = screenWidth * 0.80;
      navbarHeight = 96.0;
      backArrowPadding = 24;
    } else {
      bodyWidth = screenWidth * 0.90;
      navbarHeight = 72.0;
      backArrowPadding = 16;
    }

    final headingHeight = screenHeight * 0.2;
    final bodyHeight =
        mq.size.height - navbarHeight - headingHeight - MainFooter.SIZE;

    return Scaffold(
      body: CustomScrollView(
        physics: const BouncingScrollPhysics(),
        slivers: <Widget>[
          SliverAppBar(
            elevation: 0,
            floating: true,
            backgroundColor: Colors.black,
            expandedHeight: navbarHeight,
            flexibleSpace: FlexibleSpaceBar(
              background: Container(
                padding: EdgeInsets.only(left: backArrowPadding),
                height: navbarHeight,
                child: IconButton(
                  alignment: Alignment.centerLeft,
                  icon: const Icon(FontAwesomeIcons.arrowLeft),
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
                    constraints: BoxConstraints(
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
                          style: TextStyleUtils.of(context).heading,
                        ),
                        Text(
                          getSubtitle(),
                          style: TextStyleUtils.of(context).subHeading,
                        ),
                      ],
                    ),
                  ),
                  Container(
                    constraints: BoxConstraints(
                      minHeight: bodyHeight,
                      maxWidth: bodyWidth,
                    ),
                    alignment: Alignment.topCenter,
                    child: getBody(context),
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
