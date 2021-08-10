@JS()
library chrome;

import 'package:chrome_api/tabs/tabs.dart';
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
  external static OnUpdated get onUpdated;
}

@JS()
class OnUpdated {
  external factory OnUpdated();
  external addListener(
      void Function(int tabId, ChangeInfo changeInfo, Tab tab) callback);
}

void main() {
  void tabListenerFunction(int tabId, ChangeInfo changeInfo, Tab tab) {
    if (changeInfo.status == 'loading') {
      print(changeInfo.status);
      print(tab.url);
    }
  }

  print('Hello world TESTING THE THING');
  print(ChromeRuntime.id);
  print(ChromeTabs.TAB_ID_NONE);
  // print(three);

  // print(ChromeTabs.getCurrent());
  ChromeTabs.onUpdated.addListener(allowInterop(tabListenerFunction));

  ChromeTabs.create(CreateProperties(url: 'https://www.google.com'),
      allowInterop((tab) => {print(tab.discarded)}));
}
