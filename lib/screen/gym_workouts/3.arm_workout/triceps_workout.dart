import 'package:flutter/material.dart';

class TricepsScreen extends StatelessWidget {
  const TricepsScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Tricep Workouts'),
        backgroundColor: const Color.fromARGB(255, 116, 122, 133),
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: ListView(
          children: const [
            TricepsTile(
              title: 'Triceps Pushdown',
              description: '4 x 12 reps',
            ),
            TricepsTile(
              title: 'Skull Crusher',
              description: '4 x 12 reps',
            ),
            TricepsTile(
              title: ' Overhead Triceps Extension',
              description: '4 x 12 reps',
            ),
          ],
        ),
      ),
    );
  }
}

class TricepsTile extends StatelessWidget {
  final String title;
  final String description;

  const TricepsTile({
    super.key,
    required this.title,
    required this.description,
  });

  @override
  Widget build(BuildContext context) {
    return Card(
      elevation: 4,
      margin: const EdgeInsets.symmetric(vertical: 10),
      child: ListTile(
        leading: const Icon(Icons.fitness_center,
            size: 40, color: Colors.blueAccent),
        title: Text(
          title,
          style: const TextStyle(fontWeight: FontWeight.bold),
        ),
        subtitle: Text(description),
      ),
    );
  }
}
