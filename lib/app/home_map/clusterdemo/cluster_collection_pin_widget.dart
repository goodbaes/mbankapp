import 'package:flutter/material.dart';

class ClusterCollectionPinWidget extends StatelessWidget {
  const ClusterCollectionPinWidget({required this.size, super.key});
  final int size; // Example size, replace with actual size if needed
  @override
  Widget build(BuildContext context) {
    return Container(
      width: 30,
      height: 30,
      alignment: Alignment.center,
      decoration: const BoxDecoration(
        shape: BoxShape.circle,
        color: Colors.blue,
      ),
      child: Text(
        '$size',
        style: const TextStyle(color: Colors.white, fontSize: 16),
      ),
    );
  }
}
