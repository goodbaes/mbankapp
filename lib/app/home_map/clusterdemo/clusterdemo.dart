import 'dart:math' as math;

import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:mbankapp/app/home_map/listeners/cluster_listener.dart';
import 'package:mbankapp/app/home_map/listeners/cluster_tap_listener.dart';
import 'package:mbankapp/app/home_map/presentation/flutter_map_widget.dart';
import 'package:yandex_maps_mapkit_lite/image.dart' as image_provider;
import 'package:yandex_maps_mapkit_lite/mapkit.dart' as mapkit;

class ClustersDemo extends StatefulWidget {
  const ClustersDemo({super.key});
  @override
  State<ClustersDemo> createState() => _ClustersDemoState();
}

class _ClustersDemoState extends State<ClustersDemo> {
  // Настройки кластеризации
  static const _clusterRadius = 60.0;
  static const _clusterMinZoom = 15;

  late final mapkit.ClusterizedPlacemarkCollection _clusters;
  final _random = math.Random();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: FlutterMapWidget(onMapCreated: _onMapCreated),
    );
  }

  void _onMapCreated(mapkit.MapWindow window) {
    window.map.move(
      const mapkit.CameraPosition(
        mapkit.Point(latitude: 55.75, longitude: 37.62),
        zoom: 10,
        azimuth: 1,
        tilt: 0,
      ),
    );

    // 1. Создаём коллекцию с поддержкой кластеризации
    _clusters = window.map.mapObjects.addClusterizedPlacemarkCollection(
      ClusterListenerImpl(
        onClusterAddedCallback: _onClusterAdded,
      ),
    );

    // 2. Добавляем плейсмарки
    for (var i = 0; i < 200; i++) {
      final point = mapkit.Point(
        latitude: 55.5 + _random.nextDouble(),
        longitude: 37.3 + _random.nextDouble(),
      );

      _clusters.addPlacemark()
        ..geometry = point
        ..setIcon(
          image_provider.ImageProvider.fromImageProvider(
            const AssetImage('assets/pin_red.png'),
          ),
        )
        ..userData = i;
    }

    // 3. Запускаем кластеризацию
    _clusters.clusterPlacemarks(
      clusterRadius: _clusterRadius,
      minZoom: _clusterMinZoom,
    );
  }

  /* === Callbacks === */

  // Вызывается при создании нового кластера
  void _onClusterAdded(mapkit.Cluster cluster) {
    // Настраиваем внешний вид кластера
    cluster.appearance
      ..setText('${cluster.size}') // выводим количество точек
      ..zIndex = 100;

    // Регистрируем тап-обработчик
    cluster.addClusterTapListener(
      ClusterTapListenerImpl(
        onClusterTapCallback: (cluster) {
          // Обработка нажатия на кластер
          final message = 'Кластер с ${cluster.size} точками';
          ScaffoldMessenger.of(context).showSnackBar(
            SnackBar(content: Text(message)),
          );
          return true; // Возвращаем true, чтобы предотвратить дальнейшую обработку
        },
      ),
    );
  }
}
