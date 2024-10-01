import 'package:fitnessapp/screen/gym_workouts/1.chest_workout_screen.dart';
import 'package:fitnessapp/screen/gym_workouts/2.back_workout_screen.dart';
import 'package:flutter/material.dart';

class GymWorkoutsScreen extends StatefulWidget {
  const GymWorkoutsScreen({super.key});

  @override
  GymWorkoutsScreenState createState() => GymWorkoutsScreenState();
}

class GymWorkoutsScreenState extends State<GymWorkoutsScreen> {
  void _onWorkoutSelected(String workoutType) {
    ScaffoldMessenger.of(context).showSnackBar(
      SnackBar(
        content: Text('$workoutType workout selected!'),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('GYM Workouts'),
        backgroundColor: const Color.fromARGB(255, 116, 122, 133),
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: ListView(
          children: [
            HomeFeatureTile(
              icon: Image.asset(
                'assets/img/chest/chest.png',
                width: 60,
                height: 60,
              ),
              title: 'Chest Workouts',
              description: 'Trains upper, middle, and lower chest',
              onTap: () {
                _onWorkoutSelected('Chest');
                Navigator.push(
                  context,
                  MaterialPageRoute(
                    builder: (context) => const ChestWorkoutsScreen(),
                  ),
                );
              },
            ),
            HomeFeatureTile(
              icon: Image.asset(
                'assets/img/back/back.png',
                width: 60,
                height: 60,
              ),
              title: 'Back Workouts',
              description: 'Trains upper, middle, and lower back',
              onTap: () {
                _onWorkoutSelected('Back');
                Navigator.push(
                  context,
                  MaterialPageRoute(
                    builder: (context) => const BackWorkoutsScreen(),
                  ),
                );
              },
            ),
            HomeFeatureTile(
              icon: Image.asset(
                'assets/img/arm/arm.png',
                width: 60,
                height: 60,
              ),
              title: 'Arm Workouts',
              description: 'Trains biceps, triceps, and forearms',
              onTap: () {
                _onWorkoutSelected('Arms');
              },
            ),
            HomeFeatureTile(
              icon: Icon(Icons.fitness_center, size: 48),
              title: 'Leg Workouts',
              description: 'Trains quads, hamstrings, and calves',
              onTap: () {
                _onWorkoutSelected('Legs');
                // Navigate to leg workouts
              },
            ),
          ],
        ),
      ),
    );
  }
}

class HomeFeatureTile extends StatelessWidget {
  final Widget icon;
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
        leading: icon,
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
