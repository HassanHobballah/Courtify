import 'package:court/Services/user_service.dart';
import 'package:court/appointment_card.dart';
import 'package:court/config.dart';
import 'package:court/court_card.dart';
import 'package:court/userprofile.dart';
import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';

class HomePage extends StatefulWidget {
  const HomePage({Key? key}) : super(key: key);

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  final UserService _userService = UserService();
  late Future<Map<String, dynamic>?> _futureUserData;
  Map<String, dynamic> user = {};
  Map<String, dynamic> coach = {};
  void initState() {
    super.initState();
    _futureUserData = _userService.getUserData();
  }

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
            padding: const EdgeInsets.symmetric(horizontal: 15, vertical: 15),
            child: SafeArea(
              child: FutureBuilder<Map<String, dynamic>?>(
                future: _futureUserData,
                builder: (context, snapshot) {
                  if (snapshot.connectionState == ConnectionState.waiting) {
                    return const Center(child: CircularProgressIndicator());
                  } else if (snapshot.hasError) {
                    return Center(child: Text('Error: ${snapshot.error}'));
                  } else if (!snapshot.hasData || snapshot.data == null) {
                    return const Center(child: Text('No user data available'));
                  }

                  var userData = snapshot.data!;
                  var userName =
                      '${userData['firstName'] ?? ''} ${userData['lastName'] ?? ''}';

                  return SingleChildScrollView(
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.start,
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: <Widget>[
                        Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: <Widget>[
                            Text(
                              userName,
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
                                    builder: (context) =>
                                        UserProfilePage(userData: userData),
                                  ),
                                );
                              },
                              child: const CircleAvatar(
                                radius: 30,
                                backgroundImage: AssetImage(
                                    'assets/profile.png'), // Ensure this image asset exists
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
                            children:
                                List<Widget>.generate(courts.length, (index) {
                              return Card(
                                margin: const EdgeInsets.only(right: 20),
                                color: Config.primaryColor,
                                child: Padding(
                                  padding: const EdgeInsets.symmetric(
                                      horizontal: 15, vertical: 10),
                                  child: Row(
                                    mainAxisAlignment:
                                        MainAxisAlignment.spaceAround,
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
                  );
                },
              ),
            )));
  }
}
