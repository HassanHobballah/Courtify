import 'package:flutter/material.dart';
import 'profile_page.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Courtify',
      theme: ThemeData(
        colorScheme: ColorScheme.fromSeed(seedColor: Color.fromARGB(255, 171, 169, 180)),
        useMaterial3: true,
      ),
      home: const MyHomePage(
        title: 'Courtify',
        initialFirstName: 'First', // from database
        initialLastName: 'Last', // from database
        initialBio: 'My bio',
        initialAge: '', // get from the database
        initialPhoneNumber: '', // Set initial phone number
        initialEmail: 'user@example.com', // Set initial email
      ),
    );
  }
}

class MyHomePage extends StatefulWidget {
  const MyHomePage({
    Key? key,
    required this.title,
    required this.initialFirstName, // Add initial first name parameter
    required this.initialLastName, // Add initial last name parameter
    required this.initialBio,
    required this.initialAge,
    required this.initialPhoneNumber,
    required this.initialEmail,
  }) : super(key: key);

  final String title;
  final String initialFirstName; // Define initial first name
  final String initialLastName; // Define initial last name
  final String initialBio;
  final String initialAge;
  final String initialPhoneNumber;
  final String initialEmail;

  @override
  State<MyHomePage> createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  late String _firstName;
  late String _lastName;
  late String _bio;
  late String _age;
  late String _phoneNumber;
  late String _email;

  @override
  void initState() {
    super.initState();
    _firstName = widget.initialFirstName;
    _lastName = widget.initialLastName;
    _bio = widget.initialBio;
    _age = widget.initialAge;
    _phoneNumber = widget.initialPhoneNumber;
    _email = widget.initialEmail;
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
                color: Color.fromARGB(255, 17, 7, 57),
              ),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  const Text(
                    'User Profile',
                    style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold,color: Color.fromARGB(255, 255, 255, 255)),
                  ),
                  const SizedBox(height: 8),
                  Text(
                    'Name: $_firstName $_lastName',
                    style: const TextStyle(fontSize: 16,color: Color.fromARGB(255, 255, 255, 255)),
                  ),
                  const SizedBox(height: 8),
                  Text(
                    'Bio: $_bio',
                    style: const TextStyle(fontSize: 16,color: Color.fromARGB(255, 255, 255, 255)),
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
    );
  }
}
