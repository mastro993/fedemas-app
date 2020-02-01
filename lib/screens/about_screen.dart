import 'dart:math';

import 'package:fedemas_app/utils/custom_cursor.dart';
import 'package:fedemas_app/utils/screen_utils.dart';
import 'package:fedemas_app/utils/text_style_utils.dart';
import 'package:fedemas_app/utils/url_utils.dart';
import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';

class AboutScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    final mq = MediaQuery.of(context);
    final screenWidth = mq.size.width;
    double textWidth = 0;
    if (screenWidth >= ScreenUtils.WIDTH_M) {
      textWidth = MediaQuery.of(context).size.width * 0.70;
    } else if (screenWidth >= ScreenUtils.WIDTH_S) {
      textWidth = MediaQuery.of(context).size.width * 0.85;
    } else {
      textWidth = MediaQuery.of(context).size.width;
    }

    return Container(
      alignment: Alignment.center,
      child: Container(
        width: min(textWidth, 1360),
        padding: EdgeInsets.symmetric(horizontal: 24.0, vertical: 48.0),
        //height: _mq.size.height,
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: <Widget>[
            Text(
              'Hey there 👋 nice to meet you!',
              style: TextStyleUtils.of(context).heading,
            ),
            SizedBox(height: 24),
            Text(
              '''
Federico here. I am a Software Developer who’s passionate about mobile app development and UI/UX design.
I’ve been developing software since I was young, when I enjoyed creating simple applications for the online communities I frequented at the time: the good ol’ days with no customers to satisfy and no requirements to be respected, just code.\n
I always enjoyed designing, developing and creating any kind of software: give me a problem that can be solved with lines of code and I’m happy to solve it.\n
I consider myself a proactive and insightful person. I am always looking for something to do and I hate downtimes. When I have the opportunity to learn something new I never miss the chance to do it.\n
This type of approach has led me to be able to work in different branches of software such as management software, ERPs and embedded applications, and come into contact with different technologies and different programming languages such as Python, C / C++, Java, JavaScript, Ruby, .NET, Kotlin, Dart, Android and iOS.
I love to stay up to date on the technologies I use and new ones by reading daily articles from the sector on Medium, participating in the dev community on Reddit and following online courses on Udemy.\n
I started developing mobile apps during the first years of university and it was "love at first sight". The things that most attracted me to this world are the ease of use, the simplicity of reaching new customers and the ability to solve real problems with pocket art works.\n
Finally, besides software development, I am passionate about RPG video games, oriental cuisine and good wine (every now and then). I practice a lot of sport, in particular weightlifting, which beside taking me in good shape it has taught me to have constancy and determination in everything I do, in the everyday life and in work.\n
If you are interested in knowing more about me and my past experiences you can take a look at my CV here below.
''',
              style: TextStyleUtils.of(context).body,
            ),
            SizedBox(height: 24),
            DocumentButton(
              title: 'Download CV',
              color: Colors.blue,
              onPressed: () => UrlUtils.openUrl(
                  'https://drive.google.com/file/d/1Dvo4VrmWfZUnKPEIIDozxvX116fjs0Af/view?usp=sharing'),
            ),
          ],
        ),
      ),
    );
  }
}

class DocumentButton extends StatelessWidget {
  const DocumentButton({this.title, this.color, this.onPressed});

  final Function onPressed;
  final String title;
  final Color color;

  @override
  Widget build(BuildContext context) {
    return CustomCursor(
      cursorStyle: CustomCursor.pointer,
      child: FlatButton(
        padding: EdgeInsets.symmetric(vertical: 12.0, horizontal: 24.0),
        color: color,
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(24.0),
        ),
        onPressed: onPressed,
        child: Row(
          mainAxisSize: MainAxisSize.min,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: <Widget>[
            Padding(
              padding: const EdgeInsets.only(bottom: 4),
              child: const Icon(
                FontAwesomeIcons.file,
                color: Colors.white,
                size: 16.0,
              ),
            ),
            SizedBox(width: 16),
            Text(
              title,
              style: const TextStyle(
                color: Colors.white,
                fontSize: 16,
              ),
            ),
          ],
        ),
      ),
    );
  }
}
