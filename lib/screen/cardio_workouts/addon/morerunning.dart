import 'package:flutter/material.dart';

class LearnMoreRunningScreen extends StatelessWidget {
  const LearnMoreRunningScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Learn More: Running'),
        backgroundColor: Colors.blueAccent,
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: const [
            Text(
              'Recommended Running Routine:',
              style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
            ),
            SizedBox(height: 10),
            Text('- 30 minutes of running, 3 times a week.'),
            Text('- Interval training for speed improvement.'),
            SizedBox(height: 20),
            Text(
              'Popular Running Places in Indonesia:',
              style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
            ),
            SizedBox(height: 10),
            Text('- Gelora Bung Karno Stadium, Jakarta'),
            Text('- Taman Hutan Raya, Bandung'),
            Text('- Bali Beachwalk, Bali'),
          ],
        ),
      ),
    );
  }
}
