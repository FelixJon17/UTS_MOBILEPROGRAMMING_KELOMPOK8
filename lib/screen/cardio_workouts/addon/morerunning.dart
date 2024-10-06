import 'package:flutter/material.dart';
import 'package:flutter_map/flutter_map.dart';
import 'package:latlong2/latlong.dart';

class LearnMoreRunningScreen extends StatelessWidget {
  const LearnMoreRunningScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Learn More: Running'),
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
                        point: LatLng(-6.2146, 106.8451), // Gelora Bung Karno Stadium Jakarta
                        builder: (ctx) => const Icon(
                          Icons.location_on,
                          color: Colors.red,
                          size: 30,
                        ),
                      ),
                      Marker(
                        point: LatLng(-6.9352, 107.5902), // Taman Hutan Raya Bandung
                        builder: (ctx) => const Icon(
                          Icons.location_on,
                          color: Colors.red,
                          size: 30,
                        ),
                      ),
                      Marker(
                        point: LatLng(-8.6804, 115.1632), //  Bali
                        builder: (ctx) => const Icon(
                          Icons.location_on,
                          color: Colors.red,
                          size: 30,
                        ),
                      ),
                      Marker(
                        point: LatLng(-6.1185, 106.8423), // Ancol
                        builder: (ctx) => const Icon(
                          Icons.location_on,
                          color: Colors.red,
                          size: 30,
                        ),
                      ),
                      Marker(
                        point: LatLng(-5.1443, 119.4071), // Pantai Losari Makassar
                        builder: (ctx) => const Icon(
                          Icons.location_on,
                          color: Colors.red,
                          size: 30,
                        ),
                      ),
                      Marker(
                        point: LatLng(-7.9425, 112.9530), //Bromo
                        builder: (ctx) => const Icon(
                          Icons.location_on,
                          color: Colors.red,
                          size: 30,
                        ),
                      ),
                      Marker(
                        point: LatLng(2.6873, 98.8752), // TobaSumatra
                        builder: (ctx) => const Icon(
                          Icons.location_on,
                          color: Colors.red,
                          size: 30,
                        ),
                      ),
                      Marker(
                        point: LatLng(-7.2575, 112.7521), // Taman Bungkul Surabaya
                        builder: (ctx) => const Icon(
                          Icons.location_on,
                          color: Colors.red,
                          size: 30,
                        ),
                      ),
                      Marker(
                        point: LatLng(3.5952, 98.6722), // Car Free Day Medan
                        builder: (ctx) => const Icon(
                          Icons.location_on,
                          color: Colors.red,
                          size: 30,
                        ),
                      ),
                      Marker(
                        point: LatLng(-0.9492, 100.3540), // Pantai Padang Sumatra
                        builder: (ctx) => const Icon(
                          Icons.location_on,
                          color: Colors.red,
                          size: 30,
                        ),
                      ),
                      Marker(
                        point: LatLng(-8.7051, 115.2625), //  Sanur pantai Bali
                        builder: (ctx) => const Icon(
                          Icons.location_on,
                          color: Colors.red,
                          size: 30,
                        ),
                      ),
                      Marker(
                        point: LatLng(-8.0144, 110.3228), // Parangtritis Yogyakarta
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
                        point: LatLng(-6.7002, 106.9516), // Puncak
                        builder: (ctx) => const Icon(
                          Icons.location_on,
                          color: Colors.red,
                          size: 30,
                        ),
                      ),
                      Marker(
                        point: LatLng(-8.5069, 115.2625), // Ubud Bali
                        builder: (ctx) => const Icon(
                          Icons.location_on,
                          color: Colors.red,
                          size: 30,
                        ),
                      ),
                      Marker(
                        point: LatLng(-6.2407, 107.0005), // Summarecon Apartment Springlake
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
            const SizedBox(height: 20),
            const Text(
              '  Popular Running Places in Indonesia:',
              style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
            ),
            const SizedBox(height: 10),
            const Text('  - Gelora Bung Karno Stadium, Jakarta'),
            const Text('  - Taman Hutan Raya, Bandung'),
            const Text('  - Bali Beachwalk, Bali'),
            const Text('  - Ancol, Jakarta'),
            const Text('  - Pantai Losari, Makassar'),
            const Text('  - Mount Bromo, East Java'),
            const Text('  - Toba Lake Area, North Sumatra'),
            const Text('  - Taman Bungkul, Surabaya'),
            const Text('  - Car Free Day in Medan'),
            const Text('  - Pantai Padang, West Sumatra'),
            const Text('  - Sanur Beach, Bali'),
            const Text('  - Parangtritis Beach, Yogyakarta'),
            const Text('  - Dago Pakar, Bandung'),
            const Text('  - Puncak, West Java'),
            const Text('  - Ubud, Bali'),
          ],
        ),
      ),
    );
  }
}
