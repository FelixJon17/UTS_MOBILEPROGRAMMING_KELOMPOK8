import 'package:flutter/material.dart';
import '2.workouts.dart';
import '3.protein_calculator_screen.dart';
import '4.bmi_index_calculator.dart';
import '7.profile_screen.dart';
import '6.fun_fact_screen.dart';

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
    const FunFactsScreen(),
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
          BottomNavigationBarItem(
            icon: Image.asset(
              'assets/img/muscle.png',
              width: 24,
              height: 24,
            ),
            label: 'Workouts',
          ),
          BottomNavigationBarItem(
            icon: Image.asset(
              'assets/img/protein.png',
              width: 24,
              height: 24,
            ),
            label: 'Protein',
          ),
          BottomNavigationBarItem(
            icon: Image.asset(
              'assets/img/bmi.png',
              width: 24,
              height: 24,
            ),
            label: 'BMI',
          ),
          BottomNavigationBarItem(
            icon: Image.asset(
              'assets/img/bulb.png',
              width: 24,
              height: 24,
            ),
            label: 'Fun Facts',
          ),
          BottomNavigationBarItem(
            icon: Image.asset(
              'assets/img/profile.png',
              width: 24,
              height: 24,
            ),
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
