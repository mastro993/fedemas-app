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
    this.coverImage = 'https://digidirect.info/wp-content/uploads/2019/02/data-1-620x342.jpg',
    this.route = '/',
    this.released = false,
  });
}
