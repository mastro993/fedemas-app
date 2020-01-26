import 'package:flutter/material.dart';

class MainFooter extends StatelessWidget {
  static const double SIZE = 192.0;
  @override
  Widget build(BuildContext context) {
    return Container(
      height: MainFooter.SIZE,
      child: Center(
        child: Text('Footer'),
      ),
    );
  }
}