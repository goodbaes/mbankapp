import 'package:yandex_maps_mapkit_lite/mapkit.dart';

final class MapObjectTapListenerImpl implements MapObjectTapListener {
  const MapObjectTapListenerImpl({required this.onMapObjectTapped});
  final bool Function(MapObject, Point) onMapObjectTapped;

  @override
  bool onMapObjectTap(MapObject mapObject, Point point) {
    return onMapObjectTapped(mapObject, point);
  }
}
