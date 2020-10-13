import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

import 'screen_utils.dart';

class TextStyleUtils {
  final double _windowHeight;
  final double _windowWidth;

  TextStyleUtils(this._windowWidth, this._windowHeight);

  static TextStyleUtils of(BuildContext context) {
    final mq = MediaQuery.of(context);
    return TextStyleUtils(mq.size.width, mq.size.height);
  }

  TextStyle get heading {
    double fontSize = 0;
    if (_windowWidth >= ScreenUtils.WIDTH_S) {
      fontSize = 64.0;
    } else {
      fontSize = 40.0;
    }
    return TextStyle(
      fontSize: fontSize,
      height: 1.2,
      fontWeight: FontWeight.w700,
    );
  }

  TextStyle get subHeading {
    double fontSize = 0;

    if (_windowWidth >= ScreenUtils.WIDTH_S) {
      fontSize = 32.0;
    } else {
      fontSize = 21.0;
    }

    return TextStyle(
      fontSize: fontSize,
      height: 1.2,
      fontWeight: FontWeight.bold,
      color: const Color(0xFFA8A6A1),
    );
  }

  TextStyle get title {
    double fontSize = 0;

    if (_windowWidth >= ScreenUtils.WIDTH_S) {
      fontSize = 28.0;
    } else {
      fontSize = 24.0;
    }

    return TextStyle(
      fontSize: fontSize,
      height: 1.2,
      fontWeight: FontWeight.bold,
      color: const Color(0xFFE4E7EB),
    );
  }

  TextStyle get subTitle {
    double fontSize = 0;

    if (_windowWidth >= ScreenUtils.WIDTH_S) {
      fontSize = 24.0;
    } else {
      fontSize = 20.0;
    }

    return TextStyle(
      fontSize: fontSize,
      height: 1.8,
      color: const Color(0xFFA8A6A1),
    );
  }

  TextStyle get body {
    double fontSize = 0;

    if (_windowWidth >= ScreenUtils.WIDTH_S) {
      fontSize = 19.0;
    } else {
      fontSize = 17.0;
    }

    return TextStyle(
      fontSize: fontSize,
      height: 1.8,
      color: const Color(0xFFA8A6A1),
    );
  }

  TextStyle get small {
    double fontSize = 0;

    if (_windowWidth >= ScreenUtils.WIDTH_S) {
      fontSize = 16.0;
    } else {
      fontSize = 14.0;
    }

    return TextStyle(
      fontSize: fontSize,
      height: 1.8,
      color: const Color(0xFFA8A6A1),
    );
  }
}
