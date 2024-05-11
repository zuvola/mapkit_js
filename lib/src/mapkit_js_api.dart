@JS('mapkit')
library;

import 'dart:js_interop';
import 'package:web/web.dart' as web;

typedef MapTypes = JSString;
typedef LoadPriorities = JSString;
typedef ColorSchemes = JSString;
typedef Distances = JSString;
typedef CollisionMode = JSString;
typedef DisplayPriority = JSString;
typedef FeatureVisibility = JSString;
typedef PointOfInterestCategory = JSString;
typedef MapFeatureType = JSString;
typedef Transport = JSString;

/// The list of available libraries.
@JS()
// ignore: non_constant_identifier_names
external JSArray<JSString> Libraries;

/// A string that describes the list of loaded libraries.
@JS()
external JSArray<JSString> loadedLibraries;

/// An array that automatically adds and removes maps as the framework creates and destroys them.
@JS()
external JSArray<Map> maps;

/// A language ID indicating the selected language.
@JS()
external String language;

/// The build string.
@JS()
external String build;

/// The version of MapKit JS.
@JS()
external String version;

/// Initializes MapKit JS by providing an authorization callback function and optional language.
@JS()
external void init(MapKitInitOptions options);

/// Tells MapKit JS which libraries to load.
@JS()
external void load(JSAny libraries);

/// Subscribes a listener function to an event type.
@JS()
external void addEventListener(
    String type, JSFunction listener, JSObject? thisObject);

/// Unsubscribes a listener function from an event type.
@JS()
external void removeEventListener(
    String type, JSFunction listener, JSObject? thisObject);

/// Converts imported GeoJSON data to MapKit JS items.
@JS()
external JSAny importGeoJSON(JSAny data, JSAny callback);

/// Initialization options for MapKit JS.
extension type MapKitInitOptions._(JSObject _) implements JSObject {
  external MapKitInitOptions(
      {String language,
      JSArray<JSString> libraries,
      JSFunction authorizationCallback});

  /// An ID that indicates the preferred language to use when displaying map labels, controls, directions, and other text.
  external String language;

  /// An array of libraries to load at initialization.
  external JSArray<JSString> libraries;

  /// A callback function that obtains a token.
  external void authorizationCallback(JSFunction done);
}

/// An embeddable interactive map that you add to a webpage.
extension type Map._(JSObject _) implements JSObject {
  /// Creates a map you embed on a webpage and initializes it with the constructor options you choose.
  external Map(JSAny parent, MapConstructorOptions? options);

  /// A Boolean value that indicates whether map rotation is available.
  external bool isRotationAvailable;

  /// A Boolean value that determines whether the user may rotate the map using the compass control or a rotate gesture.
  external bool isRotationEnabled;

  /// A Boolean value that determines whether the user can cause the map to scroll with a pointing device or with gestures on a touchscreen.
  external bool isScrollEnabled;

  /// A Boolean value that determines whether the user may zoom in and out on the map using pinch gestures or the zoom control.
  external bool isZoomEnabled;

  /// The map coordinate at the center of the map view.
  external Coordinate center;

  /// The area the map is displaying.
  external CoordinateRegion region;

  /// The map’s rotation, in degrees.
  external double rotation;

  /// The visible area of the map, in map units.
  external MapRect visibleMapRect;

  /// A constraint of the location of the center of the map.
  external CameraBoundaryDescription cameraBoundary;

  /// The altitude of the camera relative to the elevation of the center of the map.
  external double cameraDistance;

  /// The minimum and maximum distances of the camera from the map center.
  external CameraZoomRange cameraZoomRange;

  /// A feature visibility setting that determines when the compass is visible.
  external String showsCompass;

  /// A Boolean value that determines whether to display a control that lets users choose the map type.
  external bool showsMapTypeControl;

  /// A feature visibility setting that determines when the map displays the map’s scale indicator.
  external String showsScale;

  /// A Boolean value that determines whether the user location control is visible.
  external bool showsUserLocationControl;

  /// A Boolean value that determines whether to display a control for zooming in and zooming out on a map.
  external bool showsZoomControl;

  /// The map’s color scheme when displaying standard or muted standard map types.
  external String colorScheme;

  /// The system of measurement that displays on the map.
  external String distances;

  /// The type of data that the map displays.
  external String mapType;

  /// The map’s inset margins.
  external Padding padding;

  /// The filter that determines the points of interest that display on the map.
  external PointOfInterestFilter pointOfInterestFilter;

  /// A Boolean value that determines whether the map displays points of interest.
  external bool showsPointsOfInterest;

  /// The CSS color that MapKit JS uses for user interface controls on the map.
  external String tintColor;

  /// An array of all the annotations on the map.
  external JSArray<Annotation> annotations;

  /// The selected annotation.
  external Annotation selectedAnnotation;

  /// An array of all of the map’s overlays.
  external JSArray<Overlay> overlays;

  /// The selected overlay on the map.
  external Overlay selectedOverlay;

  /// An array of all of the map’s tile overlays.
  external JSArray<TileOverlay> tileOverlays;

  /// A Boolean value that determines whether to show the user’s location on the map.
  external bool showsUserLocation;

  /// A Boolean value that determines whether to center the map on the user’s location.
  external bool tracksUserLocation;

  /// An annotation that indicates the user’s location on the map.
  external Annotation? userLocationAnnotation;

  /// The map’s DOM element.
  external web.Element element;

  /// An array of map features that users can select from the map.
  external JSArray<MapFeatureType> selectableMapFeatures;

  /// A value MapKit JS uses for prioritizing the visibility of specific map features before the underlaying map tiles.
  external JSAny loadPriority;

  /// Adds an event listener to handle events that user interactions and the framework trigger.
  external void addEventListener(
      String type, JSFunction listener, JSObject? thisObject);

  /// Removes an event listener.
  external void removeEventListener(
      String type, JSFunction listener, JSObject? thisObject);

  /// Centers the map to the provided coordinate, with optional animation.
  external Map setCenterAnimated(Coordinate coordinate, bool? animate);

  /// Changes the map’s region to the provided region, with optional animation.
  external Map setRegionAnimated(CoordinateRegion region, bool? animate);

  /// Changes the map’s rotation setting to the number of specified degrees.
  external Map setRotationAnimated(double degrees, bool? animate);

  /// Changes the map’s visible map rectangle to the specified map rectangle.
  external Map setVisibleMapRectAnimated(MapRect mapRect, bool? animate);

  /// Changes the map’s camera boundary with an animated transition.
  external Map setCameraBoundaryAnimated(JSAny mapRect, bool? animate);

  /// Changes the map’s camera distance with an animated transition.
  external Map setCameraDistanceAnimated(double distance, bool? animate);

  /// Changes the map’s camera zoom range with an animated transition.
  external Map setCameraZoomRangeAnimated(
      CameraZoomRange cameraZoomRange, bool? animate);

  /// Adjusts the map’s visible region to bring the specified overlays and annotations into view.
  external JSAny showItems(JSAny items, MapShowItemsOptions? options);

  /// A delegate method for modifying an annotation that represents a group of annotations that the framework combines into a cluster.
  external void annotationForCluster(Annotation clusterAnnotation);

  /// Returns the list of annotation objects within the specified map rectangle.
  external JSArray<Annotation> annotationsInMapRect(MapRect mapRect);

  /// Adds an annotation to the map.
  external Annotation addAnnotation(Annotation annotation);

  /// Adds an array of annotations to the map.
  external JSArray<Annotation> addAnnotations(JSArray<Annotation> annotations);

  /// Removes an annotation from the map.
  external Annotation removeAnnotation(Annotation annotation);

  /// Removes multiple annotations from the map.
  external JSArray<Annotation> removeAnnotations(
      JSArray<Annotation> annotations);

