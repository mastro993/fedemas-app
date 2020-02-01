import 'package:fedemas_app/utils/custom_cursor.dart';
import 'package:fedemas_app/utils/url_utils.dart';
import 'package:flutter/material.dart';

class NavigationBarIconButton extends StatelessWidget {
  final IconData iconData;
  final String destinationUrl;

  NavigationBarIconButton({this.iconData, this.destinationUrl});

  @override
  Widget build(BuildContext context) {
    return CustomCursor(
      cursorStyle: CustomCursor.pointer,
      child: IconButton(
        icon: Icon(iconData),
        color: Colors.white,
        onPressed: () => UrlUtils.openUrl(destinationUrl),
      ),
    );
  }
}
