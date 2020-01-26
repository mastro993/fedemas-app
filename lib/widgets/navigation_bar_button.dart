import 'package:fedemas_app/utils/custom_cursor.dart';
import 'package:flutter/material.dart';

class NavigationBarButton extends StatelessWidget {
  final Function onPressed;
  final bool isSelected;
  final String title;
  final double fontSize;

  NavigationBarButton(
      {@required this.title,
      @required this.isSelected,
      @required this.onPressed,
      this.fontSize = 18,
      });

  @override
  Widget build(BuildContext context) {
    return CustomCursor(
      cursorStyle: CustomCursor.pointer,
      child: FlatButton(
        onPressed: onPressed,
        child: Text(
          this.title,
          style: TextStyle(
            fontSize: fontSize,
          ),
        ),
        textColor:
            this.isSelected ? Colors.white : Colors.white.withOpacity(0.4),
      ),
    );
  }
}
