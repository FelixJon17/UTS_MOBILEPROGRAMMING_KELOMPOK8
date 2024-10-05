import 'package:fitnessapp/screen/gym_workouts/4.leg_workout/quads_Workout.dart';
import 'package:flutter/material.dart';

class QuadsScreen extends StatelessWidget {
  const QuadsScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Biceps Workouts'),
        backgroundColor: Colors.blueAccent,
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: ListView(
          children: const [
            QuadsTile(
              title: 'Hack Squat',
              description: '4 x 12 reps',
              assetPath: 'assets/img/arm/HackSquat.gif',
            ),
            QuadsTile(
              title: 'Leg Extension',
              description: '4 x 12 reps',
              assetPath: 'assets/img/arm/legext.gif',
            ),
            QuadsTile(
              title: 'Leg Press',
              description: '4 x 12 reps',
              assetPath: 'assets/img/arm/legpress.gif',
            ),
           
          ],
        ),
      ),
    );
  }
}

class QuadsTile extends StatelessWidget {
  final String title;
  final String description;
  final String assetPath;

  const QuadsTile({
    super.key,
    required this.title,
    required this.description,
    required this.assetPath,
  });

  @override
  Widget build(BuildContext context) {
    return Card(
      elevation: 4,
      margin: const EdgeInsets.symmetric(vertical: 10),
      child: Padding(
        padding: const EdgeInsets.all(8.0),
        child: Row(
          children: [
            Image.asset(
              assetPath,
              height: 160, // Ukuran tinggi gambar, bisa disesuaikan
              width: 160, // Ukuran lebar gambar, bisa disesuaikan
              fit: BoxFit.cover,
            ),
            const SizedBox(width: 16), // Spasi antara gambar dan teks
            Expanded(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start, // Text rata kiri
                children: [
                  Text(
                    title,
                    style: const TextStyle(
                      fontWeight: FontWeight.bold,
                      fontSize: 17,
                    ),
                  ),
                  const SizedBox(height: 8),
                  Text(
                    description,
                    style: const TextStyle(
                      fontWeight: FontWeight.bold,
                      color: Color.fromARGB(255, 0, 0, 0),
                    ),
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
