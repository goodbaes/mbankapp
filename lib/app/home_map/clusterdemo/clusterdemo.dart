import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:mbankapp/app/home_map/clusterdemo/cluster_collection_pin_widget.dart';
import 'package:mbankapp/app/home_map/clusterdemo/model/cluster_point.dart';
import 'package:mbankapp/app/home_map/common/listeners/map_object_tap_listener.dart';
import 'package:mbankapp/app/home_map/listeners/cluster_listener.dart';
import 'package:mbankapp/app/home_map/listeners/cluster_tap_listener.dart';
import 'package:mbankapp/app/home_map/presentation/flutter_map_widget.dart';
import 'package:yandex_maps_mapkit_lite/image.dart' as image_provider;
import 'package:yandex_maps_mapkit_lite/mapkit.dart' as mk;
import 'package:yandex_maps_mapkit_lite/ui_view.dart';

class ClustersDemo extends StatefulWidget {
  const ClustersDemo({required this.points, super.key, this.onClusterTap, this.onPointTap});
  final List<ClusterPoint> points;
  final void Function(List<String> ids)? onClusterTap;
  final void Function(String id)? onPointTap;
  @override
  State<ClustersDemo> createState() => _ClustersDemoState();
}

class _ClustersDemoState extends State<ClustersDemo> {
  late final mk.ClusterizedPlacemarkCollection _clusters;

  mk.PlacemarkMapObject? _selectedPont;
  mk.PlacemarkMapObject? previousSelectedPoint;

  final List<mk.PlacemarkMapObject> allPoints = [];
  late final _pinListener = MapObjectTapListenerImpl(
    onMapObjectTapped: (placemark, _) {
      if (placemark is mk.PlacemarkMapObject) {
        if (previousSelectedPoint == placemark) {
          return true;
        } else {
          if (previousSelectedPoint != null) {
            previousSelectedPoint!.setIconStyle(
              const mk.IconStyle(
                scale: 1,
                zIndex: 0,
              ),
            );
          }
        }
        previousSelectedPoint = placemark;
        _selectedPont = placemark;

        placemark.setIconStyle(
          const mk.IconStyle(
            scale: 1.5,
            zIndex: 1000,
          ),
        );
      }
      return true;
    },
  );
  @override
  Widget build(BuildContext context) => FlutterMapWidget(onMapCreated: _onMapCreated);

  void _onMapCreated(mk.MapWindow window) {
    window.map.mapObjects.clear();

    window.map.move(
      const mk.CameraPosition(
        mk.Point(latitude: 42.882004, longitude: 74.582748),
        zoom: 15,
        azimuth: 0,
        tilt: 0,
      ),
    );

    _clusters = window.map.mapObjects.addClusterizedPlacemarkCollection(
      ClusterListenerImpl(onClusterAddedCallback: (c) => _onClusterAdded(c, window)),
    );

    for (final p in widget.points) {
      final pin = _clusters.addPlacemark()
        ..geometry = mk.Point(latitude: p.lat, longitude: p.lon)
        ..userData = p.id
        ..setIcon(
          image_provider.ImageProvider.fromImageProvider(
            AssetImage(p.asset),
          ),
        )
        ..addTapListener(_pinListener);

      allPoints.add(pin);
    }
    _clusters.clusterPlacemarks(clusterRadius: 60, minZoom: 15);
  }

  void _onClusterAdded(mk.Cluster c, mk.MapWindow window) {
    c.appearance
      ..setView(
        ViewProvider(
          builder: () {
            return ClusterCollectionPinWidget(
              size: c.placemarks.length,
            );
          },
        ),
      )
      ..zIndex = 100;

    c.addClusterTapListener(
      ClusterTapListenerImpl(
        onClusterTapCallback: (cluster) {
          if (widget.onClusterTap == null) return false;
          window.map.move(
            mk.CameraPosition(
              cluster.placemarks.first.geometry,
              zoom: window.map.cameraPosition.zoom + 1,
              azimuth: 0,
              tilt: 0,
            ),
          );
          final ids = cluster.placemarks.map((e) => e.userData! as String).toList();
          widget.onClusterTap?.call(ids);
          return true;
        },
      ),
    );
  }
}
