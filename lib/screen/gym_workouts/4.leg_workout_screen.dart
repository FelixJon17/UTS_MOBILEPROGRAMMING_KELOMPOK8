import '4.leg_workout/calves_workout.dart';
import '4.leg_workout/hamstring_workout.dart';
import '4.leg_workout/quads_Workout.dart';
import 'package:flutter/material.dart';

class LegWorkoutsScreen extends StatelessWidget {
  const LegWorkoutsScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Leg Workouts'),
        backgroundColor: Colors.blueAccent,
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: ListView(
          children: [
            HomeFeatureTile(
              title: 'Quads',
              onTap: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(
                    builder: (context) => const QuadsScreen(),
                  ),
                );
              },
            ),
            HomeFeatureTile(
              title: 'Hamstring',
              onTap: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(
                    builder: (context) => const HamstringScreen(),
                  ),
                );
              },
            ),
            HomeFeatureTile(
              title: 'Calves',
              onTap: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(
                    builder: (context) => const CalvesScreen(),
                  ),
                );
              },
            ),
          ],
        ),
      ),
    );
  }
}

class HomeFeatureTile extends StatelessWidget {
  final String title;
  final VoidCallback onTap;
  const HomeFeatureTile({
    super.key,
    required this.title,
    required this.onTap,
  });

  @override
  Widget build(BuildContext context) {
    return Card(
      elevation: 4,
      margin: const EdgeInsets.symmetric(vertical: 10),
      child: InkWell(
        onTap: onTap,
        child: Container(
          padding: const EdgeInsets.all(20.0), // Padding untuk seluruh konten
          height: 120, // Tinggi card
          child: Row(
            children: [
              // Gambar di sebelah kiri
              Container(
                width: 70, // Lebar gambar
                height: 70, // Tinggi gambar
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(
                      10), // Membuat sudut gambar melengkung
                ),
                child: Image.asset(
                  'assets/img/leg/leg.png', // Path gambar
                  fit: BoxFit.cover, // Agar gambar memenuhi container
                ),
              ),
              const SizedBox(width: 20), // Jarak antara gambar dan teks

              // Bagian teks di sebelah kanan
              Expanded(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Text(
                      title,
                      style: const TextStyle(
                        fontWeight: FontWeight.bold,
                        fontSize: 20, // Ukuran font lebih besar
                      ),
                    ),
                    const SizedBox(height: 10),
                  ],
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
