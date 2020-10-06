import 'package:flutter/material.dart';

import '../utils/custom_cursor.dart';
import '../utils/url_utils.dart';

class NavigationBarIconButton extends StatelessWidget {
  final IconData iconData;
  final String destinationUrl;

  const NavigationBarIconButton({this.iconData, this.destinationUrl});

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
