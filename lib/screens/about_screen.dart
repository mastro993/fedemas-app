import 'dart:math';

import 'package:fedemas_app/utils/screen_utils.dart';
import 'package:flutter/material.dart';

class AboutScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    final mq = MediaQuery.of(context);
    final screenWidth = mq.size.width;
    double textWidth = 0;
    double titleFontSize = 0;
    double textFontSize = 0;
    if (screenWidth >= ScreenUtils.WIDTH_LARGE) {
      titleFontSize = 64.0;
      textFontSize = 19.0;
      textWidth = MediaQuery.of(context).size.width * 0.70;
    } else if (screenWidth >= ScreenUtils.WIDTH_MED) {
      titleFontSize = 64.0;
      textFontSize = 19.0;
      textWidth = MediaQuery.of(context).size.width * 0.85;
    } else {
      titleFontSize = 34.0;
      textFontSize = 17.0;
      textWidth = MediaQuery.of(context).size.width;
    }

    final titleStyle = TextStyle(
      fontSize: titleFontSize,
      height: 1.2,
      fontWeight: FontWeight.w700,
    );

    final paragraphStyle = TextStyle(
      fontSize: textFontSize,
      color: Color(0xFFA8A6A1),
      height: 1.8,
    );

    return Container(
      alignment: Alignment.topCenter,
      child: Container(
        width: min(textWidth, 1360),
        padding: EdgeInsets.symmetric(horizontal: 24.0, vertical: 48.0),
        //height: _mq.size.height,
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: <Widget>[
            Text(
              'Hey there 👋 nice to meet you!',
              style: titleStyle,
            ),
            SizedBox(height: 24),
            Text(
              '''Federico here. I am a Software Developer who’s passionate about mobile app development and UI UX design.
I’ve been developing software since I was young, when I enjoyed creating simple applications for the online communities I frequented at the time: the good ol’ days with no customers to satisfy and requirements to be respected, just code.\n
I always enjoyed design, develop and create any kind of software: give me a problem that can be solved with lines of code and I’m happy to solve it.\n
I consider myself a proactive and insightful person. I am always looking for something to do and I hate downtime. When I have the opportunity to learn something new I never miss the chance to do it.
This type of approach on things has led me to be able to work in different branches of software such as management software, ERPs and embedded applications, and come into contact with different technologies and different programming languages such as Python, C / C++, Java, JavaScript, Ruby, .NET, Kotlin, Dart, Android and iOS.
I love to stay up to date on the technologies I use and new ones by reading daily articles from the sector on Medium, participating in the dev community on Reddit and following online courses on Udemy.\n
I started developing mobile app during the first years of university and it was "love at first sight". The things that most attracted me to this world are the ease of use, the ease of reaching the end users and the ability to solve real problems with real pocket art works.\n
Finally, besides software development, I am passionate about RPG video games, oriental cuisine and good wine (every now and then). I practice a lot of sport, in particular weightlifting, which beside taking me in good shape it has taught me to have constancy and determination in everything I do, in the everyday life and in work.\n
If you are interested in knowing more about me and my past experiences you can take a look at my CV here.
''',
              style: paragraphStyle,
            )
          ],
        ),
      ),
    );
  }
}
