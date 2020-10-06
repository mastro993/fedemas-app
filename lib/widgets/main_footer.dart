import 'package:flutter/material.dart';

import '../utils/custom_cursor.dart';
import '../utils/url_utils.dart';

class MainFooter extends StatelessWidget {
  static const double SIZE = 192.0;
  @override
  Widget build(BuildContext context) {
    return Container(
      constraints: const BoxConstraints.expand(height: MainFooter.SIZE),
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
          CustomCursor(
            child: FlatButton(
              textColor: Colors.white.withOpacity(0.5),
              onPressed: () =>
                  UrlUtils.openUrl('https://github.com/mastro993/fedemas-app'),
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
