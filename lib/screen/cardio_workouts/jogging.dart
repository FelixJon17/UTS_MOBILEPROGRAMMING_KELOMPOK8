import 'package:flutter/material.dart';
import 'addon/morejogging.dart';

class JoggingWidget extends StatelessWidget {
  const JoggingWidget({super.key});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(16.0),
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Image.asset(
            'assets/img/cardio/Jogging.jpg',
            width: 80,
            height: 80,
          ),
          const SizedBox(width: 16),
          Expanded(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                const Text(
                  'Jogging',
                  style: TextStyle(fontSize: 22, fontWeight: FontWeight.bold),
                ),
                const SizedBox(height: 8),
                const Text(
                    'Jogging is a good daily cardio exercise that is less intense than running.'),
                const SizedBox(height: 8),
                const Text(
                    '- Recommended Duration: 20-30 minutes, 5 times per week.\n'
                    '- Best Posture: Keep your chest lifted and land mid-foot to reduce impact.\n'
                    '- Tip: Start at a slow pace and gradually increase speed to improve stamina.'),
                const SizedBox(height: 8),
                ElevatedButton(
                  onPressed: () {
                    Navigator.push(
                      context,
                      MaterialPageRoute(
                        builder: (context) => const LearnMoreJoggingScreen(),
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
