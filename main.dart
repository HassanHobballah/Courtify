// // import 'package:english_words/english_words.dart';
// import 'package:flutter/material.dart';
// import 'package:english_words/english_words.dart';
// import 'package:flutter/widgets.dart';
// import 'package:provider/provider.dart';

// void main() {
//   runApp(MyApp());
// }

// class MyApp extends StatelessWidget {
//   const MyApp({Key? key}) : super(key: key);

//   @override
//   Widget build(BuildContext context) {
//     return ChangeNotifierProvider(
//       create: (context) => MyAppState(),
//       child: MaterialApp(
//         title: 'courtify',
//         // theme: ThemeData(
//         //   // primarySwatch: Colors.indigo.shade900,
//         //   primaryColor: Color.fromARGB(255, 3, 2, 67), // Set the primary color directly
//         //   visualDensity: VisualDensity.adaptivePlatformDensity,
//         // ),
//         theme: ThemeData.dark().copyWith(
//           appBarTheme: AppBarTheme(
//             backgroundColor: Color.fromARGB(255, 213, 217, 238),
//           ),
//           //   scaffoldBackgroundColor: Color.fromARGB(255, 206, 208, 217),
//           // ),
//           //       home: MyHomePage(),
//         ),
//       ),
//     );
//   }
// }

// class MyAppState extends ChangeNotifier {
//   var current = WordPair.random();

//   void getNext() {
//     current = WordPair.random();
//     notifyListeners();
//   }

//   var bookings = <WordPair>[];

//   void toggleBooking() {
//     if (bookings.contains(current)) {
//       bookings.remove(current);
//     } else {
//       bookings.add(current);
//     }
//     notifyListeners();
//   }
// }

// class MyHomePage extends StatefulWidget {
//   @override
//   State<MyHomePage> createState() => _MyHomePageState();
// }

// class _MyHomePageState extends State<MyHomePage> {
//   var selectedIndex = 0;

//   @override
//   Widget build(BuildContext context) {
//     Widget page;
//     switch (selectedIndex) {
//       case 0:
//         page = GeneratorPage();
//       case 1:
//         page = BookingsPage();
//       default:
//         throw UnimplementedError('no widget for $selectedIndex');
//     }

//     return LayoutBuilder(builder: (context, constraints) {
//       return Scaffold(
//         body: Row(
//           children: [
            
//             SafeArea(
//               child: NavigationRail(
//                 extended: constraints.maxWidth >= 600,
//                 destinations: [
//                   NavigationRailDestination(
//                     icon: Icon(Icons.home),
//                     label: Text('Home'),
//                   ),
//                   NavigationRailDestination(
//                     icon: Icon(Icons.event_available),
//                     label: Text('Bookings'),
//                   ),
//                 ],
//                 selectedIndex: selectedIndex,
//                 onDestinationSelected: (value) {
//                   setState(() {
//                     selectedIndex = value;
//                   });
//                 },
//               ),
//             ),
//             Expanded(
//               child: Container(
//                 decoration: BoxDecoration(
//                   gradient: LinearGradient(
//                     begin: Alignment.topRight,
//                     end: Alignment.bottomLeft,
//                     stops: [0.1, 0.5, 0.7, 0.9],
//                     colors: [
//                       Color.fromARGB(255, 92, 60, 232),
//                       Color.fromARGB(255, 23, 20, 152),
//                       Color.fromARGB(255, 19, 22, 117),
//                       Color.fromARGB(255, 12, 1, 56),
//                     ],
//                   ),
//                 ),
//                 child: page,
//               ),
//             ),
//           ],
//         ),
//       );
//     });
//   }
// }

// class GeneratorPage extends StatelessWidget {
//   @override
//   Widget build(BuildContext context) {
//     var appState = context.watch<MyAppState>();
//     var pair = appState.current;
//     bool isBooked = appState.bookings.contains(pair);

