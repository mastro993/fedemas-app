import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';

class CustomFlatButton extends StatelessWidget {
  final Color color;
  final Function() onPressed;
  final String title;
  final IconData iconData;

  const CustomFlatButton({
    Key key,
    @required this.title,
    this.color = Colors.blue,
    this.onPressed,
    this.iconData,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MouseRegion(
      cursor: SystemMouseCursors.click,
      child: FlatButton(
        padding: const EdgeInsets.symmetric(vertical: 24.0, horizontal: 32.0),
        color: color,
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(24.0),
        ),
        onPressed: onPressed,
        child: Row(
          mainAxisSize: MainAxisSize.min,
          children: <Widget>[
            Padding(
              padding: const EdgeInsets.only(bottom: 4),
              child: Icon(
                iconData,
                color: Colors.white,
                size: 21.0,
              ),
            ),
            const SizedBox(width: 16),
            Text(
              title,
              style: const TextStyle(
                color: Colors.white,
                fontSize: 16,
                fontWeight: FontWeight.bold,
              ),
            ),
          ],
        ),
      ),
    );
  }
}
