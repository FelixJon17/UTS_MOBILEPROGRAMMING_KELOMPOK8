import 'package:flutter/material.dart';
import 'package:flutter_map/flutter_map.dart';
import 'package:latlong2/latlong.dart';

class LearnMoreJoggingScreen extends StatelessWidget {
  const LearnMoreJoggingScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Learn More: Jogging'),
        backgroundColor: Colors.blueAccent,
      ),
      body: SingleChildScrollView(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            SizedBox(
              height: 400,
              width: double.infinity,
              child: FlutterMap(
                options: MapOptions(
                  center: LatLng(-6.2146, 106.8451),
                  zoom: 6.0,
                ),
                children: [
                  TileLayer(
                    urlTemplate: "https://{s}.tile.openstreetmap.org/{z}/{x}/{y}.png",
                    subdomains: const ['a', 'b', 'c'],
                  ),
                  MarkerLayer(
                    markers: [
                      Marker(
                        point: LatLng(-6.1751, 106.8272), // Monas
                        builder: (ctx) => const Icon(
                          Icons.location_on,
                          color: Colors.red,
                          size: 30,
                        ),
                      ),
                      Marker(
                        point: LatLng(-6.3017, 106.8956), // Taman Mini Jakarta
                        builder: (ctx) => const Icon(
                          Icons.location_on,
                          color: Colors.red,
                          size: 30,
                        ),
                      ),
                      Marker(
                        point: LatLng(-6.9175, 107.6191), // Car Free Day Bandung
                        builder: (ctx) => const Icon(
                          Icons.location_on,
                          color: Colors.red,
                          size: 30,
                        ),
                      ),
                      Marker(
                        point: LatLng(-7.2575, 112.7521), // Car Free Day Surabaya
                        builder: (ctx) => const Icon(
                          Icons.location_on,
                          color: Colors.red,
                          size: 30,
                        ),
                      ),
                      Marker(
                        point: LatLng(-6.2755, 106.8209), // Taman Suropati Jakarta
                        builder: (ctx) => const Icon(
                          Icons.location_on,
                          color: Colors.red,
                          size: 30,
                        ),
                      ),
                      Marker(
                        point: LatLng(-6.1185, 106.8423), // Ancol Dreamland Jakarta
                        builder: (ctx) => const Icon(
                          Icons.location_on,
                          color: Colors.red,
                          size: 30,
                        ),
                      ),
                      Marker(
                        point: LatLng(-6.1684, 106.8314), // Lapangan Banteng Jakarta
                        builder: (ctx) => const Icon(
                          Icons.location_on,
                          color: Colors.red,
                          size: 30,
                        ),
                      ),
                      Marker(
                        point: LatLng(-6.2186, 106.8017), // Senayan Jakarta
                        builder: (ctx) => const Icon(
                          Icons.location_on,
                          color: Colors.red,
                          size: 30,
                        ),
                      ),
                      Marker(
                        point: LatLng(-6.1976, 106.8235), // Taman Menteng Jakarta
                        builder: (ctx) => const Icon(
                          Icons.location_on,
                          color: Colors.red,
                          size: 30,
                        ),
                      ),
                      Marker(
                        point: LatLng(-6.1344, 106.8133), // Kota Tua Jakarta
                        builder: (ctx) => const Icon(
                          Icons.location_on,
                          color: Colors.red,
                          size: 30,
                        ),
                      ),
                      Marker(
                        point: LatLng(-6.5983, 106.7991), // Kebun Raya Bogor 
                        builder: (ctx) => const Icon(
                          Icons.location_on,
                          color: Colors.red,
                          size: 30,
                        ),
                      ),
                      Marker(
                        point: LatLng(-6.1935, 106.8159), // Situ Lembang Jakarta
                        builder: (ctx) => const Icon(
                          Icons.location_on,
                          color: Colors.red,
                          size: 30,
                        ),
                      ),
                      Marker(
                        point: LatLng(-6.8607, 107.6191), // Dago Pakar Bandung
                        builder: (ctx) => const Icon(
                          Icons.location_on,
                          color: Colors.red,
                          size: 30,
                        ),
                      ),
                      Marker(
                        point: LatLng(-6.2447, 107.0012), // Summarecon Bekasi
                        builder: (ctx) => const Icon(
                          Icons.location_on,
                          color: Colors.red,
                          size: 30,
                        ),
                      ),
                    ],
                  ),
                ],
              ),
            ),
            const Padding(
              padding: EdgeInsets.all(16.0),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  SizedBox(height: 20),
                  Text('Recommended Jogging Routine:',
                    style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
                  ),
                  SizedBox(height: 10),
                  Text('- 20-30 minutes of jogging, 5 times a week.'),
                  Text('- Focus on endurance, maintain a slow pace.'),
                  SizedBox(height: 20),
                  Text('Popular Jogging Places in Indonesia:',
                    style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
                  ),
                  SizedBox(height: 10),
                  Text('- Monas Park, Jakarta'),
                  Text('- Taman Mini Indonesia, Jakarta'),
                  Text('- Car Free Day in Bandung and Surabaya'),
                  Text('- Taman Suropati, Jakarta'),
                  Text('- Ancol Dreamland, Jakarta'),
                  Text('- Lapangan Banteng, Jakarta'),
                  Text('- Senayan Area, Jakarta'),
                  Text('- Taman Menteng, Jakarta'),
                  Text('- Kota Tua, Jakarta'),
                  Text('- Kebun Raya Bogor, West Java'),
                  Text('- Situ Lembang, Jakarta'),
                  Text('- Dago Pakar, Bandung'),
                  Text('- Summarecon Bekasi'),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
