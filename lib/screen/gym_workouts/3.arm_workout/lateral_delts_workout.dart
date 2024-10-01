import 'package:flutter/material.dart';

class LateralShoulderScreen extends StatelessWidget {
  const LateralShoulderScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Shoulder Workouts'),
        backgroundColor: const Color.fromARGB(255, 116, 122, 133),
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: ListView(
          children: const [
            LateralShoulderTile(
              title: 'Side Lateral Raises',
              description: '4 x 12 reps',
            ),
            LateralShoulderTile(
              title: 'Cable Lateral Raises',
              description: '4 x 12 reps',
            ),
            LateralShoulderTile(
              title: 'Uprights Barbell Row',
              description: '4 x 12 reps',
            ),
          ],
        ),
      ),
    );
  }
}

class LateralShoulderTile extends StatelessWidget {
  final String title;
  final String description;

  const LateralShoulderTile({
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
