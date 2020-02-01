import 'package:fedemas_app/utils/custom_cursor.dart';
import 'package:fedemas_app/utils/url_utils.dart';
import 'package:flutter/material.dart';

class MainFooter extends StatelessWidget {
  static const double SIZE = 192.0;
  @override
  Widget build(BuildContext context) {
    return Container(
      constraints: BoxConstraints.expand(height: MainFooter.SIZE),
      // height: MainFooter.SIZE,
      child: Column(
        mainAxisSize: MainAxisSize.min,
        mainAxisAlignment: MainAxisAlignment.center,
        children: <Widget>[
          Text(
            'Built with 💙 Flutter',
            style: TextStyle(
              fontSize: 19,
            ),
          ),
          CustomCursor(
            cursorStyle: CustomCursor.pointer,
            child: FlatButton(
              textColor: Colors.white.withOpacity(0.5),
              onPressed: () => UrlUtils.openUrl('https://github.com/mastro993/fedemas-app'),
              child: Text(
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
