import 'dart:math';

import 'package:fedemas_app/core/utils/screen_utils.dart';
import 'package:fedemas_app/core/utils/text_style_utils.dart';
import 'package:flutter/material.dart';

import 'widgets/projects_grid_widget.dart';

class ProjectsScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.stretch,
      children: <Widget>[
        ProjectsSummary(),
        ProjectsGrid(),
      ],
    );
  }
}

class ProjectsSummary extends StatelessWidget {
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
      padding: const EdgeInsets.symmetric(horizontal: 24, vertical: 48),
      child: Container(
        width: min(textWidth, 1360),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: <Widget>[
            Text(
              'Hey there 👋',
              style: TextStyleUtils.of(context).heading,
            ),
            const SizedBox(height: 16),
            Text(
              """
I'm Federico 🙌.
I'm a Software Engineer with a passion in Mobile App Development and UI/UX Design based in La Spezia, Italy.
I enjoy solving problems using mobile development as a fundation and experimenting with UI/UX, and have lots of fun doing it. If you are interested in my work scroll down to see it! 👇""",
              style: TextStyleUtils.of(context).subTitle,
            ),
          ],
        ),
      ),
    );
  }
}
