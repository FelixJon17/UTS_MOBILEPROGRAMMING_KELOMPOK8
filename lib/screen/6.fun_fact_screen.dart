import 'dart:math';
import 'package:flutter/material.dart';

class FunFactsScreen extends StatefulWidget {
  const FunFactsScreen(
      {super.key}); // Use Key? here to avoid positional argument issue

  @override
  FunFactsScreenState createState() =>
      FunFactsScreenState(); // Public state class
}

class FunFactsScreenState extends State<FunFactsScreen> {
  final List<String> funFacts = [
    'Always warm up before starting your workout to prevent injuries.',
    'Maintain proper form during exercises to target the right muscles.',
    'Stay hydrated before, during, and after your workouts.',
    'Incorporate rest days in your routine to allow muscle recovery.',
    'Gradually increase weights to avoid straining your muscles and joints.',
    'Music improves workout performance.',
    'Running 10 minutes per mile can burn 104 calories per mile.'
  ];

  final List<String> trainerTips = [
    'Try walking in intervals for a fun challenge.',
    'Change your walking route to keep things fresh.',
    'Listen to podcasts or audiobooks to stay entertained.',
    'Join a walking group for motivation.',
    'Track your steps to monitor progress.',
    'Incorporate stretches during your walk.',
    'Set goals for distance or time and celebrate achievements.'
  ];

  String currentFact = ''; // Explicit type added
  String currentTip = ''; // Explicit type added

  @override
  void initState() {
    super.initState();
    _getRandomFunFact(); // Set a random fact when screen loads
    _getRandomTrainerTip(); // Set a random trainer tip when screen loads
  }

  // Function to get a random fun fact
  void _getRandomFunFact() {
    final random = Random();
    setState(() {
      currentFact = funFacts[random.nextInt(funFacts.length)];
    });
  }

  // Function to get a random trainer tip
  void _getRandomTrainerTip() {
    final random = Random();
    setState(() {
      currentTip = trainerTips[random.nextInt(trainerTips.length)];
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Fun Facts & Trainer Tips'),
        backgroundColor: Colors.purple,
      ),
      body: GestureDetector(
        onTap: () {
          _getRandomFunFact();
          _getRandomTrainerTip();
        }, // Handle tap to refresh both fun fact and trainer tip
        child: Container(
          decoration: const BoxDecoration(
            gradient: LinearGradient(
              colors: [
                Colors.purple,
                Colors.purpleAccent,
              ],
              begin: Alignment.topCenter,
              end: Alignment.bottomCenter,
            ),
          ),
          child: Center(
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: [
                _buildCard('Fun Fact', currentFact, _getRandomFunFact),
                _buildCard('Trainer Tip', currentTip, _getRandomTrainerTip),
              ],
            ),
          ),
        ),
      ),
    );
  }

  // Helper method to build cards for both sections
  Widget _buildCard(String title, String content, VoidCallback onPress) {
    return Card(
      margin: const EdgeInsets.symmetric(horizontal: 15, vertical: 10),
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(15),
      ),
      elevation: 10,
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
                Text(
                  title,
                  style: const TextStyle(
                    fontWeight: FontWeight.bold,
                    fontSize: 22,
                    color: Colors.white,
                  ),
                ),
              ],
            ),
            const SizedBox(height: 20),
            Text(
              content,
              style: const TextStyle(
                fontSize: 18,
                color: Colors.white,
              ),
              textAlign: TextAlign.center,
            ),
            const SizedBox(height: 20),
            ElevatedButton(
              onPressed: onPress, // Fixed VoidCallback type issue
              style: ElevatedButton.styleFrom(
                backgroundColor: Colors.purpleAccent,
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(10),
                ),
              ),
              child: const Text(
                'Get Another',
                style: TextStyle(
                  fontSize: 16,
                  color: Colors.white,
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
