import 'dart:js_interop';
import 'package:mapkit_js/mapkit_js.dart' as mapkit;

void main() async {
  // You need to prepare TokenID.
  // https://developer.apple.com/documentation/mapkitjs/creating_a_maps_identifier_and_a_private_key
  const tokenID = String.fromEnvironment('TokenID');
  // Load MapKitJS Script
  await mapkit.loadMapKitJS(tokenID);
  // Initializes MapKit JS
  mapkit.init(mapkit.MapKitInitOptions(
      authorizationCallback: (JSFunction done) {
    // done() to return the token
    done.callAsFunction(null, tokenID.toJS);
    // Wait until library loading is complete
    Future.doWhile(() async {
      if (mapkit.loadedLibraries.toDart.isEmpty) {
        await Future.delayed(Duration(milliseconds: 100));
        return true;
      }
      return false;
    }).whenComplete(() {
      // Creates a map
      final map = mapkit.Map('map'.toJS, null);
      map.addEventListener(
          'region-change-end',
          (JSAny e) {
            print(map.center);
          }.toJS,
          null);
      map.addEventListener(
          'single-tap',
          (JSAny e) {
            map.setCenterAnimated(mapkit.Coordinate(37.415, -122.048333), true);
          }.toJS,
          null);
    });
  }.toJS));
}
