import 'package:flutter/material.dart';

class HamstringScreen extends StatelessWidget {
  const HamstringScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Hamstring Workouts'),
        backgroundColor: const Color.fromARGB(255, 116, 122, 133),
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: ListView(
          children: const [
            HamstringTile(
              title: 'Bulgarian Split Squats',
              description: '4 x 12 reps',
            ),
            HamstringTile(
              title: 'Seated Hamstring curls',
              description: '4 x 12 reps',
            ),
            HamstringTile(
              title: 'Prone Leg Curls',
              description: '4 x 12 reps',
            ),
          ],
        ),
      ),
    );
  }
}

class HamstringTile extends StatelessWidget {
  final String title;
  final String description;

  const HamstringTile({
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
