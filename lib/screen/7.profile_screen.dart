import 'package:flutter/material.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:cloud_firestore/cloud_firestore.dart';

class UserProfileScreen extends StatefulWidget {
  const UserProfileScreen({super.key});

  @override
  _UserProfileScreenState createState() => _UserProfileScreenState();
}

class _UserProfileScreenState extends State<UserProfileScreen> {
  String? _username;
  String? _email;
  String? _nickname; //belum digunakan
  int? _age; //belum digunakan
  double? _height; //belum digunakan
  double? _weight; //belum digunakan

  final TextEditingController _nicknameController = TextEditingController();
  final TextEditingController _ageController = TextEditingController();
  final TextEditingController _heightController = TextEditingController();
  final TextEditingController _weightController = TextEditingController();

  bool _isProfileUpdated = false;

  Future<void> _loadUserData() async {
    final User? user = FirebaseAuth.instance.currentUser;

    if (user != null) {
      final uid = user.uid;
      DocumentSnapshot userDoc =
          await FirebaseFirestore.instance.collection('/users').doc(uid).get();

      setState(() {
        _username = userDoc['username'];
        _email = userDoc['email'];
      });
    }
  }

  void _saveUserDataLocally() {
    setState(() {
      _nickname = _nicknameController.text;
      _age = int.tryParse(_ageController.text);
      _height = double.tryParse(_heightController.text);
      _weight = double.tryParse(_weightController.text);

      _isProfileUpdated = true;
    });
  }

  // Logout user
  Future<void> _logout() async {
    await FirebaseAuth.instance.signOut();
    Navigator.of(context).pop();
  }

  @override
  void initState() {
    super.initState();
    _loadUserData();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('User Profile'),
        backgroundColor: Colors.blueAccent,
        automaticallyImplyLeading: false,
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Center(
          child: SingleChildScrollView(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Card(
                  elevation: 4,
                  child: Padding(
                    padding: const EdgeInsets.all(16.0),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(
                          'Username: ${_username ?? 'Loading...'}',
                          style: const TextStyle(fontSize: 18),
                        ),
                        const SizedBox(height: 10),
                        Text(
                          'Email: ${_email ?? 'Loading...'}',
                          style: const TextStyle(fontSize: 18),
                        ),
                        const SizedBox(height: 10),
                        _buildTextField(
                          controller: _nicknameController,
                          label: 'Nickname',
                        ),
                        _buildTextField(
                          controller: _ageController,
                          label: 'Age',
                          keyboardType: TextInputType.number,
                        ),
                        _buildTextField(
                          controller: _heightController,
                          label: 'Height (cm)',
                          keyboardType: TextInputType.number,
                        ),
                        _buildTextField(
                          controller: _weightController,
                          label: 'Weight (kg)',
                          keyboardType: TextInputType.number,
                        ),
                      ],
                    ),
                  ),
                ),
                const SizedBox(height: 20),
                ElevatedButton(
                  onPressed: _saveUserDataLocally,
                  style: ElevatedButton.styleFrom(
                    backgroundColor: Colors.white,
                    foregroundColor: Colors.lightBlueAccent,
                    padding: const EdgeInsets.symmetric(
                        horizontal: 40, vertical: 15),
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(10),
                      side: const BorderSide(color: Colors.lightBlueAccent),
                    ),
                  ),
                  child: const Text(
                    'Save',
                    style: TextStyle(fontSize: 18),
                  ),
                ),
                const SizedBox(height: 10),
                ElevatedButton(
                  onPressed: _logout,
                  style: ElevatedButton.styleFrom(
                    backgroundColor: Colors.white,
                    foregroundColor: Colors.redAccent,
                    padding: const EdgeInsets.symmetric(
                        horizontal: 40, vertical: 15),
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(10),
                      side: const BorderSide(color: Colors.redAccent),
                    ),
                  ),
                  child: const Text(
                    'Logout',
                    style: TextStyle(fontSize: 18),
                  ),
                ),
                const SizedBox(height: 20),
                if (_isProfileUpdated)
                  const Text(
                    'Profile updated!',
                    style: TextStyle(
                      fontSize: 16,
                      color: Colors.green,
                    ),
                  ),
              ],
            ),
          ),
        ),
      ),
    );
  }

  Widget _buildTextField({
    required TextEditingController controller,
    required String label,
    TextInputType keyboardType = TextInputType.text,
  }) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 10),
      child: TextField(
        controller: controller,
        keyboardType: keyboardType,
        decoration: InputDecoration(
          labelText: label,
          border: OutlineInputBorder(
            borderRadius: BorderRadius.circular(10),
          ),
        ),
      ),
    );
  }
}