  /// Returns an array of overlays at a given point on the webpage.
  external JSArray<Overlay> overlaysAtPoint(web.DOMPoint point);

  /// Adds an overlay to the map.
  external Overlay addOverlay(Overlay overlay);

  /// Adds multiple overlays to the map.
  external JSArray<Overlay> addOverlays(JSArray<Overlay> overlays);

  /// Removes an overlay from the map.
  external Overlay removeOverlay(Overlay overlay);

  /// Removes multiple overlays from the map.
  external JSArray<Overlay> removeOverlays(JSArray<Overlay> overlays);

  /// Returns the topmost overlay at a given point on the webpage.
  external Overlay topOverlayAtPoint(web.DOMPoint point);

  /// Adds a collection of annotations, overlays, or other item collections to the map.
  external JSAny addItems(JSAny items);

  /// Removes a collection of annotations, overlays, or other item collections from the map.
  external JSAny removeItems(JSAny items);

  /// Adds a tile overlay to the map.
  external TileOverlay addTileOverlay(TileOverlay tileOverlay);

  /// Adds an array of tile overlays to the map.
  external JSArray<TileOverlay> addTileOverlays(
      JSArray<TileOverlay> tileOverlays);

  /// Removes a tile overlay from the map.
  external TileOverlay removeTileOverlay(TileOverlay tileOverlay);

  /// Removes an array of tile overlays from the map.
  external JSArray<TileOverlay> removeTileOverlays(
      JSArray<TileOverlay> tileOverlays);

  /// Converts a coordinate on the map to a point in the page’s coordinate system.
  external web.DOMPoint convertCoordinateToPointOnPage(Coordinate coordinate);

  /// Converts a point in page coordinates to the corresponding map coordinate.
  external Coordinate convertPointOnPageToCoordinate(web.DOMPoint point);

  /// Removes the map’s element from the DOM and releases internal references to the map to free up memory.
  external void destroy();

  /// The method MapKit JS calls when the framework creates a map feature annotation.
  external void annotationForMapFeature(
      MapFeatureAnnotation mapFeatureAnnotation);
}

/// An object that contains options for creating a map’s features.
extension type MapConstructorOptions._(JSObject _) implements JSObject {
  external MapConstructorOptions(
      {MapRect visibleMapRect,
      CoordinateRegion region,
      Coordinate center,
      double rotation,
      String tintColor,
      String colorScheme,
      String mapType,
      Padding padding,
      bool showsMapTypeControl,
      bool isRotationEnabled,
      String showsCompass,
      bool isZoomEnabled,
      bool showsZoomControl,
      bool isScrollEnabled,
      String showsScale,
      JSArray<Annotation> annotations,
      Annotation selectedAnnotation,
      JSArray<Overlay> overlays,
      Overlay selectedOverlay,
      bool showsPointsOfInterest,
      PointOfInterestFilter pointOfInterestFilter,
      bool showsUserLocation,
      bool tracksUserLocation,
      bool showsUserLocationControl,
      JSAny loadPriority,
      JSFunction annotationForCluster});

  /// The visible area of the map, in map units.
  external MapRect visibleMapRect;

  /// The area the map is displaying.
  external CoordinateRegion region;

  /// The map coordinate at the center of the map view.
  external Coordinate center;

  /// The map’s rotation, in degrees.
  external double rotation;

  /// The CSS color that MapKit JS uses for the user interface controls on the map.
  external String tintColor;

  /// The map’s color scheme when displaying standard or muted standard map types.
  external String colorScheme;

  /// The type of data that the map view displays.
  external String mapType;

  /// The map's inset margins.
  external Padding padding;

  /// A Boolean value that determines whether to display a control that lets users choose the map type.
  external bool showsMapTypeControl;

  /// A Boolean value that determines whether the user may rotate the map using the compass control or a rotate gesture.
  external bool isRotationEnabled;

  /// A feature visibility setting that determines when the compass is visible.
  external String showsCompass;

  /// A Boolean value that determines whether the user may zoom in and out on the map using pinch gestures or the zoom control.
  external bool isZoomEnabled;

  /// A Boolean value that determines whether to display a control for zooming in and zooming out on a map.
  external bool showsZoomControl;

  /// A Boolean value that determines whether the user may scroll the map with a pointing device or gestures on a touchscreen.
  external bool isScrollEnabled;

  /// A feature visibility setting that allows you to determine when to display the map’s scale.
  external String showsScale;

  /// An array holding all the annotations on the map.
  external JSArray<Annotation> annotations;

  /// The selected annotation on the map.
  external Annotation selectedAnnotation;

  /// An array that contains all of the map’s overlays.
  external JSArray<Overlay> overlays;

  /// The selected overlay on the map.
  external Overlay selectedOverlay;

  /// A Boolean value that determines whether the map displays points of interest.
  external bool showsPointsOfInterest;

  /// The filter that determines the points of interest that display on the map.
  external PointOfInterestFilter pointOfInterestFilter;

  /// A Boolean value that determines whether to show the user’s location on the map.
  external bool showsUserLocation;

  /// A Boolean value that determines whether to center the map on the user’s location.
  external bool tracksUserLocation;

  /// A Boolean value that determines whether the user location control is visible.
  external bool showsUserLocationControl;

  /// A value MapKit JS uses for prioritizing the visibility of specific map features before the underlaying map tiles.
  external JSAny loadPriority;

  /// Modifies cluster annotations.
  external void annotationForCluster(Annotation clusterAnnotation);
}

/// An object literal containing at least one property defining an area on the map.
extension type CameraBoundaryDescription._(JSObject _) implements JSObject {
  external CameraBoundaryDescription(
      {MapRect mapRect, CoordinateRegion region});

  /// A rectangular area on a two-dimensional map projection.
  external MapRect mapRect;

  /// A rectangular area on a map, defined by coordinates of the rectangle's northeast and southwest corners.
  external CoordinateRegion region;
}

/// An object literal containing minimum and maximum camera distance in meters.
extension type CameraZoomRangeLiteral._(JSObject _) implements JSObject {
  external CameraZoomRangeLiteral(
      {double minCameraDistance, double maxCameraDistance});

  /// The minimum allowed distance of the camera from the center of the map in meters.
  external double minCameraDistance;

  /// The maximum allowed distance of the camera from the center of the map in meters.
  external double maxCameraDistance;
}

/// Options that determine the map parameters to use when showing items.
extension type MapShowItemsOptions._(JSObject _) implements JSObject {
  external MapShowItemsOptions(
      {bool animate, CoordinateSpan minimumSpan, Padding padding});

  /// A Boolean value that determines whether the map animates as the map region changes to show the items.
  external bool animate;

  /// The minimum longitudinal and latitudinal span the map displays.
  external CoordinateSpan minimumSpan;

  /// Spacing that the framework adds around the computed map region when showing items.
  external Padding padding;
}

/// The base annotation object for creating custom annotations.
extension type Annotation._(JSObject _) implements JSObject {
  /// Creates a new annotation given its location and initialization options.
  external Annotation(JSAny location, JSFunction factory,
      AnnotationConstructorOptions? options);

  /// The map that the framework adds the annotation to.
  external Map map;

  /// The annotation’s element in the DOM.
  external web.Element element;

  /// Data that you define that’s specific to an annotation.
  external JSObject data;

  /// The text to display in the annotation’s callout.
  external String title;

  /// The text to display as a subtitle on the second line of an annotation’s callout.
  external String subtitle;

  /// Accessibility text for the annotation.
  external String accessibilityLabel;

  /// The annotation’s coordinate.
  external Coordinate coordinate;

  /// An offset that changes the annotation’s default anchor point.
  external web.DOMPoint anchorOffset;

  /// A CSS animation that runs when the annotation appears on the map.
  external String appearanceAnimation;

  /// A numeric hint that the map uses to prioritize how it displays annotations.
  external double displayPriority;