//     return Center(
//       child: Column(
//         mainAxisAlignment: MainAxisAlignment.center,
//         children: [
//           BigCard(pair: pair),
//           SizedBox(height: 10),
//           Row(
//             mainAxisSize: MainAxisSize.min,
//             children: [
//               ElevatedButton.icon(
//                 onPressed: () {
//                   appState.toggleBooking();
//                 },
//                 icon: Icon(isBooked ? Icons.event_available : Icons.event_busy),
//                 label: Text(isBooked ? 'Booked' : 'Book Now'),
//               ),
//               SizedBox(width: 10),
//               ElevatedButton(
//                 onPressed: () {
//                   appState.getNext();
//                 },
//                 child: Text('Next'),
//               ),
//             ],
//           ),
//         ],
//       ),
//     );
//   }
// }

// class BigCard extends StatelessWidget {
//   const BigCard({
//     super.key,
//     required this.pair,
//   });

//   final WordPair pair;

//   @override
//   Widget build(BuildContext context) {
//     final theme = Theme.of(context);
//     final style = theme.textTheme.displayMedium!.copyWith(
//       color: theme.colorScheme.onPrimary,
//     );

//     return Card(
//       color: theme.colorScheme.primary,
//       child: Padding(
//         padding: const EdgeInsets.all(20),
//         child: Text(
//           pair.asLowerCase,
//           style: style,
//           semanticsLabel: "${pair.first} ${pair.second}",
//         ),
//       ),
//     );
//   }
// }

// class BookingsPage extends StatelessWidget {
//   @override
//   Widget build(BuildContext context) {
//     var appState = context.watch<MyAppState>();

//     if (appState.bookings.isEmpty) {
//       return Center(
//         child: Text('No bookings yet.'),
//       );
//     }

//     return ListView(
//       children: [
//         Padding(
//           padding: const EdgeInsets.all(20),
//           child: Text('Your Bookings:'),
//         ),
//         for (var pair in appState.bookings)
//           ListTile(
//             leading: Icon(Icons.event_available),
//             title: Text(pair.asLowerCase),
//           ),
//       ],
//     );
//   }
// } 
// import 'package:english_words/english_words.dart';
import 'package:flutter/material.dart';
import 'package:english_words/english_words.dart';
import 'package:flutter/widgets.dart';
import 'package:provider/provider.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return ChangeNotifierProvider(
      create: (context) => MyAppState(),
      child: MaterialApp(
        title: 'courtify',
        
        theme: ThemeData.dark().copyWith(
          appBarTheme: AppBarTheme(
            backgroundColor: Color.fromARGB(255, 213, 217, 238),
           titleTextStyle: TextStyle(
             color: Colors.black, // Set the font color to black
                fontSize: 20.0, // Adjust the font size as needed
                fontWeight: FontWeight.bold
           )
          ),
            scaffoldBackgroundColor: Color.fromARGB(255, 206, 208, 217),
          ),
                home: MyHomePage(),
        ),
      );
  }
}

class MyAppState extends ChangeNotifier {
  var current = WordPair.random();

  void getNext() {
    current = WordPair.random();
    notifyListeners();
  }

  var bookings = <WordPair>[];

  void toggleBooking() {
    if (bookings.contains(current)) {
      bookings.remove(current);
    } else {
      bookings.add(current);
    }
    notifyListeners();
  }
}

class MyHomePage extends StatefulWidget {
  @override
  State<MyHomePage> createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  var selectedIndex = 0;

