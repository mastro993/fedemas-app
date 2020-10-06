import 'package:flutter/cupertino.dart';

class Project {
  final String title;
  final String shortDescription;
  final String coverImage;
  final String url;
  final bool isReleased;
  final bool isExternalUrl;

  const Project({
    @required this.title,
    this.shortDescription = '',
    this.coverImage = 'assets/images/project_placeholder.webp',
    this.url = '',
    this.isReleased = false,
    this.isExternalUrl = false
  });
}