  /// Spacing to add around the annotation when showing items.
  external Padding padding;

  /// The desired dimensions of the annotation, in CSS pixels.
  external JSObject size;

  /// A Boolean value that determines whether the annotation is visible or hidden.
  external bool visible;

  /// A Boolean value that determines whether the framework animates the annotation.
  external bool animates;

  /// A Boolean value that determines whether the user can drag the annotation.
  external bool draggable;

  /// A Boolean value that indicates whether the map shows the annotation in a selected state.
  external bool selected;

  /// A Boolean value that determines whether the annotation responds to user interaction.
  external bool enabled;

  /// A delegate that enables you to customize the annotation’s callout.
  external AnnotationCalloutDelegate callout;

  /// A Boolean value that determines whether the map shows an annotation’s callout.
  external bool calloutEnabled;

  /// An offset that changes the annotation callout’s default placement.
  external web.DOMPoint calloutOffset;

  /// An array of annotations that the framework groups together in a cluster.
  external JSArray<Annotation> memberAnnotations;

  /// An identifier for grouping annotations into the same cluster.
  external String clusteringIdentifier;

  /// A mode that determines the shape of the collision frame.
  external String collisionMode;

  /// Adds an event listener to handle events that user interactions with annotations trigger.
  external void addEventListener(
      String type, JSFunction listener, JSObject? thisObject);

  /// Removes an event listener.
  external void removeEventListener(
      String type, JSFunction listener, JSObject? thisObject);
}

/// An object that contains options for creating annotation features.
extension type AnnotationConstructorOptions._(JSObject _) implements JSObject {
  external AnnotationConstructorOptions(
      {JSObject data,
      String title,
      String subtitle,
      String accessibilityLabel,
      web.DOMPoint anchorOffset,
      String appearanceAnimation,
      double displayPriority,
      Padding padding,
      JSObject size,
      bool visible,
      bool animates,
      bool draggable,
      bool enabled,
      bool selected,
      Place place,
      AnnotationCalloutDelegate callout,
      bool calloutEnabled,
      web.DOMPoint calloutOffset,
      String clusteringIdentifier,
      String collisionMode});

  /// Data that you define and assign to the annotation.
  external JSObject data;

  /// The text to display in the annotation’s callout.
  external String title;

  /// The text to display as a subtitle on the second line of an annotation’s callout.
  external String subtitle;

  /// Accessibility text for the annotation.
  external String accessibilityLabel;

  /// The offset, in CSS pixels, of the element from the bottom center.
  external web.DOMPoint anchorOffset;

  /// A CSS animation that runs when the annotation appears on the map.
  external String appearanceAnimation;

  /// A hint the map uses to prioritize displaying the annotation.
  external double displayPriority;

  /// Spacing to add around the annotation when showing items.
  external Padding padding;

  /// The desired dimensions of the annotation, in CSS pixels.
  external JSObject size;

  /// A Boolean value that determines whether the annotation is visible or hidden.
  external bool visible;

  /// A Boolean value that determines whether the map animates the annotation.
  external bool animates;

  /// A Boolean value that determines whether the user can drag the annotation.
  external bool draggable;

  /// A Boolean value that determines whether the annotation responds to user interaction.
  external bool enabled;

  /// A Boolean value that determines whether the map displays the annotation in a selected state.
  external bool selected;

  /// An object that allows a custom annotation to potentially supecede a point of interest at the same map coordinates.
  external Place place;

  /// A delegate that enables you to customize the annotation’s callout.
  external AnnotationCalloutDelegate callout;

  /// A Boolean value that determines whether the map shows a callout.
  external bool calloutEnabled;

  /// The offset, in CSS pixels, of a callout from the top center of the element.
  external web.DOMPoint calloutOffset;

  /// An identifier for grouping annotations into the same cluster.
  external String clusteringIdentifier;

  /// A mode that determines the shape of the collision frame.
  external String collisionMode;
}

/// Methods for customizing the behavior and appearance of an annotation callout.
extension type AnnotationCalloutDelegate._(JSObject _) implements JSObject {
  external AnnotationCalloutDelegate(
      {JSFunction calloutAnchorOffsetForAnnotation,
      JSFunction calloutShouldAppearForAnnotation,
      JSFunction calloutShouldAnimateForAnnotation,
      JSFunction calloutAppearanceAnimationForAnnotation,
      JSFunction calloutContentForAnnotation,
      JSFunction calloutElementForAnnotation,
      JSFunction calloutLeftAccessoryForAnnotation,
      JSFunction calloutRightAccessoryForAnnotation});

  /// Returns a point determining the callout's anchor offset.
  external web.DOMPoint calloutAnchorOffsetForAnnotation(
      Annotation annotation, JSObject size);

  /// Determines whether the callout appears for an annotation.
  external bool calloutShouldAppearForAnnotation(Annotation annotation);

  /// Determines whether the callout animates.
  external bool calloutShouldAnimateForAnnotation(Annotation annotation);

  /// Returns a CSS animation to use when the callout appears.
  external String calloutAppearanceAnimationForAnnotation(
      Annotation annotation);

  /// Returns custom content for the callout bubble.
  external web.Element calloutContentForAnnotation(Annotation annotation);

  /// Returns an element representing a custom callout.
  external web.Element calloutElementForAnnotation(Annotation annotation);

  /// Returns an element to use as a custom accessory on the left side of the callout content area.
  external web.Element calloutLeftAccessoryForAnnotation(Annotation annotation);

  /// Returns an element to use as a custom accessory on the right side of the callout content area.
  external web.Element calloutRightAccessoryForAnnotation(
      Annotation annotation);
}

/// A customized annotation with image resources that you provide.
extension type ImageAnnotation._(JSObject _) implements Annotation {
  /// Creates an image annotation with a URL to its image and a coordinate.
  external ImageAnnotation(
      JSAny location, ImageAnnotationConstructorOptions? options);

  /// An object containing URLs for the image assets in multiple resolutions.
  external JSAny url;
}

/// An object containing options for creating an image annotation.
extension type ImageAnnotationConstructorOptions._(JSObject _)
    implements AnnotationConstructorOptions {
  external ImageAnnotationConstructorOptions({JSObject url});

  /// An object containing URLs for the image assets in multiple resolutions.
  external JSObject url;
}

/// An annotation that displays a balloon-shaped marker at the designated location.
extension type MarkerAnnotation._(JSObject _) implements Annotation {
  /// Creates a marker annotation at the coordinate location with provided options.
  external MarkerAnnotation(
      JSAny location, MarkerAnnotationConstructorOptions? options);

  /// A value that determines the behavior of the subtitle’s visibility.
  external String subtitleVisibility;

  /// A value that determines the behavior of the title’s visibility.
  external String titleVisibility;

  /// The background color of the balloon.
  external String color;

  /// The fill color of the glyph.
  external String glyphColor;

  /// The text to display in the marker balloon.
  external String glyphText;

  /// The image to display in the marker balloon.
  external JSAny glyphImage;

  /// The image to display in the marker balloon when the user selects the marker.
  external JSAny selectedGlyphImage;
}

/// An object containing the options that create a marker annotation.
extension type MarkerAnnotationConstructorOptions._(JSObject _)
    implements AnnotationConstructorOptions {
  external MarkerAnnotationConstructorOptions(
      {String color,
      String glyphColor,
      String glyphText,
      JSObject glyphImage,
      JSObject selectedGlyphImage,
      String subtitleVisibility,
      String titleVisibility});

  /// The background color of the balloon.
  external String color;

  /// The fill color of the glyph.
  external String glyphColor;

  /// The text to display in the marker balloon.
  external String glyphText;

  /// The image to display in the marker balloon.
  external JSObject glyphImage;

  /// The image to display in the balloon when the user selects the marker.
  external JSObject selectedGlyphImage;

  /// A value that determines the behavior of the subtitle’s visibility.
  external String subtitleVisibility;

  /// A value that determines the behavior of the title’s visibility.
  external String titleVisibility;
}

