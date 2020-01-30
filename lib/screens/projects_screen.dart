import 'dart:math';
import 'dart:ui';

import 'package:fedemas_app/model/project.dart';
import 'package:fedemas_app/utils/custom_cursor.dart';
import 'package:fedemas_app/utils/screen_utils.dart';
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
    double titleFontSize = 0;
    double textFontSize = 0;
    if (screenWidth >= ScreenUtils.WIDTH_LARGE) {
      titleFontSize = 64.0;
      textFontSize = 24.0;
      textWidth = MediaQuery.of(context).size.width * 0.60;
    } else if (screenWidth >= ScreenUtils.WIDTH_MED) {
      titleFontSize = 64.0;
      textFontSize = 24.0;
      textWidth = MediaQuery.of(context).size.width * 0.75;
    } else {
      titleFontSize = 40.0;
      textFontSize = 19.0;
      textWidth = MediaQuery.of(context).size.width;
    }

    TextStyle titleStyle = TextStyle(
      fontSize: titleFontSize,
      height: 1.2,
      fontWeight: FontWeight.w700,
    );

    TextStyle paragraphStyle = TextStyle(
      fontSize: textFontSize,
      color: Colors.grey,
      height: 1.5,
    );

    return Container(
      constraints: BoxConstraints(
        minHeight: MediaQuery.of(context).size.height * 0.70,
      ),
      alignment: Alignment.center,
      padding: EdgeInsets.symmetric(horizontal: 24, vertical: 48),
      child: Container(
        width: min(textWidth, 1360),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: <Widget>[
            Text(
              'Hey there 👋',
              style: titleStyle,
            ),
            SizedBox(height: 16),
            Text(
              'I\'m Federico 🙌.',
              style: paragraphStyle,
            ),
            SizedBox(height: 8),
            Text(
              'I\'m a Mobile Software Engineer with a background in Embedded Software Development based in La Spezia, Italy.',
              style: paragraphStyle,
            ),
            SizedBox(height: 8),
            Text(
              'I enjoy solving problems while experimenting with UI/UX, and have lots of fun doing it. If you are interested in my work scroll down to see it! 👇',
              style: paragraphStyle,
            )
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
        released: true),
    Project(title: 'Test'),
    Project(title: 'Test'),
    Project(title: 'Test'),
    Project(title: 'Test'),
    Project(title: 'Test'),
  ];

  @override
  Widget build(BuildContext context) {
    final mq = MediaQuery.of(context);
    final screenWidth = mq.size.width;
    double gridWidth = 0;
    if (screenWidth >= ScreenUtils.WIDTH_LARGE) {
      gridWidth = MediaQuery.of(context).size.width * 0.70;
    } else if (screenWidth >= ScreenUtils.WIDTH_MED) {
      gridWidth = MediaQuery.of(context).size.width * 0.90;
    } else {
      gridWidth = MediaQuery.of(context).size.width;
    }
    return Container(
      alignment: Alignment.topCenter,
      color: Colors.black,
      padding: EdgeInsets.symmetric(vertical: 24.0),
      child: Container(
        width: min(gridWidth, 1600),
        padding: EdgeInsets.all(24.0),
        child: GridView.builder(
          shrinkWrap: true,
          physics: const NeverScrollableScrollPhysics(),
          itemCount: _projects.length,
          gridDelegate: SliverGridDelegateWithMaxCrossAxisExtent(
              maxCrossAxisExtent: 480.0,
              crossAxisSpacing: 48.0,
              mainAxisSpacing: 48.0),
          itemBuilder: (context, index) => _ProjectGridItem(_projects[index]),
        ),
      ),
    );
  }
}

class _ProjectGridItem extends StatelessWidget {
  final Project _project;
  _ProjectGridItem(this._project);
  @override
  Widget build(BuildContext context) {
    return CustomCursor(
      cursorStyle: CustomCursor.pointer,
      child: Container(
        alignment: Alignment.topCenter,
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: <Widget>[
            Expanded(
              child: Stack(
                fit: StackFit.expand,
                children: <Widget>[
                  Image.network(
                    _project.coverImage,
                    color: Colors.red,
                    fit: BoxFit.cover,
                  ),
                  // if (!_project.released)
                  //   ClipRect(
                  //     child: BackdropFilter(
                  //       filter: ImageFilter.blur(sigmaX: 10.0, sigmaY: 10.0),
                  //       child: Container(
                  //         decoration: new BoxDecoration(
                  //           color: Colors.black54,
                  //         ),
                  //       ),
                  //     ),
                  //   )
                ],
              ),
            ),
            SizedBox(height: 8),
            Text(
              _project.released ? _project.title : 'Coming Soon',
              style: TextStyle(
                fontSize: 19,
                height: 1.5,
                fontWeight: FontWeight.w700,
              ),
              textAlign: TextAlign.center,
            ),
            Text(
              _project.shortDescription,
              style: TextStyle(
                fontSize: 16,
                color: Colors.white.withOpacity(0.5),
                height: 1.5,
              ),
              textAlign: TextAlign.center,
            )
          ],
        ),
      ),
    );
  }
}
