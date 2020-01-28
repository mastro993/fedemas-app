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
    this.coverImage = 'https://www.adalu.it/wp-content/uploads/2015/06/default-placeholder-1240x698.png',
    this.route = '/',
    this.released = false,
  });
}
