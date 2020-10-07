import 'dart:js' as js;

class UrlUtils {
  static void openUrl(String url) {
    js.context.callMethod("open", [url]);
  }
}
