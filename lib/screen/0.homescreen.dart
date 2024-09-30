import 'package:fitnessapp/screen/1.login_screen.dart';
import 'package:fitnessapp/screen/4.bmi_index_calculator.dart';
import 'package:fitnessapp/screen/7.profile_screen.dart';
import 'package:fitnessapp/screen/5.cardio_workout_screen.dart';
import 'package:flutter/material.dart';
import '3.protein_calculator_screen.dart';
import '2.gym_workouts.dart';
import '6.fun_fact_screen.dart';
import 'user_state.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Mobile Fitness Home'),
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: ListView(
          children: [
            HomeFeatureTile(
              icon: Icons.login,
              title: 'Login',
              description: UserState.isLoggedIn
                  ? 'You are already logged in'
                  : 'Login to your account with name and email',
              onTap: UserState.isLoggedIn
                  ? null //
                  : () {
                      Navigator.push(
                        context,
                        MaterialPageRoute(
                          builder: (context) => const LoginScreen(),
                        ),
                      );
                    },
              isEnabled: !UserState.isLoggedIn,
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
              icon: Icons.lightbulb,
              title: 'Fun Facts',
              description: 'Interesting facts about gym, fitness, and health',
              onTap: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(builder: (context) => FunFactsScreen()),
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
  final VoidCallback? onTap;
  final bool isEnabled;

  const HomeFeatureTile({
    super.key,
    required this.icon,
    required this.title,
    required this.description,
    this.onTap,
    this.isEnabled = true,
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
        onTap: isEnabled ? onTap : null,
        tileColor: isEnabled ? null : Colors.grey.shade300,
      ),
    );
  }
}
