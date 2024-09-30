import 'package:flutter/material.dart';
import '2.workouts.dart';
import '3.protein_calculator_screen.dart';
import '4.bmi_index_calculator.dart';
import '7.profile_screen.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  _HomeScreenState createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  int _selectedIndex = 0;

  static List<Widget> _widgetOptions = <Widget>[
    const WorkoutsScreen(),
    const ProteinCalculatorScreen(),
    const BMICalculatorScreen(),
    const UserProfileScreen(),
  ];

  void _onItemTapped(int index) {
    setState(() {
      _selectedIndex = index;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Mobile Fitness Home'),
      ),
      body: Center(
        child: _widgetOptions.elementAt(_selectedIndex),
      ),
      bottomNavigationBar: BottomNavigationBar(
        items: <BottomNavigationBarItem>[
          const BottomNavigationBarItem(
            icon: Icon(Icons.fitness_center),
            label: 'Workouts',
          ),
          const BottomNavigationBarItem(
            icon: Icon(Icons.local_dining),
            label: 'Protein Calc',
          ),
          BottomNavigationBarItem(
            icon: Image.asset(
              'assets/img/bg/bmi.jpg',
              width: 24,
              height: 24,
            ),
            label: 'BMI',
          ),
          const BottomNavigationBarItem(
            icon: Icon(Icons.person),
            label: 'Profile',
          ),
        ],
        currentIndex: _selectedIndex,
        selectedItemColor: Colors.blueAccent,
        unselectedItemColor: Colors.grey,
        onTap: _onItemTapped,
      ),
    );
  }
}
