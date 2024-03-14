// // ignore_for_file: deprecated_member_use, prefer_const_constructors, prefer_const_literals_to_create_immutables, avoid_print, use_super_parameters, unused_import


// ignore_for_file: deprecated_member_use, prefer_const_constructors, prefer_const_literals_to_create_immutables, avoid_print, use_super_parameters, unused_import, prefer_final_fields, unused_field
// ignore_for_file: deprecated_member_use, prefer_const_constructors, prefer_const_literals_to_create_immutables, avoid_print, use_super_parameters, unused_import

import 'appointment_card.dart';
import 'config.dart';
import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'court_card.dart';
import 'userprofile.dart';


class HomePage extends StatefulWidget {
  const HomePage({Key? key}) : super(key: key);

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  Map<String, dynamic> user = {};
  Map<String, dynamic> coach = {};
  List<dynamic> favList = [];
  List<Map<String, dynamic>> courts = [
    {
      "icon": FontAwesomeIcons.home,
      "category": "General",
    },
    {
      "icon": FontAwesomeIcons.baseball,
      "category": "Baseball",
    },
    {
      "icon": FontAwesomeIcons.basketball,
    "category": "BasketBall",
    },
    {
      "icon": FontAwesomeIcons.futbol,
      "category": "FootBall",
    },
    {
      "icon": FontAwesomeIcons.volleyballBall,
      "category": "VolleyBall",
    },
  ];
 //UserProfilePage _userProfile = UserProfilePage();
  @override
  Widget build(BuildContext context) {
    Config().init(context);

    return Scaffold(
      body: Padding(
        padding: const EdgeInsets.symmetric(
          horizontal: 15,
          vertical: 15,
        ),
        child: SafeArea(
          child: SingleChildScrollView(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.start,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: <Widget>[
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: <Widget>[
                    Text(
                      'UserName',
                      style: const TextStyle(
                        fontSize: 24,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                    GestureDetector(
                      onTap: () {
                       Navigator.push(
                          context,
                          MaterialPageRoute(
                            builder: (context) => UserProfilePage(
                              title: 'Courtify',
                              initialFirstName: 'First', // from database
                              initialLastName: 'Last', // from database
                              initialBio: 'My bio',
                              initialAge: '', // get from the database
                              initialPhoneNumber: '', // Set initial phone number
                              initialEmail: 'user@example.com', // Set initial email
                            ),
                          ),);
                      },
                      child: const SizedBox(
                        child: CircleAvatar(
                          radius: 30,
                          backgroundImage: AssetImage('assets/profile.png'),
                        ),
                      ),
                    ),
                  ],
                ),
                Config.spaceMedium,
                const Text(
                  'Category',
                  style: TextStyle(
                    fontSize: 16,
                    fontWeight: FontWeight.bold,
                  ),
                ),
                Config.spaceSmall,
                SizedBox(
                  height: Config.heightSize * 0.05,
                  child: ListView(
                    scrollDirection: Axis.horizontal,
                    children: List<Widget>.generate(courts.length, (index) {
                      return Card(
                        margin: const EdgeInsets.only(right: 20),
                        color: Config.primaryColor,
                        child: Padding(
                          padding: const EdgeInsets.symmetric(
                              horizontal: 15, vertical: 10),
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.spaceAround,
                            children: <Widget>[
                              FaIcon(
                                courts[index]['icon'],
                                color: Colors.white,
                              ),
                              const SizedBox(
                                width: 20,
                              ),
                              Text(
                                courts[index]['category'],
                                style: const TextStyle(
                                  fontSize: 16,
                                  color: Colors.white,
                                ),
                              ),
                            ],
                          ),
                        ),
                      );
                    }),
                  ),
                ),
                Config.spaceSmall,
                const Text(
                  'Appointment Today',
                  style: TextStyle(
                    fontSize: 16,
                    fontWeight: FontWeight.bold,
                  ),
                ),
                Config.spaceSmall,
                AppointmentCard(),
                Config.spaceSmall,
                const Text(
                  'Top courts',
                  style: TextStyle(
                    fontSize: 16,
                    fontWeight: FontWeight.bold,
                  ),
                ),
                Config.spaceSmall,
                Column(
                  children: List.generate(10, (index) {
                    return CourtCard();
                  }),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
