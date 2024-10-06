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
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Expanded(
              child: SizedBox(
                height: 300,
                child: FlutterMap(
                  options: MapOptions(
                    center: LatLng(-6.2146, 106.8451),
                    zoom: 13.0,
                  ),
                  children: [
                    TileLayer(
                      urlTemplate: "https://{s}.tile.openstreetmap.org/{z}/{x}/{y}.png",
                      subdomains: const ['a', 'b', 'c'],
                    ),
                    MarkerLayer(
                      markers: [
                        Marker(
                          point: LatLng(-6.2088, 106.8456), 
                          builder: (ctx) => const Icon(
                            Icons.location_on,
                            color: Colors.red,
                            size: 30,
                          ),
                        ),
                        Marker(
                          point: LatLng(-8.5069, 115.2625), 
                          builder: (ctx) => const Icon(
                            Icons.location_on,
                            color: Colors.red,
                            size: 30,
                          ),
                        ),
                        Marker(
                          point: LatLng(-0.3095, 100.3692), 
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
            ),
            const SizedBox(height: 20),
            const SizedBox(height: 10),
            const Text(
              'Recommended Cycling Routine:',
              style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
            ),
            const SizedBox(height: 10),
            const Text('- 45 minutes of cycling, 4 times a week.'),
            const Text('- Use a mix of steady and interval cycling.'),
            const SizedBox(height: 20),
            const Text(
              'Popular Cycling Places in Indonesia:',
              style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
            ),
            const SizedBox(height: 10),
            const Text('- Sudirman-Thamrin, Jakarta'),
            const Text('- Ubud Countryside, Bali'),
            const Text('- Bukit Tinggi, West Sumatra'),
          ],
        ),
      ),
    );
  }
}
