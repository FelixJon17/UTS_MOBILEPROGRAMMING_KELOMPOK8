import 'package:flutter/material.dart';
import 'dart:ui'; // Needed for blur effect
import 'package:flutter/services.dart'; // Required for status bar control

class LoginScreen extends StatelessWidget {
  const LoginScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final TextEditingController _emailController = TextEditingController();
    final TextEditingController _passwordController = TextEditingController();

    return AnnotatedRegion<SystemUiOverlayStyle>(
      value: SystemUiOverlayStyle.light, // Ensure white status bar icons
      child: Scaffold(
        extendBodyBehindAppBar: true, // Ensure AppBar is over the background
        appBar: AppBar(
          backgroundColor: Colors.transparent, // Transparent app bar
          elevation: 0, // No shadow
          leading: IconButton(
            icon: const Icon(Icons.arrow_back, color: Colors.white),
            onPressed: () {
              Navigator.pop(context); // Back to home screen
            },
          ),
        ),
        body: Stack(
          children: [
            Container(
              decoration: const BoxDecoration(
                image: DecorationImage(
                  image: AssetImage('assets/img/bg/bglogfitness.png'),
                  fit: BoxFit.cover, // No blur on image itself
                ),
              ),
            ),
            // Adding a slight blur effect
            BackdropFilter(
              filter: ImageFilter.blur(sigmaX: 1, sigmaY: 1), // Slight blur
              child: Container(
                color: Colors.black.withOpacity(0.3), // Slight dark overlay
              ),
            ),
            Padding(
              padding: const EdgeInsets.all(16.0),
              child: Center(
                child: SingleChildScrollView(
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      const Text(
                        'Mobile Fitness',
                        style: TextStyle(
                          fontSize: 36.0,
                          fontWeight: FontWeight.bold,
                          color: Colors.white,
                        ),
                      ),
                      const SizedBox(height: 40),
                      Container(
                        decoration: BoxDecoration(
                          color: Colors.black.withOpacity(0.5),
                          borderRadius: BorderRadius.circular(12),
                        ),
                        child: TextField(
                          controller: _emailController,
                          decoration: const InputDecoration(
                            labelText: 'Email',
                            labelStyle: TextStyle(color: Colors.white),
                            border: InputBorder.none,
                            contentPadding: EdgeInsets.symmetric(
                                horizontal: 20, vertical: 16),
                          ),
                          keyboardType: TextInputType.emailAddress,
                          style: const TextStyle(color: Colors.white),
                        ),
                      ),
                      const SizedBox(height: 20),
                      Container(
                        decoration: BoxDecoration(
                          color: Colors.black.withOpacity(0.5),
                          borderRadius: BorderRadius.circular(12),
                        ),
                        child: TextField(
                          controller: _passwordController,
                          decoration: const InputDecoration(
                            labelText: 'Password',
                            labelStyle: TextStyle(color: Colors.white),
                            border: InputBorder.none,
                            contentPadding: EdgeInsets.symmetric(
                                horizontal: 20, vertical: 16),
                          ),
                          obscureText: true,
                          style: const TextStyle(color: Colors.white),
                        ),
                      ),
                      const SizedBox(height: 30),
                      ElevatedButton(
                        onPressed: () {
                          // Handle login logic
                          String email = _emailController.text;
                          String password = _passwordController.text;
                          print('Email: $email, Password: $password');
                        },
                        child: const Text('Login'),
                        style: ElevatedButton.styleFrom(
                          backgroundColor:
                              Colors.lightBlue, // Button background color
                          foregroundColor: Colors.white, // Button text color
                          padding: const EdgeInsets.symmetric(
                              horizontal: 50, vertical: 15),
                          textStyle: const TextStyle(fontSize: 18),
                          shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(12),
                          ),
                        ),
                      ),
                      const SizedBox(height: 20),
                      TextButton(
                        onPressed: () {
                          // Navigate to registration or password recovery screen
                        },
                        child: const Text(
                          'Don\'t have an account? Sign up',
                          style: TextStyle(color: Colors.white),
                        ),
                      ),
                    ],
                  ),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
