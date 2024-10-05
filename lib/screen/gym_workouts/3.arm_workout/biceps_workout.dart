import 'package:flutter/material.dart';

class BicepsScreen extends StatelessWidget {
  const BicepsScreen({super.key});

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
            BicepsTile(
              title: 'Biceps Curls',
              description: '4 x 12 reps',
              assetPath: 'assets/img/arn/biceps-curls.gif',
            ),
            BicepsTile(
              title: 'Spider Curl',
              description: '4 x 12 reps',
              assetPath: 'assets/img/arm/biceps-curls.gif',
            ),
            BicepsTile(
              title: 'Cable Curl',
              description: '4 x 12 reps',
              assetPath: 'assets/img/arm/biceps-curls.gif',
            ),
          ],
        ),
      ),
    );
  }
}

class BicepsTile extends StatelessWidget {
  final String title;
  final String description;
  final String assetPath;

  const BicepsTile({
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