/// An abstract base object that defines the methods and attributes for map overlays.
extension type Overlay._(JSObject _) implements JSObject {
  external Overlay(
      {JSObject data,
      bool visible,
      bool enabled,
      bool selected,
      Style style,
      Map map,
      JSFunction addEventListener,
      JSFunction removeEventListener});

  /// Custom data to associate with the overlay.
  external JSObject data;

  /// A Boolean value that determines whether an overlay is visible.
  external bool visible;

  /// A Boolean value that determines whether the overlay responds to user interaction.
  external bool enabled;

  /// A Boolean value that indicates whether the user selects the overlay.
  external bool selected;

  /// Style properties to apply to the overlay.
  external Style style;

  /// The map you add the overlay to.
  external Map map;

  /// Starts listening for the specified type of event.
  external void addEventListener(
      String type, JSFunction listener, JSObject? thisObject);

  /// Stops listening for the specified type of event.
  external void removeEventListener(
      String type, JSFunction listener, JSObject? thisObject);
}

/// A set of observable attributes for overlays, including the color and opacity of strokes and fills, and line styles.
extension type Style._(JSObject _) implements JSObject {
  /// Creates and initializes a style object.
  external Style(StyleConstructorOptions? options);

  /// The fill color of a shape.
  external String fillColor;

  /// The opacity of the fill color.
  external double fillOpacity;

  /// A rule for determining whether a point is inside or outside a polygon.
  external String fillRule;

  /// The style to use when drawing line endings.
  external String lineCap;

  /// An array of line and gap lengths for creating a dashed line.
  external JSArray<JSNumber> lineDash;

  /// The number of CSS pixels to use as an offset when drawing a line’s dash pattern.
  external double lineDashOffset;

  /// The corner style to apply when joining line segments.
  external String lineJoin;

  /// The width of a line’s stroke, in CSS pixels.
  external double lineWidth;

  /// The gradient to apply along the line.
  external LineGradient lineGradient;

  /// The stroke color of a line.
  external String strokeColor;

  /// The opacity of the stroke color.
  external double strokeOpacity;

  /// The unit distance along the line where a stroke begins.
  external double strokeStart;

  /// The unit distance along the line where a stroke ends.
  external double strokeEnd;
}

/// Initial values of options for applying style to overlays.
extension type StyleConstructorOptions._(JSObject _) implements JSObject {
  external StyleConstructorOptions(
      {String fillColor,
      double fillOpacity,
      String fillRule,
      String lineCap,
      JSArray<JSNumber> lineDash,
      double lineDashOffset,
      String lineJoin,
      double lineWidth,
      String strokeColor,
      double strokeOpacity,
      double strokeStart,
      double strokeEnd,
      LineGradient lineGradient});

  /// The fill color of a shape.
  external String fillColor;

  /// The opacity of the fill color.
  external double fillOpacity;

  /// A rule for determining whether a point is inside or outside a polygon.
  external String fillRule;

  /// The style to use when drawing line endings.
  external String lineCap;

  /// An array of line and gap lengths for creating a dashed line.
  external JSArray<JSNumber> lineDash;

  /// The number of CSS pixels to use as the offset when drawing a line’s dash pattern.
  external double lineDashOffset;

  /// The style to use when drawing joins between line segments.
  external String lineJoin;

  /// The width of a line’s stroke, in CSS pixels.
  external double lineWidth;

  /// The stroke color of a line.
  external String strokeColor;

  /// The opacity of the stroke color.
  external double strokeOpacity;

  /// The unit distance along the line where a stroke begins.
  external double strokeStart;

  /// The unit distance along the line where a stroke ends.
  external double strokeEnd;

  /// The gradient to apply along the line.
  external LineGradient lineGradient;
}

/// A line that displays with a gradient along the length of the line.
extension type LineGradient._(JSObject _) implements JSObject {
  /// Creates a style that renders a gradient along the length of a line.
  external LineGradient(JSObject? options);

  /// Adds a color transition point to the gradient.
  external void addColorStop(double offset, String color);

  /// Adds a color transition at the index point in the list of points within a polyline.
  external void addColorStopAtIndex(int index, String color);
}

/// A circular overlay with a configurable radius that centers on a specific geographic coordinate.
extension type CircleOverlay._(JSObject _) implements Overlay {
  /// Creates a circle overlay with a center coordinate, radius, and style options.
  external CircleOverlay(
      Coordinate coordinate, double radius, StylesOverlayOptions? options);

  /// The coordinate of the circle overlay’s center.
  external Coordinate coordinate;

  /// The circle overlay’s radius, in meters.
  external double radius;
}

/// An observable set of style attributes for an overlay.
extension type StylesOverlayOptions._(JSObject _) implements OverlayOptions {
  external StylesOverlayOptions({Style style});

  /// An object literal of style properties.
  external Style style;
}

/// An overlay of connected line segments that don’t form a closed shape.
extension type PolylineOverlay._(JSObject _) implements Overlay {
  /// Creates a polyline overlay with coordinate points and style options.
  external PolylineOverlay(
      JSArray<Coordinate> points, StylesOverlayOptions? options);

  /// An array of coordinate points that define the polyline overlay’s shape.
  external JSArray<Coordinate> points;
}

/// An overlay consisting of one or more points that forms a closed shape.
extension type PolygonOverlay._(JSObject _) implements Overlay {
  /// Creates a polygon overlay with an array of points and style options.
  external PolygonOverlay(
      JSArray<Coordinate> points, StylesOverlayOptions? options);

  /// One or more arrays of coordinates that define the polygon overlay shape.
  external JSArray<Coordinate> points;
}

/// A dictionary of options that determines an overlay’s data, and indicates whether it’s visible, in an enabled state, and in a selected state.
extension type OverlayOptions._(JSObject _) implements JSObject {
  external OverlayOptions(
      {JSObject data, bool enabled, bool selected, bool visible});

  /// Custom data to associate with the overlay.
  external JSObject data;

  /// A Boolean value that determines whether the overlay responds to user interaction.
  external bool enabled;

  /// A Boolean value that indicates whether the overlay is in a selected state.
  external bool selected;

  /// A Boolean value that determines if an overlay is visible.
  external bool visible;
}

/// An overlay that covers an area of the map with bitmapped tiles.
extension type TileOverlay._(JSObject _) implements JSObject {
  /// Creates a tile overlay with a URL template and style options.
  external TileOverlay(
      JSAny urlTemplate, TileOverlayConstructorOptions? options);

  /// A string, or callback function that returns a string, with a URL that provides the requested tile.
  external JSAny urlTemplate;

  /// A dictionary of custom properties to use with the URL template.
  external JSObject data;

  /// A number that indicates a tile’s opacity.
  external double opacity;

  /// The maximum zoom level for a tile overlay.
  external double maximumZ;

  /// The minimum zoom level for a tile overlay.
  external double minimumZ;

  /// Listens for events of the specified type.
  external void addEventListener(
      String type, JSFunction listener, JSObject? thisObject);

  /// Stops listening for events of the specified type.
  external void removeEventListener(
      String type, JSFunction listener, JSObject? thisObject);

  /// Reloads the tile overlay for the displayed map region with the latest data values.
  external void reload();
}

/// Attributes for initializing a tile overlay, including minimum and maximum zoom, opacity, and custom data.
extension type TileOverlayConstructorOptions._(JSObject _) implements JSObject {
  external TileOverlayConstructorOptions(
      {JSObject data, double maximumZ, double minimumZ, double opacity});

  /// Custom data for populating the URL template.
  external JSObject data;

  /// The maximum zoom level of the overlay.
  external double maximumZ;

  /// The minimum zoom level of the overlay.
  external double minimumZ;

