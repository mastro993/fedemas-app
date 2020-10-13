import 'package:fedemas_app/core/utils/text_style_utils.dart';
import 'package:fedemas_app/presentation/project_details/project_details_page.dart';
import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:url_launcher/url_launcher.dart';

class ProjectDetailsHome2WorkPage extends ProjectDetailsPage {
  const ProjectDetailsHome2WorkPage()
      : super(
          title: 'Home2Work',
          subtitle: 'A gamification powered app for car pooling',
        );

  @override
  Widget getBody(BuildContext context) {
    return Container(
        child: Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: <Widget>[
        // _TheProblemSection(),
        // _TheSolutionSection(),
        // _KeyFeaturesSection(),
        _ExternalResources()
      ],
    ));
  }
}

class _KeyFeaturesSection extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Column(
      children: <Widget>[
        Text('Key Features', style: TextStyleUtils.of(context).title),
        Text('''Bla bla bla bla''', style: TextStyleUtils.of(context).body),
      ],
    );
  }
}

class _TheSolutionSection extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Column(
      children: <Widget>[
        Text('The solution', style: TextStyleUtils.of(context).title),
        Text('''Bla bla bla bla''', style: TextStyleUtils.of(context).body),
      ],
    );
  }
}

class _TheProblemSection extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Column(
      children: <Widget>[
        Text('The Problem', style: TextStyleUtils.of(context).title),
        Text('''Bla bla bla bla''', style: TextStyleUtils.of(context).body),
      ],
    );
  }
}

class _ExternalResources extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Row(
      children: <Widget>[
        MouseRegion(
          cursor: SystemMouseCursors.click,
          child: FlatButton(
            padding: EdgeInsets.symmetric(vertical: 12.0, horizontal: 24.0),
            color: Colors.green,
            shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(24.0),
            ),
            onPressed: () async {
              const url = 'http://home2work.it';
              if (await canLaunch(url)) {
                await launch(url);
              } else {
                throw 'Could not launch $url';
              }
            },
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
        SizedBox(
          width: 16.0,
        ),
        MouseRegion(
          cursor: SystemMouseCursors.click,
          child: FlatButton(
            padding: EdgeInsets.symmetric(vertical: 12.0, horizontal: 24.0),
            color: Colors.blue,
            shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(24.0),
            ),
            onPressed: () async {
              const url = '/assets/docs/thesis.pdf';
              if (await canLaunch(url)) {
                await launch(url);
              } else {
                throw 'Could not launch $url';
              }
            },
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
    );
  }
}
