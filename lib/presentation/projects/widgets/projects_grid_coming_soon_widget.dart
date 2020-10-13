import 'package:fedemas_app/core/utils/text_style_utils.dart';
import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';

class ProjectGridComingSoon extends StatelessWidget {
  final _borderRadius = BorderRadius.circular(8.0);

  ProjectGridComingSoon();

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
          border: Border.all(
            width: 2,
            color: const Color(0x10A8A6A1),
          ),
          borderRadius: _borderRadius),
      child: Center(
        child: Text(
          'Coming Soon',
          style: TextStyleUtils.of(context)
              .subTitle
              .copyWith(color: const Color(0x40A8A6A1)),
        ),
      ),
    );
  }
}
