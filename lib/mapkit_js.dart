/// Dart implementation of Apple's MapKitJS. Embedding Apple Maps on the Web.
library;

import 'dart:async';
import 'dart:js_interop';
import 'package:web/web.dart' as web;

export 'src/mapkit_js_api.dart';

/// Load MapKitJS Script
Future<web.Event> loadMapKitJS(String tokenID,
    {String version = '5.x.x', String libraries = 'map'}) async {
  final completer = Completer<web.Event>();
  final script = web.HTMLScriptElement()
    ..src = 'https://cdn.apple-mapkit.com/mk/$version/mapkit.core.js'
    ..crossOrigin = 'anonymous'
    ..addEventListener(
        'load',
        (web.Event e) {
          completer.complete(e);
        }.toJS)
    ..setAttribute('data-libraries', libraries)
    ..setAttribute('data-initialToken', tokenID);
  web.document.head?.append(script);

  // As a workaround for RequireJS Define errors.
  final deleteDefine = web.HTMLScriptElement()..text = 'define = undefined;';
  web.document.body?.append(deleteDefine);

  return completer.future;
}

/// Respond to events that trigger when MapKit JS initializes.
extension type InitializationEvent._(JSAny _) implements JSAny {
  external String type;
  external String status;
}
