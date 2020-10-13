import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';
import 'package:url_launcher/url_launcher.dart';

class NavigationBarIconButton extends StatelessWidget {
  final IconData iconData;
  final String destinationUrl;

  const NavigationBarIconButton({this.iconData, this.destinationUrl});

  @override
  Widget build(BuildContext context) {
    return MouseRegion(
      cursor: SystemMouseCursors.click,
      child: IconButton(
        icon: Icon(iconData),
        color: Colors.white,
        onPressed: () async {
          if (await canLaunch(destinationUrl)) {
            await launch(destinationUrl);
          } else {
            throw 'Could not launch $destinationUrl';
          }
        },
      ),
    );
  }
}
