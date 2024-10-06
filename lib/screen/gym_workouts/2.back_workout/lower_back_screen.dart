import 'package:flutter/material.dart';

class LowerBackScreen extends StatelessWidget {
  const LowerBackScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Back Workouts'),
        backgroundColor: Colors.blueAccent,
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: ListView(
          children: const [
            LowerBackTile(
              title: 'Deadlift',
              description: '3 x 6 reps',
              assetPath: 'assets/img/back/deadlift.gif',
            ),
            LowerBackTile(
              title: 'Kettlebell Swing',
              description: '4 x 12 reps',
              assetPath: 'assets/img/back/kettlebell-swing.gif',
            ),
            LowerBackTile(
              title: 'Barbell Bent Over Row',
              description: '4 x 12 reps',
              assetPath: 'assets/img/back/barbell-bent-over-row.gif',
            ),
          ],
        ),
      ),
    );
  }
}

class LowerBackTile extends StatelessWidget {
  final String title;
  final String description;
  final String assetPath;

  const LowerBackTile({
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
              height: 200, // Ukuran tinggi gambar, bisa disesuaikan
              width: 200, // Ukuran lebar gambar, bisa disesuaikan
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
