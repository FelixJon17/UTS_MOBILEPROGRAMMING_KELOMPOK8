import 'package:flutter/material.dart';
import 'addon/morerunning.dart';

class RunningWidget extends StatelessWidget {
  const RunningWidget({super.key});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(16.0),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          const Text(
            'Running',
            style: TextStyle(fontSize: 22, fontWeight: FontWeight.bold),
          ),
          const SizedBox(height: 8),
          const Text('Running is great for improving endurance and burning calories.'),
          const SizedBox(height: 8),
          ElevatedButton(
            onPressed: () {
              Navigator.push(
                context,
                MaterialPageRoute(
                  builder: (context) => const LearnMoreRunningScreen(),
                ),
              );
            },
            child: const Text('Learn More'),
          ),
        ],
      ),
    );
  }
}
