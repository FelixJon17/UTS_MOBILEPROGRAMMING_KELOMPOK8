import 'package:fitnessapp/screen/1.%20login_screen.dart';
import 'package:fitnessapp/screen/4.%20bmi_index_calculator.dart';
import 'package:fitnessapp/screen/7.%20profile_screen.dart';
import 'package:fitnessapp/screen/5.%20cardio_workout_screen.dart';
import 'package:flutter/material.dart';
import '3. protein_calculator_screen.dart';
import '2. gym_workouts.dart';
import '6. fun_fact_screen.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Mobile Fitness Home'),
        backgroundColor: const Color.fromARGB(255, 116, 122, 133),
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
                Navigator.push(
                  context,
                  MaterialPageRoute(
                    builder: (context) => const LoginScreen(),
                  ),
                );
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
                Navigator.push(
                  context,
                  MaterialPageRoute(
                    builder: (context) => const BMICalculatorScreen(),
                  ),
                );
              },
            ),
            HomeFeatureTile(
              icon: Icons.directions_run,
              title: 'Cardio Exercise',
              description: 'Running, cycling, and jogging workouts',
              onTap: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(
                    builder: (context) => const CardioExerciseScreen(),
                  ),
                );
              },
            ),
            HomeFeatureTile(
              icon: Icons.lightbulb,
              title: 'Fun Facts',
              description: 'Interesting facts about gym, fitness, and health',
              onTap: () {
                // Navigasi ke halaman Fun Facts
                Navigator.push(
                  context,
                  MaterialPageRoute(
                      builder: (context) =>
                          FunFactsScreen()), // Arahkan ke FunFactsScreen
                );
              },
            ),
            HomeFeatureTile(
              icon: Icons.person,
              title: 'User Profile',
              description: 'View and edit your personal information',
              onTap: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(
                      builder: (context) => const UserProfileScreen()),
                );
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
