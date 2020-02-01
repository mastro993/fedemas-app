import 'package:fedemas_app/screens/project_details_screen.dart';
import 'package:fedemas_app/utils/custom_cursor.dart';
import 'package:fedemas_app/utils/text_style_utils.dart';
import 'package:fedemas_app/utils/url_utils.dart';
import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';

class Home2WorkProjectScreen extends ProjectDetailsScreen {
  static const String ROUTE = "/project/home2work/";

  String getTitle() => 'Home2Work';
  String getSubtitle() => 'A car pooling app';

  Widget getBody(BuildContext context) {
    return Container(
        child: Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: <Widget>[
        Text(
          '''
Home2Work is a platform with the aim of simplyfing car sharing between employees of the same company (or group of companies), suggesting which employees have a similar home-work route and allowing them to share their car to go to work. This allows to reduce the traffic, the air pollution and the employees expenses.

Home2Work consists of a native Android app and an Asp.net server.

The app has been developed using Kotlin following the Clean Architecture principles. It utilizes the Activity Recognition API to understand if the user is driving and keep track of the movements, which are stored in a local SQLite database.
It also includes the ability to interact with other usesr with an instant messagin (IM) system and some social features such as user profiles and feeds.

The server is an ASP.NET server used to store the data collected by the app and later compute matches between users. It exposes the resources through a RESTful API.

Home2Work integrates some gamification features to increase employees engagement and productivity. Some of these features are:
- a point systems, named Karma points, awarded for completed car shares between users, which can be used later as an exchange currency in dedicate stores (to get physical goods);
- leveling systems based on experience points;
- daily, weekly and monthly challenges;
- users statistics and charts.

Home2Work was developed for the Mobile App Awards 2016 organized by the University of Studies of Parma and later it became subject of my graduation thesis.  
      ''',
          style: TextStyleUtils.of(context).body,
        ),
        Row(
          children: <Widget>[
            CustomCursor(
              cursorStyle: CustomCursor.pointer,
              child: FlatButton(
                padding: EdgeInsets.symmetric(vertical: 12.0, horizontal: 24.0),
                color: Colors.green,
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(24.0),
                ),
                onPressed: () => UrlUtils.openUrl('http://home2work.it'),
                child: Row(
                  mainAxisSize: MainAxisSize.min,
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: <Widget>[
                    Padding(
                      padding: const EdgeInsets.only(bottom: 4),
                      child: const Icon(
                        FontAwesomeIcons.link,
                        color: Colors.white,
                        size: 16.0,
                      ),
                    ),
                    SizedBox(width: 16),
                    Text(
                      'Visit website',
                      style: const TextStyle(
                        color: Colors.white,
                        fontSize: 16,
                      ),
                    ),
                  ],
                ),
              ),
            ),
            SizedBox(width: 16.0,),
            CustomCursor(
              cursorStyle: CustomCursor.pointer,
              child: FlatButton(
                padding: EdgeInsets.symmetric(vertical: 12.0, horizontal: 24.0),
                color: Colors.blue,
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(24.0),
                ),
                onPressed: () => UrlUtils.openUrl('/assets/docs/thesis.pdf'),
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
                      'Read thesis',
                      style: const TextStyle(
                        color: Colors.white,
                        fontSize: 16,
                      ),
                    ),
                  ],
                ),
              ),
            )
          ],
        )
      ],
    ));
  }
}
