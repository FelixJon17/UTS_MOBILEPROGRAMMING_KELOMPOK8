import 'package:fitnessapp/screen/gym_workouts/1.chest_workout_screen.dart';
import 'package:fitnessapp/screen/gym_workouts/2.back_workout_screen.dart';
import 'package:fitnessapp/screen/gym_workouts/3.arm_workout_screen.dart';
import 'package:fitnessapp/screen/gym_workouts/4.leg_workout_screen.dart';
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
        backgroundColor: Colors.blueAccent,
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: ListView(
          children: [
            HomeFeatureTile(
              icon: Image.asset(
                'assets/img/logo/chest.png',
                width: 100,
                height: 100,
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
                'assets/img/logo/back.png',
                width: 100,
                height: 100,
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
                'assets/img/logo/arm.png',
                width: 100,
                height: 100,
              ),
              title: 'Arm Workouts',
              description: 'Trains biceps, triceps, forearms, and shoulder',
              onTap: () {
                _onWorkoutSelected('Arms');
                Navigator.push(
                  context,
                  MaterialPageRoute(
                    builder: (context) => const ArmWorkoutScreen(),
                  ),
                );
              },
            ),
            HomeFeatureTile(
              icon: Image.asset(
                'assets/img/logo/leg.png',
                width: 100,
                height: 100,
              ),
              title: 'Leg Workouts',
              description: 'Trains quads, hamstrings, and calves',
              onTap: () {
                _onWorkoutSelected('Leg');
                Navigator.push(
                  context,
                  MaterialPageRoute(
                    builder: (context) => const LegWorkoutScreen(),
                  ),
                ); // Navigate to leg workouts
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
      child: InkWell(
        onTap: onTap,
        child: Container(
          padding:
              const EdgeInsets.all(16.0), // Memberikan padding di dalam tile
          height: 150, // Sesuaikan ukuran tinggi tile
          child: Row(
            children: [
              SizedBox(
                width: 120, // Sesuaikan ukuran gambar/icon
                height: 120,
                child: icon,
              ),
              const SizedBox(width: 16), // Spasi antara gambar dan teks
              Expanded(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  mainAxisAlignment: MainAxisAlignment
                      .center, // Align teks di tengah secara vertikal
                  children: [
                    Text(
                      title,
                      style: const TextStyle(
                        fontWeight: FontWeight.bold,
                        fontSize: 20, // Menyesuaikan ukuran teks
                      ),
                    ),
                    const SizedBox(height: 8),
                    Text(
                      description,
                      style: const TextStyle(
                        fontSize: 16, // Sesuaikan ukuran teks deskripsi
                        color: Color.fromARGB(255, 0, 0, 0),
                      ),
                    ),
                  ],
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
