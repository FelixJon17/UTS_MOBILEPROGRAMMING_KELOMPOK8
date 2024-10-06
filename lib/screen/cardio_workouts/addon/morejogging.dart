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
                          point: LatLng(-6.1751, 106.8272), 
                          builder: (ctx) => const Icon(
                            Icons.location_on,
                            color: Colors.red,
                            size: 30,
                          ),
                        ),
                        Marker(
                          point: LatLng(-6.3017, 106.8956), 
                          builder: (ctx) => const Icon(
                            Icons.location_on,
                            color: Colors.red,
                            size: 30,
                          ),
                        ),
                        Marker(
                          point: LatLng(-6.9175, 107.6191), 
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
            const Text(
              'Recommended Jogging Routine:',
              style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
            ),
            const SizedBox(height: 10),
            const Text('- 20-30 minutes of jogging, 5 times a week.'),
            const Text('- Focus on endurance, maintain a slow pace.'),
            const SizedBox(height: 20),
            const Text(
              'Popular Jogging Places in Indonesia:',
              style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
            ),
            const SizedBox(height: 10),
            const Text('- Monas Park, Jakarta'),
            const Text('- Taman Mini Indonesia, Jakarta'),
            const Text('- Car Free Day in Bandung and Surabaya'),
          ],
        ),
      ),
    );
  }
}
