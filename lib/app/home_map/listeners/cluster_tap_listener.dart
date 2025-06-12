import 'package:yandex_maps_mapkit_lite/mapkit.dart';

final class ClusterTapListenerImpl implements ClusterTapListener {
  const ClusterTapListenerImpl({required this.onClusterTapCallback});
  final bool Function(Cluster) onClusterTapCallback;

  @override
  bool onClusterTap(Cluster cluster) => onClusterTapCallback(cluster);
}
