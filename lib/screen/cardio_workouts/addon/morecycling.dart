import 'package:flutter/material.dart';
import 'package:flutter_map/flutter_map.dart';
import 'package:latlong2/latlong.dart';

class LearnMoreCyclingScreen extends StatelessWidget {
  const LearnMoreCyclingScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Learn More: Cycling'),
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
                        point: LatLng(-6.2088, 106.8456), // SudirmanThamrin
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
                        point: LatLng(-0.3095, 100.3692), // Bukit Tinggi Sumatra
                        builder: (ctx) => const Icon(
                          Icons.location_on,
                          color: Colors.red,
                          size: 30,
                        ),
                      ),
                      Marker(
                        point: LatLng(-7.7972, 110.3695), //Yogyakarta
                        builder: (ctx) => const Icon(
                          Icons.location_on,
                          color: Colors.red,
                          size: 30,
                        ),
                      ),
                      Marker(
                        point: LatLng(2.6817, 98.9405), //Toba Sumatra
                        builder: (ctx) => const Icon(
                          Icons.location_on,
                          color: Colors.red,
                          size: 30,
                        ),
                      ),
                      Marker(
                        point: LatLng(-7.9824, 112.6265), //Batu Malang
                        builder: (ctx) => const Icon(
                          Icons.location_on,
                          color: Colors.red,
                          size: 30,
                        ),
                      ),
                      Marker(
                        point: LatLng(-6.1180, 106.7394), //Pantai Indah Kapuk
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
                        point: LatLng(-8.7198, 115.1686), //Kuta Bali
                        builder: (ctx) => const Icon(
                          Icons.location_on,
                          color: Colors.red,
                          size: 30,
                        ),
                      ),
                      Marker(
                        point: LatLng(-7.9425, 112.9539), // Bromo
                        builder: (ctx) => const Icon(
                          Icons.location_on,
                          color: Colors.red,
                          size: 30,
                        ),
                      ),
                      Marker(
                        point: LatLng(-6.4822, 105.7421), // Tanjung Lesung Banten
                        builder: (ctx) => const Icon(
                          Icons.location_on,
                          color: Colors.red,
                          size: 30,
                        ),
                      ),
                      Marker(
                        point: LatLng(-8.3465, 116.0467), // Gili Trawangan Lombok
                        builder: (ctx) => const Icon(
                          Icons.location_on,
                          color: Colors.red,
                          size: 30,
                        ),
                      ),
                      Marker(
                        point: LatLng(-8.8087, 115.2250), // Nusa Dua Bali
                        builder: (ctx) => const Icon(
                          Icons.location_on,
                          color: Colors.red,
                          size: 30,
                        ),
                      ),
                      Marker(
                        point: LatLng(-8.4159, 116.4551), // Gunung Rinjani Base Lombok
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
                  Text(
                    'Recommended Cycling Routine:',
                    style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
                  ),
                  SizedBox(height: 10),
                  Text('- 45 minutes of cycling, 4 times a week.'),
                  Text('- Use a mix of steady and interval cycling.'),
                  SizedBox(height: 20),
                  Text(
                    'Popular Cycling Places in Indonesia:',
                    style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
                  ),
                  SizedBox(height: 10),
                  Text('- Sudirman-Thamrin, Jakarta'),
                  Text('- Ubud Countryside, Bali'),
                  Text('- Bukit Tinggi, West Sumatra'),
                  Text('- Yogyakarta City Tour, Yogyakarta'),
                  Text('- Toba Lake, North Sumatra'),
                  Text('- Batu City, Malang'),
                  Text('- Pantai Indah Kapuk, Jakarta'),
                  Text('- Ancol, Jakarta'),
                  Text('- Kuta Beach, Bali'),
                  Text('- Mount Bromo, East Java'),
                  Text('- Tanjung Lesung, Banten'),
                  Text('- Gili Trawangan, Lombok'),
                  Text('- Nusa Dua, Bali'),
                  Text('- Gunung Rinjani Base, Lombok'),
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
