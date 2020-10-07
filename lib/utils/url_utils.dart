import 'dart:js' as js;

import 'package:firebase_analytics/firebase_analytics.dart';

class UrlUtils {
  static void openUrl(String url) {
    final _analytics = FirebaseAnalytics();
    _analytics.logEvent(name: "Clicked URL", parameters: {"url": url});
    js.context.callMethod("open", [url]);
  }
}