  /// The opacity level of the overlay.
  external double opacity;
}

/// A geocoder that converts human-readable addresses to geographic coordinates, and vice versa.
extension type Geocoder._(JSObject _) implements JSObject {
  /// Creates a geocoder object and sets optional language and user location properties.
  external Geocoder(GeocoderConstructorOptions? options);

  /// A Boolean value that indicates whether the geocoder returns results near the user’s location.
  external bool getsUserLocation;

  /// A language ID that determines the language to use for displaying addresses.
  external String language;

  /// Converts an address to geographic coordinates.
  external int lookup(
      String place, JSFunction callback, GeocoderLookupOptions? options);

  /// Converts a geographic coordinate to an address.
  external int reverseLookup(Coordinate coordinate, JSFunction callback,
      GeocoderReverseLookupOptions? options);

  /// Cancels the pending lookup or reverse lookup using its request ID.
  external bool cancel(int id);
}

/// Initialization options for geocoder objects.
extension type GeocoderConstructorOptions._(JSObject _) implements JSObject {
  external GeocoderConstructorOptions({bool getsUserLocation, String language});

  /// An initial Boolean value that indicates whether the geocoder returns results near the user’s location.
  external bool getsUserLocation;

  /// An initial value for the language ID, which determines the language to use for displaying addresses.
  external String language;
}

/// Options that constrain geocoder lookup results to a specific area or a specific language.
extension type GeocoderLookupOptions._(JSObject _) implements JSObject {
  external GeocoderLookupOptions(
      {Coordinate coordinate,
      String language,
      String limitToCountries,
      CoordinateRegion region});

  /// Coordinates for constraining the lookup results.
  external Coordinate coordinate;

  /// The language to use when displaying the lookup results.
  external String language;

  /// A list of countries for constraining the lookup results.
  external String limitToCountries;

  /// A region for constraining lookup results.
  external CoordinateRegion region;
}

/// An option that constrains reverse lookup results to a specific language.
extension type GeocoderReverseLookupOptions._(JSObject _) implements JSObject {
  external GeocoderReverseLookupOptions({String language});

  /// The language to use when displaying the reverse lookup results.
  external String language;
}

/// The response from a geocoder lookup or reverse lookup.
extension type GeocoderResponse._(JSObject _) implements JSObject {
  external GeocoderResponse({JSArray<Place> results});

  /// An array of places that returns from a geocoder lookup or reverse lookup.
  external JSArray<Place> results;
}

/// An object that retrieves map-based search results for a user-entered query.
extension type Search._(JSObject _) implements JSObject {
  /// Creates a search object with optional initial values that you provide.
  external Search(SearchConstructorOptions? options);

  /// Retrieves the results of a search query.
  external int search(JSAny query, JSAny callback, SearchOptions? options);

  /// Retrieves a list of autocomplete results for the specified search query.
  external int autocomplete(JSAny callback, SearchAutoCompleteOptions? options);

  /// Cancels a search request using its request ID.
  external bool cancel(int id);
}

/// Options you provide when you create a search object.
extension type SearchConstructorOptions._(JSObject _) implements JSObject {
  external SearchConstructorOptions(
      {Coordinate coordinate,
      bool getsUserLocation,
      String language,
      CoordinateRegion region,
      bool includeQueries,
      bool includeAddresses,
      String limitToCountries,
      bool includePointsOfInterest,
      PointOfInterestFilter pointOfInterestFilter});

  /// A map coordinate that provides a hint for the geographic area to search.
  external Coordinate coordinate;

  /// A Boolean value that indicates whether to limit the search results to the user’s location, according to the web browser.
  external bool getsUserLocation;

  /// A language ID that determines the language for the search results text.
  external String language;

  /// A map region that provides a hint for the geographic area to search.
  external CoordinateRegion region;

  /// A Boolean value that indicates whether the search autocomplete results include queries.
  external bool includeQueries;

  /// A Boolean value that indicates whether the search results include addresses.
  external bool includeAddresses;

  /// A string that constrains search results to within the provided countries.
  external String limitToCountries;

  /// A Boolean value that indicates whether the search results should include points of interest.
  external bool includePointsOfInterest;

  /// A filter used to include or exclude point of interest categories.
  external PointOfInterestFilter pointOfInterestFilter;
}

/// Options you provide to constrain an autocomplete request.
extension type SearchAutoCompleteOptions._(JSObject _) implements JSObject {
  external SearchAutoCompleteOptions(
      {Coordinate coordinate,
      String language,
      CoordinateRegion region,
      bool includeQueries,
      bool includeAddresses,
      String limitToCountries,
      bool includePointsOfInterest,
      PointOfInterestFilter pointOfInterestFilter});

  /// A map coordinate that provides a hint for the geographic area to search.
  external Coordinate coordinate;

  /// A language ID that determines the language for the search result text.
  external String language;

  /// A map region that provides a hint for the geographic area to search.
  external CoordinateRegion region;

  /// A Boolean value that indicates whether the search results should include queries.
  external bool includeQueries;

  /// A Boolean value that indicates whether the search results should include addresses.
  external bool includeAddresses;

  /// A string that constrains search results to within the provided countries.
  external String limitToCountries;

  /// A Boolean value that indicates whether the search results should include points of interest.
  external bool includePointsOfInterest;

  /// A filter used to include or exclude point of interest categories in search results.
  external PointOfInterestFilter pointOfInterestFilter;
}

/// An object or callback function the framework calls when performing a search or an autocomplete request.
extension type SearchDelegate._(JSObject _) implements JSObject {
  external SearchDelegate(
      {JSFunction autocompleteDidComplete,
      JSFunction autocompleteDidError,
      JSFunction searchDidComplete,
      JSFunction searchDidError});

  /// Tells the delegate when the autocomplete request completes.
  external void autocompleteDidComplete(SearchAutocompleteResponse data);

  /// Tells the delegate when the autocomplete request fails due to an error.
  external void autocompleteDidError(JSAny error);

  /// Tells the delegate when the search completes.
  external void searchDidComplete(SearchResponse data);

  /// Tells the delegate when the search fails due to an error.
  external void searchDidError(JSAny error);
}

/// An object that contains options to adjust a search.
extension type SearchOptions._(JSObject _) implements JSObject {
  external SearchOptions(
      {Coordinate coordinate,
      String limitToCountries,
      String language,
      CoordinateRegion region,
      bool includeAddresses,
      bool includePointsOfInterest,
      PointOfInterestFilter pointOfInterestFilter});

  /// A map coordinate that provides a hint for the geographic area to search.
  external Coordinate coordinate;

  /// A string that constrains search results to within the provided countries.
  external String limitToCountries;

  /// A language ID that determines the language for the search result text.
  external String language;

  /// A map region that provides a hint for the geographic area to search.
  external CoordinateRegion region;

  /// A Boolean value that indicates whether the search results should include addresses.
  external bool includeAddresses;

  /// A Boolean value that indicates whether the search results should include points of interest.
  external bool includePointsOfInterest;

  /// A filter used to include or exclude point of interest categories in search results.
  external PointOfInterestFilter pointOfInterestFilter;
}

/// The result of a search, including the original search query, the bounding region, and a list of places that match the query.
extension type SearchResponse._(JSObject _) implements JSObject {
  external SearchResponse(
      {JSArray<Place> places, String query, CoordinateRegion boundingRegion});

  /// A list of places that match the search query.
  external JSArray<Place> places;

  /// The query string for performing the search.
  external String query;

  /// The region that encloses the places from the search results.
  external CoordinateRegion boundingRegion;
}

/// An object containing the response from an autocomplete request.
extension type SearchAutocompleteResponse._(JSObject _) implements JSObject {
  external SearchAutocompleteResponse(
      {String query, JSArray<SearchAutocompleteResult> results});

  /// The query string used to perform the autocomplete request.
  external String query;

