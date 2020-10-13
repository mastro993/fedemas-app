import 'package:fedemas_app/core/utils/text_style_utils.dart';
import 'package:fedemas_app/presentation/project_details/project_details_page.dart';
import 'package:fedemas_app/presentation/widgets/custom_flat_button_widgets.dart';
import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:url_launcher/url_launcher.dart';
import 'dart:js' as js;

class ProjectDetailsHome2WorkPage extends ProjectDetailsPage {
  const ProjectDetailsHome2WorkPage()
      : super(
          title: 'Home2Work',
          subtitle: 'A gamification powered app for car pooling',
        );

  @override
  Widget getBody(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: <Widget>[
        // TODO project details sections
        Row(
          children: <Widget>[
            CustomFlatButton(
              title: "Visit official website",
              iconData: FontAwesomeIcons.link,
              color: Colors.green,
              onPressed: () async {
                const url = 'http://home2work.it';
                if (await canLaunch(url)) {
                  await launch(url);
                } else {
                  throw 'Could not launch $url';
                }
              },
            ),
            const SizedBox(width: 16.0),
            CustomFlatButton(
              title: "Read project thesis",
              iconData: FontAwesomeIcons.file,
              onPressed: () =>
                  js.context.callMethod('open', ['/assets/docs/thesis.pdf']),
            ),
          ],
        )
      ],
    );
  }
}
