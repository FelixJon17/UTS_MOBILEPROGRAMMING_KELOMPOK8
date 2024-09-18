import 'package:flutter/material.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Fitness App',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: FunFactsScreen(),
    );
  }
}

class FunFactsScreen extends StatelessWidget {
  final List<String> funFacts = [
    '1. Always warm up before starting your workout to prevent injuries.',
    '2. Maintain proper form during exercises to target the right muscles.',
    '3. Stay hydrated before, during, and after your workouts.',
    '4. Incorporate rest days in your routine to allow muscle recovery.',
    '5. Gradually increase weights to avoid straining your muscles and joints.'
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Fun Facts'),
      ),
      body: ListView.builder(
        itemCount: funFacts.length,
        itemBuilder: (context, index) {
          return Card(
            margin: EdgeInsets.all(10),
            child: Padding(
              padding: EdgeInsets.all(15),
              child: Text(
                funFacts[index],
                style: TextStyle(fontSize: 18),
              ),
            ),
          );
        },
      ),
    );
  }
}
