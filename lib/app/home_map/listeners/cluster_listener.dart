import 'package:yandex_maps_mapkit_lite/mapkit.dart';

final class ClusterListenerImpl implements ClusterListener {
  const ClusterListenerImpl({required this.onClusterAddedCallback});
  final void Function(Cluster) onClusterAddedCallback;

  @override
  void onClusterAdded(Cluster cluster) => onClusterAddedCallback(cluster);
}
