# mapkit_js

[![pub package](https://img.shields.io/pub/v/mapkit_js.svg)](https://pub.dartlang.org/packages/mapkit_js)


**[English](https://github.com/zuvola/mapkit_js/blob/master/README.md), [日本語](https://github.com/zuvola/mapkit_js/blob/master/README_jp.md)**

This is a Dart implementation of Apple's MapKitJS that allows you to embed Apple Maps into your web pages.
See Apple's page for more detailed explanation.
https://developer.apple.com/documentation/mapkitjs


## Getting started

```dart
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
            map.setCenterAnimated(
                mapkit.Coordinate(37.415.toJS, (-122.048333).toJS), true);
          }.toJS,
          null);
    });
  }.toJS));
}
```

## TokenID

If you put the TokenID in build.yaml as follows, you can get the value with String.fromEnvironment in Dart.

```yaml
global_options:
  build_web_compilers|ddc:
    options:
      environment:
        TokenID: <YOUR_TOKEN>
```
```dart
  const tokenID = String.fromEnvironment('TokenID');
```

## Build

I have also created a tool to automatically generate the api. The following command will generate mapkit_js_api.dart.

```dart
dart tool/main.dart
```

## Additional information

I have done very little testing. If you would like to help me, I would appreciate it if you could give me a PR.
