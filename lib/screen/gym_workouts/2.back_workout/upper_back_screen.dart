import 'package:flutter/material.dart';

class UpperBackScreen extends StatelessWidget {
  const UpperBackScreen({super.key});

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
            UpperBackTile(
              title: 'Shrugs',
              description: '4 x 12 reps',
            ), UpperBackTile(
              title: 'One Arm Dumbbell Row',
              description: '4 x 12 reps',
            ), UpperBackTile(
              title: 'Bent Over Row',
              description: '4 x 12 reps',
            ), UpperBackTile(
              title: 'Bent Over Dumbbell Row',
              description: '4 x 12 reps',
            ),
          ],
        ),
      ),
    );
  }
}

class UpperBackTile extends StatelessWidget {
  final String title;
  final String description;

  const UpperBackTile({
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
