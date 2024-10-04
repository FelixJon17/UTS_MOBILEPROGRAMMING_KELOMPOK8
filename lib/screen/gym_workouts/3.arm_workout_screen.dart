import '3.arm_workout/biceps_workout.dart';
import '3.arm_workout/triceps_workout.dart';
import '3.arm_workout/forearms_workout.dart';
import '3.arm_workout/shoulder_workout_screen.dart';
import 'package:flutter/material.dart';

class ArmWorkoutScreen extends StatelessWidget {
  const ArmWorkoutScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color.fromARGB(255, 255, 255, 255),
      appBar: AppBar(
        title: const Text('Arm Workouts'),
        backgroundColor: Colors.blueAccent,
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: ListView(
          children: [
            HomeFeatureTile(
              title: 'Biceps',
              onTap: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(
                    builder: (context) => const BicepsScreen(),
                  ),
                );
              },
            ),
            HomeFeatureTile(
              title: 'Triceps',
              onTap: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(
                    builder: (context) => const TricepsScreen(),
                  ),
                );
              },
            ),
            HomeFeatureTile(
              title: 'Forearms',
              onTap: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(
                    builder: (context) => const ForearmsScreen(),
                  ),
                );
              },
            ),
            HomeFeatureTile(
              title: 'Shoulder',
              onTap: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(
                    builder: (context) => const ShoulderWorkoutsScreen(),
                  ),
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
  final String title;
  final VoidCallback onTap;

  const HomeFeatureTile({
    super.key,
    required this.title,
    required this.onTap,
  });

  @override
  Widget build(BuildContext context) {
    return Card(
      elevation: 4,
      margin: const EdgeInsets.symmetric(vertical: 10),
      color: const Color.fromARGB(255, 246, 246, 246), //warna card
      child: InkWell(
        onTap: onTap,
        child: Container(
          padding: const EdgeInsets.all(20.0), // Padding untuk seluruh konten
          height: 180, // Tinggi card
          child: Row(
            children: [
              // Gambar di sebelah kiri
              Container(
                width: 150, // Lebar gambar
                height: 150, // Tinggi gambar
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(
                      10), // Membuat sudut gambar melengkung
                ),
                child: Image.asset(
                  'assets/img/arm/arm.png', // Path gambar
                  fit: BoxFit.cover, // Agar gambar memenuhi container
                ),
              ),
              const SizedBox(width: 20), // Jarak antara gambar dan teks

              // Bagian teks di sebelah kanan
              Expanded(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Text(
                      title,
                      style: const TextStyle(
                        fontWeight: FontWeight.bold,
                        fontSize: 20, // Ukuran font lebih besar
                      ),
                    ),
                    const SizedBox(height: 10),
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
