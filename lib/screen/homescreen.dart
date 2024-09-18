import 'package:flutter/material.dart';
import 'protein_calculator_screen.dart';
import 'gym_workouts.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Fitness App Home'),
        backgroundColor: Colors.blueAccent,
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: ListView(
          children: [
            HomeFeatureTile(
              icon: Icons.login,
              title: 'Login',
              description: 'Login to your account with name and email',
              onTap: () {
                // Navigate to login screen
              },
            ),
            HomeFeatureTile(
              icon: Icons.fitness_center,
              title: 'GYM Workouts',
              description:
                  'Guides for chest, back, arms, shoulders, and legs workouts',
              onTap: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(
                    builder: (context) => const GymWorkoutsScreen(),
                  ),
                );
              },
            ),
            HomeFeatureTile(
              icon: Icons.local_dining,
              title: 'Daily Protein Calculator',
              description: 'Calculate your daily protein needs based on weight',
              onTap: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(
                    builder: (context) => const ProteinCalculatorScreen(),
                  ),
                );
              },
            ),
            HomeFeatureTile(
              icon: Icons.monitor_weight,
              title: 'BMI Calculator',
              description: 'Calculate your BMI and check your weight category',
              onTap: () {
                // Navigate to BMI Calculator screen
              },
            ),
            HomeFeatureTile(
              icon: Icons.directions_run,
              title: 'Cardio Exercise',
              description: 'Running, cycling, and jogging workouts',
              onTap: () {
                // Navigate to Cardio Exercise screen
              },
            ),
            HomeFeatureTile(
              icon: Icons.lightbulb,
              title: 'Fun Facts',
              description: 'Interesting facts about gym, fitness, and health',
              onTap: () {
                // Navigate to Fun Facts screen
              },
            ),
            HomeFeatureTile(
              icon: Icons.person,
              title: 'User Profile',
              description: 'View and edit your personal information',
              onTap: () {
                // Navigate to User Profile screen
              },
            ),
          ],
        ),
      ),
    );
  }
}

class HomeFeatureTile extends StatelessWidget {
  final IconData icon;
  final String title;
  final String description;
  final VoidCallback onTap;

  const HomeFeatureTile({
    super.key,
    required this.icon,
    required this.title,
    required this.description,
    required this.onTap,
  });

  @override
  Widget build(BuildContext context) {
    return Card(
      elevation: 4,
      margin: const EdgeInsets.symmetric(vertical: 10),
      child: ListTile(
        leading: Icon(icon, size: 40, color: Colors.blueAccent),
        title: Text(
          title,
          style: const TextStyle(fontWeight: FontWeight.bold),
        ),
        subtitle: Text(description),
        onTap: onTap,
      ),
    );
  }
}
