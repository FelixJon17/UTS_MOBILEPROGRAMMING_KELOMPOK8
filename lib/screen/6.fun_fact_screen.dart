import 'dart:math';
import 'package:flutter/material.dart';

class FunFactsScreen extends StatefulWidget {
  const FunFactsScreen({super.key});

  @override
  _FunFactsScreenState createState() => _FunFactsScreenState();
}

class _FunFactsScreenState extends State<FunFactsScreen> {
  final List<String> funFacts = [
    'Always warm up before starting your workout to prevent injuries.',
    'Maintain proper form during exercises to target the right muscles.',
    'Stay hydrated before, during, and after your workouts.',
    'Incorporate rest days in your routine to allow muscle recovery.',
    'Gradually increase weights to avoid straining your muscles and joints.',
    'Music improves workout performance.',
    'Running 10 minutes per mile can burn 104 calories per mile.'
  ];

  String currentFact = '';

  @override
  void initState() {
    super.initState();
    _getRandomFunFact(); // Set a random fact when screen loads
  }

  // Function to get a random fun fact
  void _getRandomFunFact() {
    final random = Random();
    setState(() {
      currentFact = funFacts[random.nextInt(funFacts.length)];
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Fun Facts'),
      ),
      body: GestureDetector(
        onTap: _getRandomFunFact, // Handle tap to refresh the fun fact
        child: Center(
          child: Card(
            margin: const EdgeInsets.symmetric(horizontal: 15, vertical: 10),
            shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(15),
            ),
            child: Padding(
              padding: const EdgeInsets.all(20),
              child: Column(
                mainAxisSize: MainAxisSize.min,
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  Row(
                    children: [
                      CircleAvatar(
                        backgroundColor: Colors.purple.shade100,
                        radius: 30,
                        child: const Icon(
                          Icons.lightbulb_outline,
                          color: Colors.purple,
                          size: 30,
                        ),
                      ),
                      const SizedBox(width: 10),
                      const Text(
                        'Trainer Tip',
                        style: TextStyle(
                          fontWeight: FontWeight.bold,
                          fontSize: 22,
                        ),
                      ),
                    ],
                  ),
                  const SizedBox(height: 20),
                  Text(
                    currentFact,
                    style: TextStyle(
                      fontSize: 18,
                      color: Colors.grey[700],
                    ),
                    textAlign: TextAlign.center,
                  ),
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}
