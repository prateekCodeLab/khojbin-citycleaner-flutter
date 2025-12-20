import 'dart:math';

class DistanceUtils {
  static double calculateDistance(
    double startLat,
    double startLng,
    double endLat,
    double endLng,
  ) {
    const double earthRadius = 6371; // km

    double dLat = _degToRad(endLat - startLat);
    double dLng = _degToRad(endLng - startLng);

    double a = sin(dLat / 2) * sin(dLat / 2) +
        cos(_degToRad(startLat)) *
            cos(_degToRad(endLat)) *
            sin(dLng / 2) *
            sin(dLng / 2);

    double c = 2 * atan2(sqrt(a), sqrt(1 - a));
    return earthRadius * c;
  }

  static double _degToRad(double deg) => deg * pi / 180;
}
