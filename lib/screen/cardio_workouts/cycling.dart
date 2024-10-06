import 'package:flutter/material.dart';
import 'addon/morecycling.dart';

class CyclingWidget extends StatelessWidget {
  const CyclingWidget({super.key});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(16.0),
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Image.asset(
            'assets/img/cardio/Cycling.png',
            width: 80,
            height: 80,
          ),
          const SizedBox(width: 16),
          Expanded(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                const Text(
                  'Cycling',
                  style: TextStyle(fontSize: 22, fontWeight: FontWeight.bold),
                ),
                const SizedBox(height: 8),
                const Text(
                    'Cycling strengthens leg muscles and boosts cardiovascular health.'),
                const SizedBox(height: 8),
                const Text(
                    '- Recommended Duration: 45 minutes, 3-4 times per week.\n'
                    '- Best Posture: Keep your back straight and maintain a relaxed grip on the handlebars.\n'
                    '- Tip: Use a mix of steady rides and interval cycling for optimal benefits.'),
                const SizedBox(height: 8),
                ElevatedButton(
                  onPressed: () {
                    Navigator.push(
                      context,
                      MaterialPageRoute(
                        builder: (context) => const LearnMoreCyclingScreen(),
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
