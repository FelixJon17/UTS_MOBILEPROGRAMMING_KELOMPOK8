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
          children: const [LowerBackTile(
              title: 'Deadlift',
              description: '3 x 5 reps',
            ), LowerBackTile(
              title: 'Romanian Deadlift',
              description: '3 x 8 reps',
            ), LowerBackTile(
              title: 'Kettlebell Swing',
              description: '4 x 12 reps',
            ), LowerBackTile(
              title: 'Good Morning',
              description: '2 x 12 reps',
            ),],
        ),
      ),
    );
  }
}

class LowerBackTile extends StatelessWidget {
  final String title;
  final String description;

  const LowerBackTile({
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
