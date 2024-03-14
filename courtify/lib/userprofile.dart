
// // ignore_for_file: unused_field, prefer_const_constructors, library_private_types_in_public_api, use_super_parameters, use_key_in_widget_constructors


// ignore_for_file: prefer_const_literals_to_create_immutables, prefer_const_constructors, unused_field, use_super_parameters, library_private_types_in_public_api

import 'package:flutter/material.dart';
import 'config.dart';

// void main() {
//   runApp(MyApp());
// }

// class MyApp extends StatelessWidget {
//   @override
//   Widget build(BuildContext context) {
//     return MaterialApp(
//       title: 'Courtify',
//       theme: ThemeData(
//         colorScheme: ColorScheme.fromSeed(seedColor: Color.fromARGB(255, 171, 169, 180)),
//         useMaterial3: true,
//       ),
//       home: UserProfile(),
//     );
//   }
// }

class UserProfile extends StatelessWidget {
  const UserProfile({Key? key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Color.fromARGB(255, 255, 255, 255),
        title: Text('Courtify'),
      ),
      drawer: Drawer(
        child: ListView(
          padding: EdgeInsets.zero,
          children: <Widget>[
            DrawerHeader(
              decoration: const BoxDecoration(
                color: Config.primaryColor,
              ),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  const Text(
                    'User Profile',
                    style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold, color: Color.fromARGB(255, 255, 255, 255)),
                  ),
                  const SizedBox(height: 8),
                  // Add your user profile details here if needed
                ],
              ),
            ),
            ListTile(
              title: const Text('Profile'),
              onTap: () {
                Navigator.pop(context); // Close the drawer
                _openProfilePage(context);
              },
            ),
            ListTile(
              title: const Text('Book'),
              onTap: _booking,
            ),
            Divider(),
            ListTile(
              title: const Text('Log Out'),
              onTap: _logout,
            ),
          ],
        ),
      ),
      body: Center(
        child: ElevatedButton(
          onPressed: () {
            Navigator.pop(context); // Navigate back to the previous screen (homepage)
          },
          child: const Text('Return to Homepage'),
        ),
      ),
    );
  }

  void _openProfilePage(BuildContext context) {
    // Add your logic for navigating to the profile page here
    // For example:
    Navigator.push(
      context,
      MaterialPageRoute(
        builder: (context) => UserProfilePage(
          title: 'Courtify',
          initialFirstName: 'First',
          initialLastName: 'Last',
          initialBio: 'My bio',
          initialAge: '',
          initialPhoneNumber: '',
          initialEmail: 'user@example.com',
        ),
      ),
    );
  }

  void _booking() {
    // Add your logic for court booking here
  }

  void _logout() {
    // Add your logic for logging out here
  }
}

class UserProfilePage extends StatefulWidget {
  const UserProfilePage({
    Key? key,
    required this.title,
    required this.initialFirstName,
    required this.initialLastName,
    required this.initialBio,
    required this.initialAge,
    required this.initialPhoneNumber,
    required this.initialEmail,
  }) : super(key: key);

  final String title;
  final String initialFirstName;
  final String initialLastName;
  final String initialBio;
  final String initialAge;
  final String initialPhoneNumber;
  final String initialEmail;

  @override
  State<UserProfilePage> createState() => _UserProfilePageState();
}

class _UserProfilePageState extends State<UserProfilePage> {
  late String _firstName;
  late String _lastName;
  late String _bio;
  late String _age;
  late String _phoneNumber;
  late String _email;

  late TextEditingController _firstNameTextController;
  late TextEditingController _lastNameTextController;
  late TextEditingController _bioController;
  late TextEditingController _ageTextController;
  late TextEditingController _phoneNumberController;
  late TextEditingController _emailTextController;

  @override
  void initState() {
    super.initState();
    _firstName = widget.initialFirstName;
    _lastName = widget.initialLastName;
    _bio = widget.initialBio;
    _age = widget.initialAge;
    _phoneNumber = widget.initialPhoneNumber;
    _email = widget.initialEmail;

    _firstNameTextController = TextEditingController(text: _firstName);
    _lastNameTextController = TextEditingController(text: _lastName);
    _bioController = TextEditingController(text: _bio);
    _ageTextController = TextEditingController(text: _age);
    _phoneNumberController = TextEditingController(text: _phoneNumber);
    _emailTextController = TextEditingController(text: _email);
  }

  void _navigateToProfilePage() async {
    final result = await Navigator.push(
      context,
      MaterialPageRoute(
        builder: (context) => ProfilePage(
          firstName: _firstName,
          lastName: _lastName,
          bio: _bio,
          age: _age,
          phoneNumber: _phoneNumber,
          email: _email,
          onUpdateProfile: _updateProfile,
        ),
      ),
    );
    if (result != null) {
      setState(() {
        final Map<String, String> data = result;
        _firstName = data['firstName']!;
        _lastName = data['lastName']!;
        _bio = data['bio']!;
        _age = data['age']!;
        _phoneNumber = data['phoneNumber']!;
        _email = data['email']!;
      });
    }
  }

  void _updateProfile(String newFirstName, String newLastName, String newBio, String newAge, String newPhoneNumber, String newEmail) {
    setState(() {
      _firstName = newFirstName;
      _lastName = newLastName;
      _bio = newBio;
      _age = newAge;
      _phoneNumber = newPhoneNumber;
      _email = newEmail;
    });
  }

  void _booking() {
    // court booking
  }

  void _logout() {
    // go to sign up
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Color.fromARGB(255, 255, 255, 255),
        title: Text(widget.title),
      ),
      drawer: Drawer(
        child: ListView(
          padding: EdgeInsets.zero,
          children: <Widget>[
            DrawerHeader(
              decoration: const BoxDecoration(
                color: Config.primaryColor,
              ),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  const Text(
                    'User Profile',
                    style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold, color: Color.fromARGB(255, 255, 255, 255)),
                  ),
                  const SizedBox(height: 8),
                  Text(
                    'Name: $_firstName $_lastName',
                    style: const TextStyle(fontSize: 16, color: Color.fromARGB(255, 255, 255, 255)),
                  ),
                  const SizedBox(height: 8),
                  Text(
                    'Bio: $_bio',
                    style: const TextStyle(fontSize: 16, color: Color.fromARGB(255, 255, 255, 255)),
                  ),
                  const SizedBox(height: 8),
                ],
              ),
            ),
            ListTile(
              title: const Text('Profile'),
              onTap: _navigateToProfilePage,
            ),
            ListTile(
              title: const Text('Book'),
              onTap: _booking,
            ),
            Divider(),
            ListTile(
              title: const Text('Log Out'),
              onTap: _logout,
            ),
          ],
        ),
      ),
      body: Center(
        child: ElevatedButton(
          onPressed: () {
            Navigator.pop(context); // Navigate back to the previous screen (homepage)
          },
          child: const Text('Return to Homepage'),
        ),
      ),
    );
  }
}

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
                  Navigator.pop(context, {
                    'firstName': _firstNameTextController.text,
                    'lastName': _lastNameTextController.text,
                    'bio': _bioController.text,
                    'age': _ageTextController.text,
                    'phoneNumber': _phoneNumberController.text,
                    'email': _emailTextController.text,
                  });
                },
                child: const Text('Update Profile'),
              ),
              const SizedBox(height: 20),
              ElevatedButton(
                onPressed: () {
                  Navigator.pop(context); // Navigate back to the previous screen (user profile)
                },
                child: const Text('Return to User Profile'),
              ),
            ],
          ),
        ),
      ),
    );
  }
}

