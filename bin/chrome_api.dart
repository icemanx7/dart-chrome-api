@JS()
library chrome;

import 'dart:developer';
import 'package:chrome_api/runtime/runtime.dart';
import 'package:chrome_api/tabs/tabs.dart';
import 'package:js/js.dart';

void main() {
  void tabListenerFunction(int tabId, ChangeInfo changeInfo, Tab tab) {
    if (changeInfo.status == 'loading') {
      print(changeInfo.status);
      print(tab.url);
    }
  }

  print(ChromeRuntime.id);
  print(ChromeTabs.TAB_ID_NONE);

  ChromeTabs.onUpdated.addListener(allowInterop(tabListenerFunction));
  ChromeWebTabs()
      .create(CreateProperties(url: 'https://www.google.com'))
      .then((value) {
    print(value);
  });

  // ChromeTabs.create(CreateProperties(url: 'https://www.google.com'),
  //     allowInterop((tab) => {print(tab.discarded)}));
}
