import 'package:flutter/material.dart';

class BMICalculatorScreen extends StatefulWidget {
  const BMICalculatorScreen({super.key});

  @override
  _BMICalculatorScreenState createState() => _BMICalculatorScreenState();
}

class _BMICalculatorScreenState extends State<BMICalculatorScreen> {
  final TextEditingController _weightController = TextEditingController();
  final TextEditingController _heightController = TextEditingController();
  String _bmiResult = '';

  void _calculateBMI() {
    final double? weight = double.tryParse(_weightController.text);
    final double? heightCm = double.tryParse(_heightController.text);

    if (weight != null && heightCm != null) {
      final double heightM = heightCm / 100; // convert cm to meters
      final double bmi = weight / (heightM * heightM);

      String result;
      if (bmi < 18.5) {
        result = 'Underweight';
      } else if (bmi >= 18.5 && bmi < 24.9) {
        result = 'Normal weight';
      } else if (bmi >= 25 && bmi < 29.9) {
        result = 'Overweight';
      } else {
        result = 'Obesity';
      }

      setState(() {
        _bmiResult = 'BMI: ${bmi.toStringAsFixed(2)} ($result)';
      });
    } else {
      setState(() {
        _bmiResult = 'Please enter valid numbers';
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('BMI Calculator'),
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
              controller: _heightController,
              keyboardType: TextInputType.number,
              decoration: const InputDecoration(
                labelText: 'Height (cm)',
                border: OutlineInputBorder(),
              ),
            ),
            const SizedBox(height: 16.0),
            ElevatedButton(
              onPressed: _calculateBMI,
              child: const Text('Calculate BMI'),
            ),
            const SizedBox(height: 16.0),
            Text(
              _bmiResult,
              textAlign: TextAlign.center,
              style: const TextStyle(
                fontSize: 18.0,
                fontWeight: FontWeight.bold,
              ),
            ),
          ],
        ),
      ),
    );
  }
}

void main() {
  runApp(const MaterialApp(
    home: BMICalculatorScreen(),
  ));
}
