import 'package:flutter/material.dart';

class LearnMoreJoggingScreen extends StatelessWidget {
  const LearnMoreJoggingScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Learn More: Jogging'),
        backgroundColor: Colors.blueAccent,
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: const [
            Text(
              'Recommended Jogging Routine:',
              style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
            ),
            SizedBox(height: 10),
            Text('- 20-30 minutes of jogging, 5 times a week.'),
            Text('- Focus on endurance, maintain a slow pace.'),
            SizedBox(height: 20),
            Text(
              'Popular Jogging Places in Indonesia:',
              style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
            ),
            SizedBox(height: 10),
            Text('- Monas Park, Jakarta'),
            Text('- Taman Mini Indonesia, Jakarta'),
            Text('- Car Free Day in Bandung and Surabaya'),
          ],
        ),
      ),
    );
  }
}