  /// The results from an autocomplete request.
  external JSArray<SearchAutocompleteResult> results;
}

/// The result of an autocomplete query, including display lines and a coordinate.
extension type SearchAutocompleteResult._(JSObject _) implements JSObject {
  external SearchAutocompleteResult(
      {Coordinate coordinate, JSArray<JSString> displayLines});

  /// The coordinate of the result when it corresponds to a single place.
  external Coordinate coordinate;

  /// Lines of text to display to the user in an autocomplete menu.
  external JSArray<JSString> displayLines;
}

/// A filter for determining the points of interest to include or exclude on a map or in a local search.
extension type PointOfInterestFilter._(JSObject _) implements JSObject {
  external PointOfInterestFilter(
      {JSFunction including,
      JSFunction excluding,
      JSFunction includesCategory,
      JSFunction excludesCategory});

  /// Creates a point of interest filter that includes categories from a list that you provide.
  external static PointOfInterestFilter including(
      JSArray<PointOfInterestCategory> categoryList);

  /// Creates a point of interest filter that excludes categories from a list that you provide.
  external static PointOfInterestFilter excluding(
      JSArray<PointOfInterestCategory> categoryList);

  /// Returns a Boolean value that indicates whether the filter includes the provided point of interest category.
  external bool includesCategory(PointOfInterestCategory category);

  /// Returns a Boolean value that indicates whether the filter excludes the provided point of interest category.
  external bool excludesCategory(PointOfInterestCategory category);
}

/// An object that fetches points of interest within a specified region.
extension type PointsOfInterestSearch._(JSObject _) implements JSObject {
  /// Creates a search object for fetching points of interest.
  external PointsOfInterestSearch(PointsOfInterestSearchOptions? options);

  /// The region that bounds the area in which to fetch points of interest.
  external CoordinateRegion region;

  /// The center point of the request represented as latitude and longitude.
  external Coordinate center;

  /// The distance provided in meters, or the longest distance derived from the center point to the region’s bounding box.
  external double radius;

  /// A filter that lists points of interest categories to include or exclude.
  external PointOfInterestFilter pointOfInterestFilter;

  /// The language ID to use when fetching points of interest.
  external String language;

  /// Fetches points of interest.
  external int search(JSAny callback, PointsOfInterestSearchOptions? options);

  /// Cancels a search request using its request ID.
  external bool cancel(int id);
}

/// Options that you may provide when you create a points of interest search.
extension type PointsOfInterestSearchOptions._(JSObject _) implements JSObject {
  external PointsOfInterestSearchOptions(
      {CoordinateRegion region,
      Coordinate center,
      double radius,
      PointOfInterestFilter pointOfInterestFilter,
      String language});

  /// The region that bounds the area in which to fetch points of interest.
  external CoordinateRegion region;

  /// The center point of the request represented as latitude and longitude.
  external Coordinate center;

  /// The distance provided in meters, or the longest distance derived from the center point to the region’s bounding box.
  external double radius;

  /// A filter that lists points of interest categories to include or exclude.
  external PointOfInterestFilter pointOfInterestFilter;

  /// The language ID to use when fetching points of interest.
  external String language;
}

/// An object or callback function that MapKit JS calls when fetching points of interest.
extension type PointsOfInterestSearchDelegate._(JSObject _)
    implements JSObject {
  external PointsOfInterestSearchDelegate(
      {JSFunction searchDidComplete, JSFunction searchDidError});

  /// Tells the delegate that the search completed.
  external void searchDidComplete(PointsOfInterestSearchResponse data);

  /// Tells the delegate that the search failed due to an error.
  external void searchDidError(JSAny error);
}

/// The result of a request used to fetch points of interest.
extension type PointsOfInterestSearchResponse._(JSObject _)
    implements JSObject {
  external PointsOfInterestSearchResponse({JSArray<Place> places});

  /// The list of points of interest that match the request options.
  external JSArray<Place> places;
}

/// An object that represents a map feature that the user selects.
extension type MapFeatureAnnotation._(JSObject _) implements MarkerAnnotation {
  external MapFeatureAnnotation(
      {String title,
      MapFeatureType featureType,
      PointOfInterestCategory pointOfInterestCategory,
      String color,
      MapFeatureAnnotationGlyphImage glyphImage,
      MapFeatureAnnotationGlyphImage selectedGlyphImage,
      JSFunction fetchPlace});

  /// The title of the feature.
  external String title;

  /// A value that describes the type of place the feature represents.
  external MapFeatureType featureType;

  /// The point-of-interest category of the feature.
  external PointOfInterestCategory pointOfInterestCategory;

  /// The color of the map feature.
  external String color;

  /// The glyph image for the feature.
  external MapFeatureAnnotationGlyphImage glyphImage;

  /// The glyph image for the selected feature.
  external MapFeatureAnnotationGlyphImage selectedGlyphImage;

  /// Fetches the place object associated with the map feature.
  external double fetchPlace(JSAny callback);
}

/// An object that describes map feature annotation images.
extension type MapFeatureAnnotationGlyphImage._(JSObject _)
    implements ImageDelegate {
  external MapFeatureAnnotationGlyphImage({JSFunction getImageUrl});

  /// Returns the image URL of the map feature.
  external void getImageUrl(double scale, JSFunction callback);
}

/// An object that provides directions and estimated travel time based on the options you provide.
extension type Directions._(JSObject _) implements JSObject {
  /// Creates a directions object with options you provide.
  external Directions(DirectionsConstructorOptions? options);

  /// Retrieves estimated arrival times to up to 10 destinations from a single starting point.
  external int eta(EtaRequestOptions request, JSFunction callback);

  /// Retrieves directions and estimated travel time based on the specified start and end points.
  external int route(DirectionsRequest request, JSFunction callback);

  /// Cancels a previous request for routes or estimated arrival times.
  external bool cancel(int id);
}

/// Options that you may provide when creating a directions object.
extension type DirectionsConstructorOptions._(JSObject _) implements JSObject {
  external DirectionsConstructorOptions({String language});

  /// A language ID that determines the language for route information.
  external String language;
}

/// The options you may provide for requesting estimated arrival times.
extension type EtaRequestOptions._(JSObject _) implements JSObject {
  external EtaRequestOptions(
      {Coordinate origin,
      JSAny departureDate,
      JSArray<Coordinate> destinations,
      Transport transportType});

  /// The starting point for estimated arrival time requests.
  external Coordinate origin;

  /// The time of departure used in an estimated arrival time request.
  external JSAny departureDate;

  /// An array of coordinates that represent end points for estimated arrival time requests.
  external JSArray<Coordinate> destinations;

  /// The mode of transportation the server uses when estimating arrival times.
  external Transport transportType;
}

/// The estimated arrival times for a set of destinations.
extension type EtaResponse._(JSObject _) implements JSObject {
  external EtaResponse(
      {JSObject request, Coordinate origin, JSArray<EtaResult> etas});

  /// The request object associated with the estimated time of arrival response.
  external JSObject request;

  /// The coordinates that represent the starting point for estimated arrival time requests.
  external Coordinate origin;

  /// An array of estimated arrival times.
  external JSArray<EtaResult> etas;
}

/// The mode of transportation, distance, and travel time estimates for a single destination.
extension type EtaResult._(JSObject _) implements JSObject {
  external EtaResult(
      {Transport transportType,
      Coordinate destination,
      double distance,
      double expectedTravelTime,
      double staticTravelTime});

  /// The mode of transportation used to estimate the arrival time.
  external Transport transportType;

  /// The coordinates that represent the endpoint for estimated arrival time requests.
  external Coordinate destination;

  /// The route distance in meters.
  external double distance;

  /// The estimated travel time in seconds, including delays due to traffic.
  external double expectedTravelTime;

  /// The estimated travel time in seconds, excluding delays for traffic.
  external double staticTravelTime;
}

