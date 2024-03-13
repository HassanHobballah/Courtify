import 'package:flutter/material.dart';

class ProfilePage extends StatefulWidget {
  final String firstName;
  final String lastName;
  final String bio;
  final String age;
  final String phoneNumber;
  final String email;
  final Function(String, String, String, String, String, String) onUpdateProfile;

  const ProfilePage({
    Key? key,
    required this.firstName,
    required this.lastName,
    required this.bio,
    required this.age,
    required this.phoneNumber,
    required this.email,
    required this.onUpdateProfile,
  }) : super(key: key);

  @override
  _ProfilePageState createState() => _ProfilePageState();
}

class _ProfilePageState extends State<ProfilePage> {
  late TextEditingController _firstNameTextController;
  late TextEditingController _lastNameTextController;
  late TextEditingController _bioController;
  late TextEditingController _ageTextController;
  late TextEditingController _phoneNumberController;
  late TextEditingController _emailTextController;

  @override
  void initState() {
    super.initState();
    _firstNameTextController = TextEditingController(text: widget.firstName);
    _lastNameTextController = TextEditingController(text: widget.lastName);
    _bioController = TextEditingController(text: widget.bio);
    _ageTextController = TextEditingController(text: widget.age);
    _phoneNumberController = TextEditingController(text: widget.phoneNumber);
    _emailTextController = TextEditingController(text: widget.email);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Profile'),
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: SingleChildScrollView(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              TextField(
                controller: _firstNameTextController,
                decoration: const InputDecoration(labelText: 'First Name'),
              ),
              const SizedBox(height: 20),
              TextField(
                controller: _lastNameTextController,
                decoration: const InputDecoration(labelText: 'Last Name'),
              ),
              const SizedBox(height: 20),
              TextField(
                controller: _bioController,
                decoration: const InputDecoration(labelText: 'Bio'),
              ),
              const SizedBox(height: 20),
              TextField(
                controller: _ageTextController,
                decoration: const InputDecoration(labelText: 'Age'),
              ),
              const SizedBox(height: 20),
              TextField(
                controller: _phoneNumberController,
                decoration: const InputDecoration(labelText: 'Phone Number'),
              ),
              const SizedBox(height: 20),
              TextField(
                controller: _emailTextController,
                decoration: const InputDecoration(labelText: 'Email'),
              ),
              const SizedBox(height: 20),
              ElevatedButton(
                onPressed: () {
                  widget.onUpdateProfile(
                    _firstNameTextController.text,
                    _lastNameTextController.text,
                    _bioController.text,
                    _ageTextController.text,
                    _phoneNumberController.text,
                    _emailTextController.text,
                  );
                  Navigator.pop(context);
                },
                child: const Text('Update Profile'),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
