import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';
import 'package:url_launcher/url_launcher.dart';

class MainFooter extends StatelessWidget {
  static const double size = 192.0;
  @override
  Widget build(BuildContext context) {
    return Container(
      constraints: const BoxConstraints.expand(height: MainFooter.size),
      // height: MainFooter.SIZE,
      child: Column(
        mainAxisSize: MainAxisSize.min,
        mainAxisAlignment: MainAxisAlignment.center,
        children: <Widget>[
          const Text(
            'Built with 💙 Flutter (Beta)',
            style: TextStyle(
              fontSize: 19,
            ),
          ),
          MouseRegion(
            cursor: SystemMouseCursors.click,
            child: FlatButton(
              textColor: Colors.white.withOpacity(0.5),
              onPressed: () async {
                const url = 'https://github.com/mastro993/fedemas-app';
                if (await canLaunch(url)) {
                  await launch(url);
                } else {
                  throw 'Could not launch $url';
                }
              },
              child: const Text(
                'Check out the code on GitHub',
                style: TextStyle(
                  fontSize: 14,
                ),
              ),
            ),
          )
        ],
      ),
    );
  }
}