/// The requested start and end points for a route, as well as the planned mode of transportation.
extension type DirectionsRequest._(JSObject _) implements JSObject {
  external DirectionsRequest(
      {JSAny origin,
      JSAny destination,
      JSAny arrivalDate,
      JSAny departureDate,
      bool requestsAlternateRoutes,
      Transport transportType,
      bool avoidTolls});

  /// The starting point for routing directions.
  external JSAny origin;

  /// The end point for routing directions.
  external JSAny destination;

  /// The arrival date for the trip.
  external JSAny arrivalDate;

  /// The departure date for the trip.
  external JSAny departureDate;

  /// A Boolean value that indicates whether the server returns multiple routes when they’re available.
  external bool requestsAlternateRoutes;

  /// The mode of transportation the directions apply to.
  external Transport transportType;

  /// A Boolean value that prioritizes routes to avoid tolls.
  external bool avoidTolls;
}

/// The directions and estimated travel time that return for a route.
extension type DirectionsResponse._(JSObject _) implements JSObject {
  external DirectionsResponse(
      {DirectionsRequest request,
      JSArray<Route> routes,
      Place origin,
      Place destination});

  /// The request object associated with the direction’s response.
  external DirectionsRequest request;

  /// An array of route objects.
  external JSArray<Route> routes;

  /// An optional starting point for routing directions.
  external Place origin;

  /// An optional end point for routing directions.
  external Place destination;
}

/// Information about a route, including step-by-step instructions, distance, and estimated travel time.
extension type Route._(JSObject _) implements JSObject {
  external Route(
      {PolylineOverlay polyline,
      Coordinate path,
      JSArray<RouteStep> steps,
      String name,
      double distance,
      double expectedTravelTime,
      Transport transportType,
      bool hasTolls});

  /// An instance of a polyline overlay that represents the path of a route.
  external PolylineOverlay polyline;

  /// An array of coordinate objects representing the path of the route.
  external Coordinate path;

  /// An array of steps that compose the overall route.
  external JSArray<RouteStep> steps;

  /// The name assigned to the route.
  external String name;

  /// The route distance, in meters.
  external double distance;

  /// The expected travel time, in seconds.
  external double expectedTravelTime;

  /// The overall route transport type.
  external Transport transportType;

  /// A Boolean value that indicates whether a route has tolls.
  external bool hasTolls;
}

/// A single step of the route between the requested start and end points.
extension type RouteStep._(JSObject _) implements JSObject {
  external RouteStep(
      {JSArray<Coordinate> path,
      String instructions,
      double distance,
      Transport transportType});

  /// An array of coordinate objects representing the path of the route segment.
  external JSArray<Coordinate> path;

  /// The written instructions for following the path that the step represents.
  external String instructions;

  /// The step distance, in meters.
  external double distance;

  /// The transport type of the step.
  external Transport transportType;
}

/// The values that define content padding within the map view frame.
extension type Padding._(JSObject _) implements JSObject {
  /// Creates a padding object and initializes its inset margin properties.
  external Padding(JSAny top, double? right, double? bottom, double? left);

  /// The amount of padding, in CSS pixels, to inset the map from the bottom edge.
  external double bottom;

  /// The amount of padding, in CSS pixels, to inset the map from the left edge.
  external double left;

  /// The amount of padding, in CSS pixels, to inset the map from the right edge.
  external double right;

  /// The amount of padding, in CSS pixels, to inset the map from the top edge.
  external double top;
}

/// Initial values of the edge insets for padding.
extension type PaddingConstructorOptions._(JSObject _) implements JSObject {
  external PaddingConstructorOptions(
      {double bottom, double left, double right, double top});

  /// The amount of padding, in CSS pixels, to inset the map from the bottom edge.
  external double bottom;

  /// The amount of padding, in CSS pixels, to inset the map from the left edge.
  external double left;

  /// The amount of padding, in CSS pixels, to inset the map from the right edge.
  external double right;

  /// The amount of padding, in CSS pixels, to inset the map from the top edge.
  external double top;
}

/// A delegate object that controls a GeoJSON import to override default behavior and provide custom style.
extension type GeoJSONDelegate._(JSObject _) implements JSObject {
  external GeoJSONDelegate(
      {JSFunction itemForFeature,
      JSFunction itemForFeatureCollection,
      JSFunction itemForLineString,
      JSFunction itemForMultiLineString,
      JSFunction itemForPoint,
      JSFunction itemForMultiPoint,
      JSFunction itemForPolygon,
      JSFunction itemForMultiPolygon,
      JSFunction styleForOverlay,
      JSFunction geoJSONDidComplete,
      JSFunction geoJSONDidError});

  /// Overrides a feature.
  external JSAny itemForFeature(JSAny item, JSObject geoJSON);

  /// Overrides a feature collection.
  external JSAny itemForFeatureCollection(
      ItemCollection itemCollection, JSObject geoJSON);

  /// Overrides a line string.
  external JSAny itemForLineString(PolylineOverlay overlay, JSObject geoJSON);

  /// Overrides a multiline string.
  external JSAny itemForMultiLineString(
      ItemCollection itemCollection, JSObject geoJSON);

  /// Overrides a point.
  external JSAny itemForPoint(Coordinate coordinate, JSObject geoJSON);

  /// Overrides a multipoint object.
  external JSAny itemForMultiPoint(
      ItemCollection itemCollection, JSObject geoJSON);

  /// Overrides a polygon.
  external JSAny itemForPolygon(PolygonOverlay overlay, JSObject geoJSON);

  /// Overrides a multipolygon.
  external JSAny itemForMultiPolygon(
      ItemCollection itemCollection, JSObject geoJSON);

  /// Overrides the style of overlays.
  external Style styleForOverlay(Overlay overlay, JSObject geoJSON);

  /// Completes the GeoJSON import.
  external void geoJSONDidComplete(ItemCollection result, JSObject geoJSON);

  /// Indicates when the GeoJSON import fails.
  external void geoJSONDidError(JSAny error, JSObject geoJSON);
}

/// A tree structure containing annotations, overlays, and nested item collection objects.
extension type ItemCollection._(JSObject _) implements JSObject {
  external ItemCollection(
      {JSObject data, JSAny getFlattenedItemList, JSAny items});

  /// The raw GeoJSON data.
  external JSObject data;

  /// A flattened array of items that includes annotations and overlays.
  external JSAny getFlattenedItemList;

  /// A nested list of annotations, overlays, and other item collections.
  external JSAny items;
}

/// A place object that returns from a geocoder lookup, reverse lookup, or a fetch request for points of interest.
extension type Place._(JSObject _) implements JSObject {
  external Place(
      {String name,
      String formattedAddress,
      String areasOfInterest,
      PointOfInterestCategory pointOfInterestCategory,
      String thoroughfare,
      String subThoroughfare,
      String fullThoroughfare,
      String postCode,
      String locality,
      String subLocality,
      String dependentLocalities,
      String administrativeArea,
      String administrativeAreaCode,
      String country,
      String countryCode,
      Coordinate coordinate,
      CoordinateRegion region});

  /// The name of the place.
  external String name;

  /// The address of the place, formatted using its conventions of its country or region.
  external String formattedAddress;

  /// Common names of the area in which the place resides.
  external String areasOfInterest;

  /// The category of the place.
  external PointOfInterestCategory pointOfInterestCategory;

  /// The street name at the place.
  external String thoroughfare;

  /// The number on the street at the place.
  external String subThoroughfare;

  /// A combination of thoroughfare and subthoroughfare.
  external String fullThoroughfare;

  /// The postal code of the place.
  external String postCode;

  /// The city of the place.
  external String locality;

  /// The name of the area within the locality.
  external String subLocality;

  /// Common names for the local area or neighborhood of the place.
  external String dependentLocalities;

