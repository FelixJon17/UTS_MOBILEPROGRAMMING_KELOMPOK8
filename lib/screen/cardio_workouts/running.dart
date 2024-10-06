import 'package:flutter/material.dart';
import 'addon/morerunning.dart';

class RunningWidget extends StatelessWidget {
  const RunningWidget({super.key});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(16.0),
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Image.asset(
            'assets/img/cardio/Running.png',
            width: 80,
            height: 80,
          ),
          const SizedBox(width: 16),
          Expanded(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                const Text(
                  'Running',
                  style: TextStyle(fontSize: 22, fontWeight: FontWeight.bold),
                ),
                const SizedBox(height: 8),
                const Text(
                    'Running is great for improving endurance and burning calories.'),
                const SizedBox(height: 8),
                const Text(
                    '- Recommended Duration: 30-45 minutes, 3-4 times per week.\n'
                    '- Best Posture: Keep your elbows at 90 degrees and land softly to avoid injuries.\n'
                    '- Tip: Incorporate interval sprints to improve both speed and stamina.'),
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
          ),
        ],
      ),
    );
  }
}
