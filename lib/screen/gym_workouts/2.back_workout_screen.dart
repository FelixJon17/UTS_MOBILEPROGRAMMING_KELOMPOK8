import '2.back_workout/upper_back_screen.dart';
import '2.back_workout/middle_back_screen.dart';
import '2.back_workout/lower_back_screen.dart';
import 'package:flutter/material.dart';

class BackWorkoutsScreen extends StatelessWidget {
  const BackWorkoutsScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color.fromARGB(255, 255, 255, 255),
      appBar: AppBar(
        title: const Text('Back Workouts'),
        backgroundColor: Colors.blueAccent,
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: ListView(
          children: [
            HomeFeatureTile(
              title: 'Upper Back',
              onTap: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(
                    builder: (context) => const UpperBackScreen(),
                  ),
                );
              },
            ),
            HomeFeatureTile(
              title: 'Middle Back',
              onTap: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(
                    builder: (context) => const MiddleBackScreen(),
                  ),
                );
              },
            ),
            HomeFeatureTile(
              title: 'Lower back',
              onTap: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(
                    builder: (context) => const LowerBackScreen(),
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
                width: 100, // Lebar gambar
                height: 100, // Tinggi gambar
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(
                      10), // Membuat sudut gambar melengkung
                ),
                child: Image.asset(
                  'assets/img/logo/back.png', // Path gambar
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
