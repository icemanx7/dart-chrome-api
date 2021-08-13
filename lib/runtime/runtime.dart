import 'package:js/js.dart';

@JS('chrome.runtime')
class ChromeRuntime {
  external factory ChromeRuntime();
  external static void loadTimes();
  external static String get id;
}
