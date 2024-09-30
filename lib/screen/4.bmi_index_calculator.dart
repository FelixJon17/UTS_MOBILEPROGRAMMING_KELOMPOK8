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

  Widget _buildBMITable() {
    return Table(
      border: TableBorder.all(color: Colors.blueGrey, width: 1),
      children: [
        _buildRow('BMI Range', 'Category', isHeader: true),
        _buildRow('< 18.5', 'Underweight'),
        _buildRow('18.5 - 24.9', 'Normal weight'),
        _buildRow('25 - 29.9', 'Overweight'),
        _buildRow('30 and above', 'Obesity'),
      ],
    );
  }

  TableRow _buildRow(String bmiRange, String category,
      {bool isHeader = false}) {
    return TableRow(
      children: [
        Padding(
          padding: const EdgeInsets.all(8.0),
          child: Text(
            bmiRange,
            style: TextStyle(
              fontWeight: isHeader ? FontWeight.bold : FontWeight.normal,
              color: isHeader ? Colors.white : Colors.blueGrey[800],
            ),
            textAlign: TextAlign.center,
          ),
        ),
        Padding(
          padding: const EdgeInsets.all(8.0),
          child: Text(
            category,
            style: TextStyle(
              fontWeight: isHeader ? FontWeight.bold : FontWeight.normal,
              color: isHeader ? Colors.white : Colors.blueGrey[800],
            ),
            textAlign: TextAlign.center,
          ),
        ),
      ],
      decoration: BoxDecoration(
        color: isHeader ? Colors.blueGrey : Colors.blueGrey[100],
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('BMI Calculator'),
        backgroundColor: Colors.blueGrey,
      ),
      body: SingleChildScrollView(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: [
            // Tabel BMI
            const Text(
              'BMI Categories',
              textAlign: TextAlign.center,
              style: TextStyle(
                fontSize: 24.0,
                fontWeight: FontWeight.bold,
                color: Colors.blueGrey,
              ),
            ),
            const SizedBox(height: 10.0),
            _buildBMITable(),
            const SizedBox(height: 30.0),

            // Input Berat Badan
            TextField(
              controller: _weightController,
              keyboardType: TextInputType.number,
              decoration: InputDecoration(
                labelText: 'Weight (kg)',
                labelStyle: const TextStyle(color: Colors.blueGrey),
                prefixIcon:
                    const Icon(Icons.line_weight, color: Colors.blueGrey),
                enabledBorder: OutlineInputBorder(
                  borderSide: const BorderSide(color: Colors.blueGrey),
                  borderRadius: BorderRadius.circular(10.0),
                ),
                focusedBorder: OutlineInputBorder(
                  borderSide:
                      const BorderSide(color: Colors.blueGrey, width: 2.0),
                  borderRadius: BorderRadius.circular(10.0),
                ),
              ),
            ),
            const SizedBox(height: 16.0),

            // Input Tinggi Badan
            TextField(
              controller: _heightController,
              keyboardType: TextInputType.number,
              decoration: InputDecoration(
                labelText: 'Height (cm)',
                labelStyle: const TextStyle(color: Colors.blueGrey),
                prefixIcon: const Icon(Icons.height, color: Colors.blueGrey),
                enabledBorder: OutlineInputBorder(
                  borderSide: const BorderSide(color: Colors.blueGrey),
                  borderRadius: BorderRadius.circular(10.0),
                ),
                focusedBorder: OutlineInputBorder(
                  borderSide:
                      const BorderSide(color: Colors.blueGrey, width: 2.0),
                  borderRadius: BorderRadius.circular(10.0),
                ),
              ),
            ),
            const SizedBox(height: 24.0),

            // Tombol Kalkulator
            ElevatedButton(
              onPressed: _calculateBMI,
              style: ElevatedButton.styleFrom(
                backgroundColor: Colors.blueGrey,
                padding: const EdgeInsets.symmetric(vertical: 14.0),
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(10.0),
                ),
              ),
              child: const Text(
                'Calculate BMI',
                style: TextStyle(
                  fontSize: 16.0,
                  fontWeight: FontWeight.bold,
                  color: Color.fromARGB(255, 48, 45, 45),
                ),
              ),
            ),
            const SizedBox(height: 24.0),

            // Hasil BMI
            Container(
              padding: const EdgeInsets.all(16.0),
              decoration: BoxDecoration(
                color: Colors.blueGrey.withOpacity(0.1),
                borderRadius: BorderRadius.circular(10.0),
                border: Border.all(color: Colors.blueGrey),
              ),
              child: Text(
                _bmiResult,
                textAlign: TextAlign.center,
                style: const TextStyle(
                  fontSize: 20.0,
                  fontWeight: FontWeight.bold,
                  color: Colors.blueGrey,
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
