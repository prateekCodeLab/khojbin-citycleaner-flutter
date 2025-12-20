import 'package:flutter/material.dart';

class MapControls extends StatelessWidget {
  final VoidCallback onMyLocationTap;
  final VoidCallback onSearchTap;

  const MapControls({
    super.key,
    required this.onMyLocationTap,
    required this.onSearchTap,
  });

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        FloatingActionButton(
          heroTag: "my_location",
          onPressed: onMyLocationTap,
          child: const Icon(Icons.my_location),
        ),
        const SizedBox(height: 12),
        FloatingActionButton(
          heroTag: "search",
          onPressed: onSearchTap,
          child: const Icon(Icons.search),
        ),
      ],
    );
  }
}
