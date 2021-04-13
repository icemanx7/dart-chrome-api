@JS()
library chrome;

import 'dart:js_util';

import 'package:js/js.dart';

@JS('chrome.runtime')
class ChromeRuntime {
  external factory ChromeRuntime();
  external static void loadTimes();
  external static String get id;
}

@JS('chrome.tabs')
class ChromeTabs {
  external factory ChromeTabs();
  external static void loadTimes();
  external static get TAB_ID_NONE;
  external static getCurrent(void Function() callback);
  external static create(
      CreateProperties createProperties, void Function(Tab tab) callback);
}

@JS()
class CreateProperties {
  bool active;
  num index;
  num openerTabId;
  bool pinned;
  bool selected;
  String url;
  num windowId;
}

@JS()
class Tab {
  bool active;
}

void main() {
  print('Hello world TESTING THE THING');
  print(ChromeRuntime.id);
  print(ChromeTabs.TAB_ID_NONE);
  // print(three);

  // print(ChromeTabs.getCurrent());
  ChromeTabs.create(
      CreateProperties(), allowInterop((tab) => print(tab.active)));
}
