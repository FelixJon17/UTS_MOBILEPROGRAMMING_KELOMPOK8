import 'package:flutter/material.dart';

class ProteinCalculatorScreen extends StatefulWidget {
  const ProteinCalculatorScreen({super.key});

  @override
  _ProteinCalculatorScreenState createState() =>
      _ProteinCalculatorScreenState();
}

class _ProteinCalculatorScreenState extends State<ProteinCalculatorScreen> {
  final _ageController = TextEditingController();
  final _heightFeetController = TextEditingController();
  final _heightInchesController = TextEditingController();
  final _weightController = TextEditingController();
  String _selectedGender = 'male';
  String _activityLevel = 'Light: exercise 1-3 times/week';
  String _fitnessGoal = 'Maintain Current Weight'; // Added fitness goal
  String _result = '';

  void _calculateProteinRequirement() {
    final int age = int.tryParse(_ageController.text) ?? 0;
    final int heightFeet = int.tryParse(_heightFeetController.text) ?? 0;
    final double weightPounds = double.tryParse(_weightController.text) ?? 0;

    if (age <= 0 || heightFeet <= 0 || weightPounds <= 0) {
      setState(() {
        _result = 'Please enter valid numbers';
      });
      return;
    }

    // ubah poung ke kilo
    final double weightKg = weightPounds * 0.453592;

    double proteinPerKg;
    switch (_activityLevel) {
      case 'Moderate: exercise 4-5 times/week':
        proteinPerKg = 1.3; //  level sedang
        break;
      case 'Active: daily exercise or intense exercise 6-7 times/week':
        proteinPerKg = 1.6; // level aktif
        break;
      default:
        proteinPerKg = 1.0; // level ringan
    }

    // penentuan protein berdasarkan tujuan
    if (_fitnessGoal == 'Lose Weight (Cutting)') {
      proteinPerKg += 0.2; // protein untuk cutting
    } else if (_fitnessGoal == 'Gain Weight (Bulking)') {
      proteinPerKg += 0.4; // protein untuk bulking
    }

    final double dailyProteinRequirement = weightKg * proteinPerKg;

    setState(() {
      _result =
          'Your daily protein requirement is ${dailyProteinRequirement.toStringAsFixed(2)} grams for your goal: $_fitnessGoal.';
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Daily Protein Calculator'),
        backgroundColor: Colors.blueAccent,
      ),
      body: SingleChildScrollView(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: [
            TextField(
              controller: _ageController,
              keyboardType: TextInputType.number,
              decoration: const InputDecoration(
                labelText: 'Age',
                border: OutlineInputBorder(),
              ),
            ),
            const SizedBox(height: 16.0),

            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                const Text('Gender:', style: TextStyle(fontSize: 16)),
                Row(
                  children: [
                    Row(
                      children: [
                        Radio<String>(
                          value: 'male',
                          groupValue: _selectedGender,
                          onChanged: (String? value) {
                            setState(() {
                              _selectedGender = value!;
                            });
                          },
                        ),
                        const Text('Male'),
                      ],
                    ),
                    Row(
                      children: [
                        Radio<String>(
                          value: 'female',
                          groupValue: _selectedGender,
                          onChanged: (String? value) {
                            setState(() {
                              _selectedGender = value!;
                            });
                          },
                        ),
                        const Text('Female'),
                      ],
                    ),
                  ],
                ),
              ],
            ),
            const SizedBox(height: 16.0),

            Row(
              children: [
                Flexible(
                  child: TextField(
                    controller: _heightFeetController,
                    keyboardType: TextInputType.number,
                    decoration: const InputDecoration(
                      labelText: 'Height (feet)',
                      border: OutlineInputBorder(),
                    ),
                  ),
                ),
                const SizedBox(width: 10.0),
                Flexible(
                  child: TextField(
                    controller: _heightInchesController,
                    keyboardType: TextInputType.number,
                    decoration: const InputDecoration(
                      labelText: 'Height (inches)',
                      border: OutlineInputBorder(),
                    ),
                  ),
                ),
              ],
            ),
            const SizedBox(height: 16.0),

            TextField(
              controller: _weightController,
              keyboardType: TextInputType.number,
              decoration: const InputDecoration(
                labelText: 'Weight (pounds)',
                border: OutlineInputBorder(),
              ),
            ),
            const SizedBox(height: 16.0),

            DropdownButtonFormField<String>(
              value: _activityLevel,
              decoration: const InputDecoration(
                labelText: 'Activity Level',
                border: OutlineInputBorder(),
              ),
              items: [
                'Light: exercise 1-3 times/week',
                'Moderate: exercise 4-5 times/week',
                'Active: intense exercise 6-7 times/week',
              ].map((String activity) {
                return DropdownMenuItem<String>(
                  value: activity,
                  child: Text(activity),
                );
              }).toList(),
              onChanged: (String? newValue) {
                setState(() {
                  _activityLevel = newValue!;
                });
              },
            ),
            const SizedBox(height: 16.0),

            // Dropdown for Fitness Goal
            DropdownButtonFormField<String>(
              value: _fitnessGoal,
              decoration: const InputDecoration(
                labelText: 'Fitness Goal',
                border: OutlineInputBorder(),
              ),
              items: [
                'Maintain Current Weight',
                'Lose Weight (Cutting)',
                'Gain Weight (Bulking)',
              ].map((String goal) {
                return DropdownMenuItem<String>(
                  value: goal,
                  child: Text(goal),
                );
              }).toList(),
              onChanged: (String? newValue) {
                setState(() {
                  _fitnessGoal = newValue!;
                });
              },
            ),
            const SizedBox(height: 16.0),

            Row(
              children: [
                Expanded(
                  child: ElevatedButton(
                    onPressed: _calculateProteinRequirement,
                    child: const Text('Calculate'),
                  ),
                ),
                const SizedBox(width: 10.0),
                Expanded(
                  child: ElevatedButton(
                    onPressed: () {
                      _ageController.clear();
                      _heightFeetController.clear();
                      _heightInchesController.clear();
                      _weightController.clear();
                      setState(() {
                        _result = '';
                      });
                    },
                    style: ElevatedButton.styleFrom(
                      backgroundColor: Colors.grey,
                    ),
                    child: const Text('Clear'),
                  ),
                ),
              ],
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
