import 'dart:math';
import 'dart:ui';

import 'package:fedemas_app/model/project.dart';
import 'package:fedemas_app/screens/projects/home2work_project_screen.dart';
import 'package:fedemas_app/utils/custom_cursor.dart';
import 'package:fedemas_app/utils/screen_utils.dart';
import 'package:fedemas_app/utils/text_style_utils.dart';
import 'package:fedemas_app/utils/url_utils.dart';
import 'package:flutter/material.dart';

class ProjectsScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.stretch,
      children: <Widget>[
        _ProjectsSummary(),
        _ProjectsGrid(),
      ],
    );
  }
}

class _ProjectsSummary extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    final mq = MediaQuery.of(context);
    final screenWidth = mq.size.width;

    double textWidth = 0;
    double textHeight = 0;

    if (screenWidth >= ScreenUtils.WIDTH_M) {
      textWidth = MediaQuery.of(context).size.width * 0.60;
      textHeight = MediaQuery.of(context).size.height * 0.70;
    } else if (screenWidth >= ScreenUtils.WIDTH_S) {
      textWidth = MediaQuery.of(context).size.width * 0.75;
      textHeight = MediaQuery.of(context).size.height * 0.70;
    } else {
      textWidth = MediaQuery.of(context).size.width;
      textHeight = MediaQuery.of(context).size.height * 0.80;
    }

    return Container(
      constraints: BoxConstraints(minHeight: textHeight),
      alignment: Alignment.center,
      padding: EdgeInsets.symmetric(horizontal: 24, vertical: 48),
      child: Container(
        width: min(textWidth, 1360),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: <Widget>[
            Text(
              'Hey there 👋',
              style: TextStyleUtils.of(context).heading,
            ),
            SizedBox(height: 16),
            Text(
              '''
I\'m Federico 🙌.
I\'m a Software Engineer with a passion in Mobile App Development and UI/UX Design based in La Spezia, Italy.
I enjoy solving problems using mobile development as a fundation and experimenting with UI/UX, and have lots of fun doing it. If you are interested in my work scroll down to see it! 👇''',
              style: TextStyleUtils.of(context).subTitle,
            ),
          ],
        ),
      ),
    );
  }
}

class _ProjectsGrid extends StatelessWidget {
  final _projects = [
    Project(
      title: 'Home2Work',
      shortDescription: 'Car pooling app',
      isReleased: true,
      coverImage: 'assets/images/h2w_cover.webp',
      url: Home2WorkProjectScreen.ROUTE,
      // isExternalUrl: true,
      // url: 'http://home2work.it',
    ),
    Project(title: 'ND'),
  ];

  @override
  Widget build(BuildContext context) {
    final mq = MediaQuery.of(context);
    final screenWidth = mq.size.width;

    double gridWidth = 0;
    double gridMaxCrossAxisExtent = 0;

    if (screenWidth >= ScreenUtils.WIDTH_L) {
      gridWidth = screenWidth * 0.70;
      gridMaxCrossAxisExtent = gridWidth / 3;
    } else if (screenWidth >= ScreenUtils.WIDTH_S) {
      gridWidth = screenWidth * 0.90;
      gridMaxCrossAxisExtent = gridWidth / 2;
    } else {
      gridWidth = screenWidth;
      gridMaxCrossAxisExtent = gridWidth;
    }
    return Container(
      alignment: Alignment.topCenter,
      color: Colors.black,
      padding: EdgeInsets.symmetric(vertical: 32.0),
      child: Container(
        width: gridWidth,
        padding: EdgeInsets.all(24.0),
        child: GridView.builder(
          shrinkWrap: true,
          physics: const NeverScrollableScrollPhysics(),
          itemCount: _projects.length,
          gridDelegate: SliverGridDelegateWithMaxCrossAxisExtent(
            childAspectRatio: 4 / 3,
            maxCrossAxisExtent: gridMaxCrossAxisExtent,
            crossAxisSpacing: 24.0,
            mainAxisSpacing: 24.0,
          ),
          itemBuilder: (context, index) => _ProjectGridItem(_projects[index]),
        ),
      ),
    );
  }
}

class _ProjectGridItem extends StatelessWidget {
  final Project _project;

  final _borderRadius = BorderRadius.circular(8.0);
  _ProjectGridItem(this._project);
  @override
  Widget build(BuildContext context) {
    if (_project.isReleased) {
      return CustomCursor(
        cursorStyle: CustomCursor.pointer,
        child: GestureDetector(
          onTap: () {
            if (_project.url.isNotEmpty) {
              if (_project.isExternalUrl) {
                UrlUtils.openUrl(_project.url);
              } else {
                Navigator.of(context).pushNamed(_project.url);
              }
            }
          },
          child: Container(
            decoration: new BoxDecoration(
              borderRadius: _borderRadius,
              image: new DecorationImage(
                image: new NetworkImage(_project.coverImage),
                fit: BoxFit.cover,
              ),
            ),
          ),
          // child: Container(
          //   decoration: new BoxDecoration(
          //     image: new DecorationImage(
          //       image: new NetworkImage(_project.coverImage),
          //       fit: BoxFit.cover,
          //     ),
          //   ),
          //   child: _project.released
          //       ? Container()
          //       : ClipRect(
          //           child: new BackdropFilter(
          //             filter: new ImageFilter.blur(sigmaX: 5.0, sigmaY: 5.0),
          //             child: new Container(
          //               decoration: new BoxDecoration(
          //                   color: Colors.white.withOpacity(0.0)),
          //               child: Center(
          //                 child: Text(
          //                   'Coming Soon',
          //                   style: TextStyleUtils.of(context).title,
          //                 ),
          //               ),
          //             ),
          //           ),
          //         ),
          // ),
        ),
      );
    } else {
      return Container(
        decoration: new BoxDecoration(
            border: Border.all(
              width: 2,
              color: const Color(0x10A8A6A1),
            ),
            borderRadius: _borderRadius),
        child: Center(
          child: Text(
            'Coming Soon',
            style: TextStyleUtils.of(context)
                .subTitle
                .copyWith(color: const Color(0x40A8A6A1)),
          ),
        ),
      );
    }
  }
}
