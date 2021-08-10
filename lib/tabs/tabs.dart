import 'package:js/js.dart';

enum TabStatus { unloaded, loading, complete }

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
