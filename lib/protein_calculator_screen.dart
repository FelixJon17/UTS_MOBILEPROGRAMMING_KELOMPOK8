import 'package:flutter/material.dart';

class ProteinCalculatorScreen extends StatefulWidget {
  const ProteinCalculatorScreen({super.key});

  @override
  _ProteinCalculatorScreenState createState() =>
      _ProteinCalculatorScreenState();
}

class _ProteinCalculatorScreenState extends State<ProteinCalculatorScreen> {
  final _weightController = TextEditingController();
  final _proteinPerKgController = TextEditingController();
  String _result = '';

  void _calculateProtein() {
    final double weight = double.tryParse(_weightController.text) ?? 0;
    final double proteinPerKg =
        double.tryParse(_proteinPerKgController.text) ?? 0;

    if (weight <= 0 || proteinPerKg <= 0) {
      setState(() {
        _result = 'Please enter valid numbers';
      });
      return;
    }

    final double totalProtein = weight * proteinPerKg;

    setState(() {
      _result =
          'Total Daily Protein Requirement: ${totalProtein.toStringAsFixed(2)} grams';
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Daily Protein Calculator'),
        backgroundColor: Colors.blueAccent,
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: [
            TextField(
              controller: _weightController,
              keyboardType: TextInputType.number,
              decoration: const InputDecoration(
                labelText: 'Weight (kg)',
                border: OutlineInputBorder(),
              ),
            ),
            const SizedBox(height: 16.0),
            TextField(
              controller: _proteinPerKgController,
              keyboardType: TextInputType.number,
              decoration: const InputDecoration(
                labelText: 'Protein per kg (g)',
                border: OutlineInputBorder(),
              ),
            ),
            const SizedBox(height: 16.0),
            ElevatedButton(
              onPressed: _calculateProtein,
              child: const Text('Calculate'),
            ),
            const SizedBox(height: 16.0),
            Text(
              _result,
              style: const TextStyle(fontSize: 18),
              textAlign: TextAlign.center,
            ),
          ],
        ),
      ),
    );
  }
}
