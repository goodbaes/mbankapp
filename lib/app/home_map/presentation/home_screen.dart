import 'package:flutter/material.dart';
import 'package:mbankapp/app/home_map/clusterdemo/clusterdemo.dart';
import 'package:mbankapp/app/home_map/clusterdemo/model/cluster_point.dart';
import 'package:mbankapp/app/utils/map_avalible_util.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return FutureBuilder(
      future: MapAvailableUtil.isMapAvailable(),
      builder: (context, snapshot) {
        if (snapshot.connectionState == ConnectionState.waiting) {
          return const Scaffold(
            body: Center(
              child: CircularProgressIndicator(),
            ),
          );
        }
        if (snapshot.hasData && snapshot.data!) {
          return Scaffold(
            body: ClustersDemo(
              points: const [
                ClusterPoint(
                  lat: 42.882004,
                  lon: 74.582748,
                  id: '1',
                  asset: 'assets/pin_red.png',
                ),
                ClusterPoint(
                  lat: 42.88303,
                  lon: 74.58275,
                  id: '2',
                  asset: 'assets/pin_red.png',
                ),
              ],
              onPointTap: (id) {
                print('Point tapped: $id');
                ScaffoldMessenger.of(context).showSnackBar(
                  SnackBar(content: Text('Point tapped: $id')),
                );
              },
            ),
          );
        } else if (snapshot.hasError) {
          return Scaffold(
            body: Center(
              child: Text('Error: ${snapshot.error}'),
            ),
          );
        } else {
          return const Scaffold(
            body: Center(
              child: Text('Map is not available on this device'),
            ),
          );
        }
      },
    );
  }
}
