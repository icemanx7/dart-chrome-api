import 'dart:async';
import 'package:js/js.dart';
import 'package:js/js_util.dart';

//TODO: Proper enum support maybe?
enum TabStatus { unloaded, loading, complete }

class ChromeWebTabs {
  Future<Tab> create(CreateProperties createProperties) async {
    Completer callBackToFuture = new Completer();
    var returnedFuture = ChromeTabs.create(createProperties);
    return promiseToFuture(returnedFuture);
  }
}

@JS('chrome.tabs')
class ChromeTabs {
  external factory ChromeTabs();
  external static void loadTimes();
  external static get TAB_ID_NONE;
  external static getCurrent(void Function() callback);
  external static Tab create(CreateProperties createProperties);
  external static OnUpdated get onUpdated;
}

@JS()
class OnUpdated {
  external factory OnUpdated();
  external addListener(
      void Function(int tabId, ChangeInfo changeInfo, Tab tab) callback);
}

@JS()
@anonymous
class Tab {
  external factory Tab({String url});
  external bool get active;
  external bool get audible;
  external bool get autoDiscardable;
  external bool get discarded;
  external String get favIconUrl;
  external int get groupId;
  external int get height;
  external bool get highlighted;
  external int get id;
  external bool get incognito;
  external int get index;
  // MutedInfo type
  external int get openerTabId;
  external String get pendingUrl;
  external bool get pinded;
  external String get sessionId;
  external String get status;
  external String get title;
  external String get url;
  external int get optional;
  external int get windowId;
}

@JS()
@anonymous
class ChangeInfo {
  external bool get audible;
  external bool get autoDiscardable;
  external bool get discarded;
  external String get favIconUrl;
  external int get groupId;
  external Object get mutedInfo;
  external bool get pinned;
  external TabStatus get status;
  external String get title;
  external String get url;
}

@JS()
@anonymous
class CreateProperties {
  external factory CreateProperties({String url});
  bool active;
  num index;
  num openerTabId;
  bool pinned;
  bool selected;
  num windowId;
}
