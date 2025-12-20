import 'package:flutter/material.dart';
import 'package:flutter_map/flutter_map.dart';
import 'package:latlong2/latlong.dart';

import '../../core/widgets/app_header.dart';
import '../../core/services/location_service.dart';
import '../../core/services/geocoding_service.dart';
import '../../core/utils/distance_utils.dart';
import '../../core/utils/polyline_utils.dart';
import '../../core/widgets/directions_bottom_sheet.dart';

import 'map_controls.dart';
import 'map_markers.dart';
import '../sheets/add_bin_sheet.dart';

class MapScreen extends StatefulWidget {
  const MapScreen({super.key});

  @override
  State<MapScreen> createState() => _MapScreenState();
}

class _MapScreenState extends State<MapScreen> {
  final MapController _mapController = MapController();
  List<LatLng> _routePoints = [];

  final LatLng _binLocation = const LatLng(23.2610, 77.4140);

  // -------------------------------
  // MY LOCATION
  // -------------------------------
  Future<void> _goToMyLocation() async {
    try {
      final position = await LocationService.getCurrentLocation();
      if (!mounted) return;

      final userLatLng =
          LatLng(position.latitude, position.longitude);

      _mapController.move(userLatLng, 16);

      setState(() {
        _routePoints = [];
      });
    } catch (e) {
      if (!mounted) return;
      ScaffoldMessenger.of(context)
          .showSnackBar(SnackBar(content: Text(e.toString())));
    }
  }

  // -------------------------------
  // NAME-BASED SEARCH (IMPORTANT)
  // -------------------------------
  void _openSearchDialog() {
    final searchController = TextEditingController();

    showDialog(
      context: context,
      builder: (_) => AlertDialog(
        title: const Text("Search Location"),
        content: TextField(
          controller: searchController,
          decoration: const InputDecoration(
            hintText: "Enter place name (e.g. Delhi, Bhopal)",
          ),
        ),
        actions: [
          TextButton(
            onPressed: () => Navigator.pop(context),
            child: const Text("Cancel"),
          ),
          ElevatedButton(
            onPressed: () async {
              final query = searchController.text.trim();
              if (query.isEmpty) return;

              Navigator.pop(context);

              final result =
                  await GeocodingService.searchByName(query);

              if (!mounted) return;

              if (result != null) {
                _mapController.move(result, 15);
              } else {
                ScaffoldMessenger.of(context).showSnackBar(
                  const SnackBar(
                    content: Text("Location not found"),
                  ),
                );
              }
            },
            child: const Text("Search"),
          ),
        ],
      ),
    );
  }

  // -------------------------------
  // BIN TAP → ROUTE
  // -------------------------------
  Future<void> _onBinTapped(BuildContext context, LatLng binLatLng) async {
    try {
      final position = await LocationService.getCurrentLocation();
      if (!mounted) return;

      final userLatLng =
          LatLng(position.latitude, position.longitude);

      final distanceKm = DistanceUtils.calculateDistance(
        userLatLng.latitude,
        userLatLng.longitude,
        binLatLng.latitude,
        binLatLng.longitude,
      );

      final route = PolylineUtils.buildStraightRoute(
        userLatLng,
        binLatLng,
      );

      setState(() {
        _routePoints = route;
      });

      _mapController.fitCamera(
        CameraFit.bounds(
          bounds: LatLngBounds.fromPoints(route),
          padding: const EdgeInsets.all(80),
        ),
      );

      showModalBottomSheet(
        context: context,
        isScrollControlled: true,
        backgroundColor: Colors.transparent,
        shape: const RoundedRectangleBorder(
          borderRadius: BorderRadius.vertical(top: Radius.circular(24)),
        ),
        builder: (_) => DirectionsBottomSheet(
          distanceKm: distanceKm,
        ),
      );
    } catch (e) {
      if (!mounted) return;
      ScaffoldMessenger.of(context)
          .showSnackBar(SnackBar(content: Text(e.toString())));
    }
  }

  // -------------------------------
  // UI
  // -------------------------------
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Stack(
        children: [
          FlutterMap(
            mapController: _mapController,
            options: const MapOptions(
              initialCenter: LatLng(23.2599, 77.4126),
              initialZoom: 14,
            ),
            children: [
              TileLayer(
                urlTemplate:
                    "https://tile.openstreetmap.org/{z}/{x}/{y}.png",
                userAgentPackageName: 'com.citycleaner.app',
              ),

              if (_routePoints.isNotEmpty)
                PolylineLayer(
                  polylines: [
                    Polyline(
                      points: _routePoints,
                      strokeWidth: 4,
                      color: Colors.blueAccent,
                    ),
                  ],
                ),

              MarkerLayer(
                markers: buildMarkers(() {
                  _onBinTapped(context, _binLocation);
                }),
              ),
            ],
          ),

          const Positioned(
            top: 40,
            left: 16,
            right: 16,
            child: AppHeader(),
          ),

          Positioned(
            right: 16,
            bottom: 120,
            child: MapControls(
              onMyLocationTap: _goToMyLocation,
              onSearchTap: _openSearchDialog,
            ),
          ),

          Positioned(
            right: 16,
            bottom: 40,
            child: FloatingActionButton(
              onPressed: () {
                showModalBottomSheet(
                  context: context,
                  isScrollControlled: true,
                  shape: const RoundedRectangleBorder(
                    borderRadius:
                        BorderRadius.vertical(top: Radius.circular(20)),
                  ),
                  builder: (_) => AddBinSheet(),
                );
              },
              child: const Icon(Icons.add),
            ),
          ),
        ],
      ),
    );
  }
}
