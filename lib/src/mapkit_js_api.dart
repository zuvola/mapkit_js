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

  /// Adds an event listener to handle events that user interactions and the framework trigger.
  external void addEventListener(
      String type, JSFunction listener, JSAny? thisObject);

  /// Removes an event listener.
  external void removeEventListener(
      String type, JSFunction listener, JSAny? thisObject);

  /// The map coordinate at the center of the map view.
  external Coordinate center;

  /// Centers the map to the provided coordinate, with optional animation.
  external void setCenterAnimated(Coordinate coordinate, JSBoolean? animate);
}

/// An object representing the latitude and longitude for a point on the Earth’s surface.
extension type Coordinate._(JSObject _) implements JSObject {
  /// Creates a coordinate object with the specified latitude and longitude.
  external Coordinate(JSNumber latitude, JSNumber longitude);

  /// The latitude, in degrees.
  external JSNumber latitude;

  /// The longitude, in degrees.
  external JSNumber longitude;

  /// Returns a copy of the coordinate.
  external Coordinate copy();

  /// Returns a Boolean value indicating whether two coordinates are equal.
  external JSBoolean equals(Coordinate anotherCoordinate);
}
