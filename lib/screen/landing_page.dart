import 'package:flutter/material.dart';
import 'dart:ui'; // Untuk efek blur
import '0.homescreen.dart'; // Pastikan path ini benar
import '1.login_screen.dart'; // Pastikan file login_screen.dart ada
import '1.1 signup.dart'; // Pastikan file signup_screen.dart ada

class LandingPage extends StatelessWidget {
  const LandingPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Stack(
        fit: StackFit.expand,
        children: [
          // Background image dengan efek blur
          Image.asset(
            'assets/img/bg/bglogfitness.png', // Path gambar
            fit: BoxFit.cover,
          ),
          BackdropFilter(
            filter: ImageFilter.blur(sigmaX: 3.0, sigmaY: 3.0),
            child: Container(
              color: Colors.black
                  .withOpacity(0.3), // Memberikan opacity yang lebih gelap
            ),
          ),
          Positioned(
            top: 50,
            right: 20,
            child: ElevatedButton(
              onPressed: () {
                // Navigasi ke HomeScreen saat "Skip" ditekan
                Navigator.pushReplacement(
                  context,
                  MaterialPageRoute(builder: (context) => const HomeScreen()),
                );
              },
              style: ElevatedButton.styleFrom(
                backgroundColor: Colors.transparent,
                elevation: 0,
                padding:
                    const EdgeInsets.symmetric(horizontal: 20, vertical: 10),
                side: const BorderSide(color: Colors.white, width: 2),
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(20),
                ),
              ),
              child: const Text(
                'Skip',
                style: TextStyle(color: Colors.white, fontSize: 16),
              ),
            ),
          ),
          Center(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                const Text(
                  'Welcome to Mobile Fitness!',
                  style: TextStyle(
                    fontSize: 28,
                    fontWeight: FontWeight.bold,
                    color: Colors.white,
                  ),
                  textAlign: TextAlign.center,
                ),
                const SizedBox(height: 40),

                // Tombol Login yang lebih besar dan elegan
                ElevatedButton(
                  onPressed: () {
                    // Navigasi ke halaman Login
                    Navigator.push(
                      context,
                      MaterialPageRoute(
                          builder: (context) =>
                              const LoginScreen()), // Pastikan halaman LoginScreen ada
                    );
                  },
                  style: ElevatedButton.styleFrom(
                    padding: const EdgeInsets.symmetric(
                        horizontal: 100, vertical: 20),
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(30),
                    ),
                    backgroundColor: Colors.white, // Warna putih
                    elevation: 5,
                    shadowColor: Colors.grey.withOpacity(0.5),
                  ),
                  child: const Text(
                    'Login',
                    style: TextStyle(
                      fontSize: 18,
                      color: Colors.blueAccent,
                    ),
                  ),
                ),
                const SizedBox(height: 20),

                // Teks "Don't have an account? Sign up" yang bisa diklik
                GestureDetector(
                  onTap: () {
                    // Navigasi ke halaman SignUp
                    Navigator.push(
                      context,
                      MaterialPageRoute(
                          builder: (context) =>
                              const SignUpScreen()), // Pastikan halaman SignUpScreen ada
                    );
                  },
                  child: const Text(
                    "Don't have an account? Sign up",
                    style: TextStyle(
                      fontSize: 16,
                      color: Colors.white70,
                      decoration: TextDecoration.underline,
                    ),
                  ),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
