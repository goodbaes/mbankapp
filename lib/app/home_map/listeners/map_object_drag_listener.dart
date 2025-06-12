import 'package:yandex_maps_mapkit_lite/mapkit.dart';

final class MapObjectDragListenerImpl implements MapObjectDragListener {
  const MapObjectDragListenerImpl({
    required this.onMapObjectDragStartCallback,
    required this.onMapObjectDragCallback,
    required this.onMapObjectDragEndCallback,
  });
  final void Function(MapObject) onMapObjectDragStartCallback;
  final void Function(MapObject, Point) onMapObjectDragCallback;
  final void Function(MapObject) onMapObjectDragEndCallback;

  @override
  void onMapObjectDragStart(MapObject mapObject) => onMapObjectDragStartCallback(mapObject);

  @override
  void onMapObjectDrag(MapObject mapObject, Point point) => onMapObjectDragCallback(mapObject, point);

  @override
  void onMapObjectDragEnd(MapObject mapObject) => onMapObjectDragEndCallback(mapObject);
}
