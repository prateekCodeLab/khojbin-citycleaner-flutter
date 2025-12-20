import 'dart:convert';
import 'package:http/http.dart' as http;
import 'package:latlong2/latlong.dart';

class GeocodingService {
  static Future<LatLng?> searchByName(String placeName) async {
    final uri = Uri.parse(
      'https://nominatim.openstreetmap.org/search'
      '?q=$placeName&format=json&limit=1',
    );

    final response = await http.get(
      uri,
      headers: {
        'User-Agent': 'CityCleaner-App',
      },
    );

    if (response.statusCode == 200) {
      final List data = json.decode(response.body);

      if (data.isNotEmpty) {
        final lat = double.parse(data[0]['lat']);
        final lon = double.parse(data[0]['lon']);
        return LatLng(lat, lon);
      }
    }
    return null;
  }
}
