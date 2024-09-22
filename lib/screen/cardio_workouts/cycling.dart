import 'package:flutter/material.dart';
import 'addon/morecycling.dart';

class CyclingWidget extends StatelessWidget {
  const CyclingWidget({super.key});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(16.0),
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
    );
  }
}
