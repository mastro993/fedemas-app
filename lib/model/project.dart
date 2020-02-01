import 'package:flutter/cupertino.dart';

class Project {
  final String title;
  final String shortDescription;
  final String coverImage;
  final String route;
  final bool released;

  const Project({
    @required this.title,
    this.shortDescription = '',
    this.coverImage = 'assets/images/project_placeholder.png',
    this.route = '',
    this.released = false,
  });
}
