# mapkit_js

[![pub package](https://img.shields.io/pub/v/mapkit_js.svg)](https://pub.dartlang.org/packages/mapkit_js)


**[English](https://github.com/zuvola/mapkit_js/blob/master/README.md), [日本語](https://github.com/zuvola/mapkit_js/blob/master/README_jp.md)**

AppleのMapKitJSのDart実装です。Apple Mapsをウェブページに埋め込む事ができます。
より詳しい説明はAppleのページを参照してください。
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

build.yamlに次のようにTokenIDを記述しておけば、DartのString.fromEnvironmentで値を取得できるようになります。

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

apiを自動で生成するツールも作りました。下記コマンドでmapkit_js_api.dartが生成されます。

```dart
dart tool/main.dart
```

## Additional information

ほとんどテストしていません。もしよろしければ、PRを頂ければ幸いです。
