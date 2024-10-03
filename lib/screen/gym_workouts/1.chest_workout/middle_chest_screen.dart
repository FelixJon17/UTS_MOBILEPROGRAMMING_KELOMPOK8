import 'package:flutter/material.dart';

class MiddleChestScreen extends StatelessWidget {
  const MiddleChestScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Chest Workouts'),
        backgroundColor: Colors.blueAccent,
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: ListView(
          children: const [
            UpperChestTile(
              title: 'Dumbbell Press',
              description: '4 x 12 reps',
              assetPath: 'assets/img/chest/dumbell-press.gif',
            ),
            UpperChestTile(
              title: 'Bench Press',
              description: '4 x 12 reps',
              assetPath: 'assets/img/chest/bench-press.gif',
            ),
            UpperChestTile(
              title: 'Dumbell Fly',
              description: '4 x 12 reps',
              assetPath: 'assets/img/chest/dumbell-fly.gif',
            ),
            UpperChestTile(
              title: 'Machine Fly',
              description: '4 x 12 reps',
              assetPath: 'assets/img/chest/machine-fly.gif',
            ),
          ],
        ),
      ),
    );
  }
}

class UpperChestTile extends StatelessWidget {
  final String title;
  final String description;
  final String assetPath;

  const UpperChestTile({
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
        child: Column(
          children: [
            Image.asset(
              assetPath,
              height: 200, // Ukuran tinggi GIF bisa disesuaikan
              fit: BoxFit.cover,
            ),
            const SizedBox(height: 8),
            Text(
              title,
              style: const TextStyle(
                fontWeight: FontWeight.bold,
                fontSize: 18,
              ),
            ),
            const SizedBox(height: 4),
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
    );
  }
}