  /// The state or province of the place.
  external String administrativeArea;

  /// The short code for the state or area.
  external String administrativeAreaCode;

  /// The country or region of the place.
  external String country;

  /// The country or region associated with the place.
  external String countryCode;

  /// The latitude and longitude for the place.
  external Coordinate coordinate;

  /// The geographic region associated with the place.
  external CoordinateRegion region;
}

/// An object representing the latitude and longitude for a point on the Earth’s surface.
extension type Coordinate._(JSObject _) implements JSObject {
  /// Creates a coordinate object with the specified latitude and longitude.
  external Coordinate(double latitude, double longitude);

  /// The latitude, in degrees.
  external double latitude;

  /// The longitude, in degrees.
  external double longitude;

  /// Returns a copy of the coordinate.
  external Coordinate copy();

  /// Returns a Boolean value indicating whether two coordinates are equal.
  external bool equals(Coordinate anotherCoordinate);

  /// Returns the map point that corresponds to the coordinate.
  external MapPoint toMapPoint();

  /// Returns the unwrapped map point that corresponds to the coordinate.
  external MapPoint toUnwrappedMapPoint();
}

/// A rectangular area on a map that a center coordinate and a span define, in degrees of latitude and longitude.
extension type CoordinateRegion._(JSObject _) implements JSObject {
  /// A rectangular geographic region that centers around a latitude and longitude coordinate.
  external CoordinateRegion(Coordinate center, CoordinateSpan span);

  /// The center point of the region.
  external Coordinate center;

  /// The horizontal and vertical span representing the amount of map to display.
  external CoordinateSpan span;

  /// The distance provided in meters or the longest distance derived from the center point to the region’s bounding box.
  external double radius;

  /// Returns a copy of the calling coordinate region.
  external void copy();

  /// Returns a Boolean value indicating whether two regions are equal.
  external bool equals(CoordinateRegion anotherRegion);

  /// Returns the bounding region that corresponds to the specified coordinate region.
  external BoundingRegion toBoundingRegion();

  /// Returns the map rectangle that corresponds to the calling coordinate region.
  external MapRect toMapRect();
}

/// The width and height of a map region.
extension type CoordinateSpan._(JSObject _) implements JSObject {
  /// Creates a new coordinate span object with the specified latitude and longitude deltas.
  external CoordinateSpan(double latitudeDelta, double longitudeDelta);

  /// The amount of north-to-south distance (in degrees) to display for the map region.
  external double latitudeDelta;

  /// The amount of east-to-west distance (in degrees) to display for the map region.
  external double longitudeDelta;

  /// Returns a copy of the coordinate span.
  external CoordinateSpan copy();

  /// Returns a Boolean value that indicates whether two spans are equal.
  external bool equals(CoordinateSpan anotherSpan);
}

/// A rectangular area on a map, which coordinates of the rectangle’s northeast and southwest corners define.
extension type BoundingRegion._(JSObject _) implements JSObject {
  /// Creates a rectangular bounding region, which the latitude and longitude coordinates of the rectangle’s northeast and southwest corners define.
  external BoundingRegion(double northLatitude, double eastLongitude,
      double southLatitude, double westLongitude);

  /// The east longitude of the bounding region.
  external double eastLongitude;

  /// The north latitude of the bounding region.
  external double northLatitude;

  /// The south latitude of the bounding region.
  external double southLatitude;

  /// The west longitude of the bounding region.
  external double westLongitude;

  /// Returns a copy of the calling bounding region.
  external BoundingRegion copy();

  /// Returns the coordinate region that corresponds to the calling bounding region.
  external CoordinateRegion toCoordinateRegion();
}

/// A location, in map units, of a point on the Earth’s surface projected onto a 2D map.
extension type MapPoint._(JSObject _) implements JSObject {
  /// Creates a map location.
  external MapPoint(double x, double y);

  /// The location of the map point along the map’s x-axis.
  external double x;

  /// The location of the map point along the map’s y-axis.
  external double y;

  /// Returns a copy of the location.
  external MapPoint copy();

  /// Indicates whether two map points are equal.
  external bool equals(MapPoint anotherPoint);

  /// Converts a map point into a coordinate with latitude and longitude.
  external Coordinate toCoordinate();
}

/// A rectangular region, in map units, of a two-dimensional map projection.
extension type MapRect._(JSObject _) implements JSObject {
  /// Creates an object that represents a rectangular region of the map projection.
  external MapRect(double x, double y, double width, double height);

  /// The origin point of a rectangle.
  external MapPoint origin;

  /// The width and height of a rectangle, starting from the origin point.
  external MapSize size;

  /// Returns the maximum x-axis value of a rectangle.
  external double maxX();

  /// Returns the maximum y-axis value of a rectangle.
  external double maxY();

  /// Returns the midpoint along the x-axis of a rectangle.
  external double midX();

  /// Returns the midpoint along the y-axis of a rectangle.
  external double midY();

  /// Returns the minimum x-axis value of a rectangle.
  external double minX();

  /// Returns the minimum y-axis value of a rectangle.
  external double minY();

  /// Returns a copy of a map rectangle.
  external MapRect copy();

  /// Compares whether two map rectangles are equal.
  external bool equals(MapRect anotherRect);

  /// Returns a scaled map rectangle for a map location.
  external MapRect scale(double scaleFactor, MapPoint scaleCenter);

  /// Returns the region that corresponds to a map rectangle.
  external CoordinateRegion toCoordinateRegion();
}

/// A pair of values, in map units, that define the width and height of a rectangular area of a map projection.
extension type MapSize._(JSObject _) implements JSObject {
  /// Creates an object containing the width and height of a projected coordinate span.
  external MapSize(double width, double height);

  /// The height of the map size in map units.
  external double height;

  /// The width of the map size in map units.
  external double width;

  /// Returns a copy of the map size object.
  external MapSize copy();

  /// Compares the sizes of two maps and indicates whether they’re of equal value.
  external bool equals(MapSize anotherSize);
}

/// A minimum and maximum camera distance, in meters, from the center of the map.
extension type CameraZoomRange._(JSObject _) implements JSObject {
  /// Describes the minimum and maximum camera distance in meters.
  external CameraZoomRange(JSAny minCameraDistance, double? maxCameraDistance);

  /// The minimum allowed distance of the camera from the center of the map in meters.
  external double minCameraDistance;

  /// The maximum allowed distance of the camera from the center of the map in meters.
  external double maxCameraDistance;
}

/// Initialization options for the camera zoom range.
extension type CameraZoomRangeConstructorOptions._(JSObject _)
    implements JSObject {
  external CameraZoomRangeConstructorOptions(
      {double minCameraDistance, double maxCameraDistance});

  /// The minimum allowed distance of the camera from the center of the map in meters.
  external double minCameraDistance;

  /// The maximum allowed distance of the camera from the center of the map in meters.
  external double maxCameraDistance;
}

/// An object that contains data MapKit JS returns from a place search request.
extension type FetchResponse._(JSObject _) implements JSObject {
  external FetchResponse({JSArray<Place> places});

  /// An array of place objects.
  external JSArray<Place> places;
}

/// An object to pass to a map feature annotation to fetch place objects instead of a callback function.
extension type FetchDelegate._(JSObject _) implements JSObject {
  external FetchDelegate(
      {JSFunction fetchDidComplete, JSFunction fetchDidError});

  /// Tells the receiver when the fetch request succeeds.
  external void fetchDidComplete(FetchResponse data);

  /// Tells the receiver when the fetch request fails.
  external void fetchDidError(JSAny error);
}

/// An object you use to specify image URLs.
extension type ImageDelegate._(JSObject _) implements JSObject {
  external ImageDelegate({JSFunction getImageUrl});

  /// Returns the URL to an image of the specified scale.
  external void getImageUrl(double scale, JSFunction callback);
}