  @override
  Widget build(BuildContext context) {
    Widget page;
   
     switch (selectedIndex) {
       case 0:
         page = GeneratorPage();
         break;  // Add this line
       case 1:
         page = BookingsPage();
         break;  // Add this line
       default:
         throw UnimplementedError('no widget for $selectedIndex');
     }
    return LayoutBuilder(builder: (context, constraints) {
      return Scaffold(
         appBar: AppBar(
          title: Consumer<MyAppState>(
            builder: (context, appState, child) {
              // Display the current court in the app bar
              return Text("Dashboard");
            },
          ),
          backgroundColor: Colors.white,
          
        ),
        body: Row(
          children: [
            
            SafeArea(
              child: NavigationRail(
                extended: constraints.maxWidth >= 600,
                destinations: [
                  NavigationRailDestination(
                    icon: Icon(Icons.home),
                    label: Text('Home'),
                  ),
                  NavigationRailDestination(
                    icon: Icon(Icons.event_available),
                    label: Text('Bookings'),
                  ),
                ],
                selectedIndex: selectedIndex,
                onDestinationSelected: (value) {
                  setState(() {
                    selectedIndex = value;
                  });
                },
              ),
            ),
            Expanded(
              child: Container(
                decoration: BoxDecoration(
                  gradient: LinearGradient(
                    begin: Alignment.topRight,
                    end: Alignment.bottomLeft,
                    stops: [0.1, 0.5, 0.7, 0.9],
                    colors: [
                      Color.fromARGB(255, 92, 60, 232),
                      Color.fromARGB(255, 23, 20, 152),
                      Color.fromARGB(255, 19, 22, 117),
                      Color.fromARGB(255, 12, 1, 56),
                    ],
                  ),
                ),
                child: _buildPage(selectedIndex),
              ),
            ),
          ],
        ),
      );
    });
  }
} 
Widget _buildPage(int index) {
    switch (index) {
      case 0:
        return GeneratorPage();
      case 1:
        return BookingsPage();
      default:
        throw UnimplementedError('no widget for $index');
    }
  }


class GeneratorPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    var appState = context.watch<MyAppState>();
    // var pair = appState.current;
    var pair = WordPair("BasketBall", " ");
    bool isBooked = appState.bookings.contains(pair);

    return Center(
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          BigCard(pair: pair),
          SizedBox(height: 10),
          Row(
            mainAxisSize: MainAxisSize.min,
            children: [
              ElevatedButton.icon(
                onPressed: () {
                  appState.toggleBooking();
                },
                icon: Icon(isBooked ? Icons.event_available : Icons.event_busy),
                label: Text(isBooked ? 'Booked' : 'Book Now'),
              ),
              SizedBox(width: 10),
              ElevatedButton(
                onPressed: () {
                  appState.getNext();
                },
                child: Text('Next'),
              ),
            ],
          ),
        ],
      ),
    );
  }
}

class BigCard extends StatelessWidget {
  const BigCard({
    super.key,
    required this.pair,
  });

  final WordPair pair;

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);
    final style = theme.textTheme.displayMedium!.copyWith(
      color: theme.colorScheme.onPrimary,
    );

    return Card(
      color: theme.colorScheme.primary,
      child: Padding(
        padding: const EdgeInsets.all(20),
        child: Text(
          pair.asLowerCase,
          style: style,
          semanticsLabel: "${pair.first} ${pair.second}",
        ),
      ),
    );
  }
}

class BookingsPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    var appState = context.watch<MyAppState>();

    if (appState.bookings.isEmpty) {
      return Center(
        child: Text('No bookings yet.'),
      );
    }

    return ListView(
      children: [
        Padding(
          padding: const EdgeInsets.all(20),
          child: Text('Your Bookings:'),
        ),
        for (var pair in appState.bookings)
          ListTile(
            leading: Icon(Icons.event_available),
            title: Text(pair.asLowerCase),
          ),
      ],
    );
  }
}  
// class CourtPage extends StatelessWidget {
//   final String sportType; // 'basketball', 'football', etc.

//   CourtPage({Key? key, required this.sportType}) : super(key: key);

//   @override
//   Widget build(BuildContext context) {
//     // Logic to display court options, booking status, and buttons based on sportType
//     // ...
//     return Scaffold(
//       appBar: AppBar(
//         title: Text('Book $sportType Court'),
//       ),
//       body: Column(
//         children: [
//           // Text box showing current court
//           // Booking status indicator
//           // 'Next', 'Book', and conditionally 'Unbook' buttons
//         ],
//       ),
//     );
//   }
// }