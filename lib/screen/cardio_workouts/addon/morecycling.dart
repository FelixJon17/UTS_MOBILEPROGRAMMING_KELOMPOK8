import 'package:flutter/material.dart';

class LearnMoreCyclingScreen extends StatelessWidget {
  const LearnMoreCyclingScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Learn More: Cycling'),
        backgroundColor: Colors.blueAccent,
      ),
      body: SingleChildScrollView(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Image.asset(
              'assets/img/cardio/cycling.gif',
              height: 200,
              fit: BoxFit.cover,
            ),
            const SizedBox(height: 10),
            const Text(
              'Recommended Cycling Routine:',
              style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
            ),
            const SizedBox(height: 10),
            const Text('- 45 minutes of cycling, 4 times a week.'),
            const Text('- Use a mix of steady and interval cycling.'),
            const SizedBox(height: 20),
            const Text(
              'Popular Cycling Places in Indonesia:',
              style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
            ),
            const SizedBox(height: 10),
            const Text('- Sudirman-Thamrin, Jakarta'),
            const Text('- Ubud Countryside, Bali'),
            const Text('- Bukit Tinggi, West Sumatra'),
          ],
        ),
      ),
    );
  }
}
