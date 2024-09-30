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

  static const List<Widget> _widgetOptions = <Widget>[
    WorkoutsScreen(),
    ProteinCalculatorScreen(),
    BMICalculatorScreen(),
    UserProfileScreen(),
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
              'assets/icons/workouts_icon.png',
              width: 24, // Set the width and height to match icon size
              height: 24,
            ),
            label: 'Workouts',
          ),
          BottomNavigationBarItem(
            icon: Image.asset(
              'assets/icons/protein_icon.png',
              width: 24,
              height: 24,
            ),
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
          BottomNavigationBarItem(
            icon: Image.asset(
              'assets/icons/profile_icon.png',
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
