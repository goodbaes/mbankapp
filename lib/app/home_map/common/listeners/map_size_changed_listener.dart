import 'package:yandex_maps_mapkit_lite/mapkit.dart';

final class MapSizeChangedListenerImpl implements MapSizeChangedListener {
  const MapSizeChangedListenerImpl({required this.onMapWindowSizeChange});
  final void Function(MapWindow, int, int) onMapWindowSizeChange;

  @override
  void onMapWindowSizeChanged(
    MapWindow mapWindow,
    int newWidth,
    int newHeight,
  ) {
    onMapWindowSizeChange(mapWindow, newWidth, newHeight);
  }
}
