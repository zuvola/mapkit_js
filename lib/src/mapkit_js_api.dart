@JS('mapkit')
library;

import 'dart:js_interop';

/// Initializes MapKit JS by providing an authorization callback function and optional language.
@JS()
external void init(MapKitInitOptions options);

/// A string that describes the list of loaded libraries.
@JS()
external JSArray<JSString> loadedLibraries;

/// Initialization options for MapKit JS.
extension type MapKitInitOptions._(JSObject _) implements JSObject {
  external MapKitInitOptions(
      {JSFunction authorizationCallback, String language});

  /// An ID that indicates the preferred language to use when displaying map labels, controls, directions, and other text.
  external String language;

  /// A callback function that obtains a token.
  external JSFunction authorizationCallback;
}

/// An embeddable interactive map that you add to a webpage.
extension type Map._(JSObject _) implements JSObject {
  /// Creates a map you embed on a webpage and initializes it with the constructor options you choose.
  external Map(String parent);
}
