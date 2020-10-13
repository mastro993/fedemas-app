import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';

class NavigationBarButton extends StatelessWidget {
  final Function() onPressed;
  final bool isSelected;
  final String title;
  final double fontSize;

  const NavigationBarButton({
    @required this.title,
    @required this.isSelected,
    @required this.onPressed,
    this.fontSize = 18,
  });

  @override
  Widget build(BuildContext context) {
    return MouseRegion(
      cursor: SystemMouseCursors.click,
      child: FlatButton(
        onPressed: onPressed,
        textColor: isSelected ? Colors.white : Colors.white.withOpacity(0.4),
        child: Text(
          title,
          style: TextStyle(
            fontSize: fontSize,
          ),
        ),
      ),
    );
  }
}
