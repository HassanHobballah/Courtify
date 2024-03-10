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
        theme: ThemeData.light().copyWith(
          appBarTheme: AppBarTheme(
              backgroundColor: Color.fromARGB(255, 213, 217, 238),
              titleTextStyle: TextStyle(
                  color: Colors.black, // Set the font color to black
                  fontSize: 20.0, // Adjust the font size as needed
                  fontWeight: FontWeight.bold)),
          scaffoldBackgroundColor: Color.fromARGB(255, 206, 208, 217),
        ),
        home: MyHomePage(),
      ),
    );
  }
}

class MyAppState extends ChangeNotifier {
  var _wordPairs = <WordPair>[
    WordPair("Basketball", " Court"),
    WordPair("Football", " Stadium"),
    WordPair("Tennis", " Court"),
    WordPair("Padel", " Court"),
    WordPair("VolleyBall", " Court")
    // Add more word pairs as needed
  ];

  var currentIndex = 0;

  WordPair get current => _wordPairs[currentIndex];

  void getNext() {
    currentIndex = (currentIndex + 1) % _wordPairs.length;
    notifyListeners();
  }

  var bookings = <WordPair>[];

  void toggleBooking(WordPair pair) {
    // print('Before: $bookings');
    if (bookings.contains(pair)) {
      bookings.remove(pair);
    } else {
      bookings.add(pair);
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
        break; // Add this line
      case 1:
        page = BookingsPage();
        break; // Add this line
      default:
        throw UnimplementedError('no widget for $selectedIndex');
    }
    return LayoutBuilder(builder: (context, constraints) {
      return Scaffold(
        appBar: AppBar(
          backgroundColor: Colors.white,
          title: Row(
            children: [
              Consumer<MyAppState>(
                builder: (context, appState, child) {
                  // Display the current court in the app bar
                  return Text("Dashboard");
                },
              ),
              SizedBox(
                  width:
                      16), // Add some space between the title and the search bar
              Expanded(
                child: TextField(
                  // controller: _searchController,
                  style: const TextStyle(color: Color.fromARGB(255, 6, 6, 6)),
                  cursorColor: Color.fromARGB(255, 10, 10, 10),
                  decoration: const InputDecoration(
                    hintText: 'Search...',
                    hintStyle:
                        TextStyle(color: Color.fromARGB(137, 13, 13, 13)),
                    border: InputBorder.none,
                  ),
                  onChanged: (value) {
                    // Perform search functionality here
                  },
                ),
              ),
            ],
          ),
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
                      Color.fromARGB(255, 93, 87, 123),
                      Color.fromARGB(255, 70, 69, 133),
                      Color.fromARGB(255, 28, 31, 126),
                      Color.fromARGB(255, 23, 4, 101),
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
    var pair = appState.current;

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
                  appState.toggleBooking(pair);
                },
                icon: Icon(
                  isBooked
                      ? Icons.event_available_outlined
                      : Icons.event_busy_outlined,
                  color: isBooked
                      ? Color.fromARGB(255, 2, 69, 4)
                      : const Color.fromARGB(
                          255, 91, 15, 10), // Customize the color if needed
                ),
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
        child: Text(
          'No bookings yet.',
          style: TextStyle(color: Colors.white),
        ),
      );
    }

    return ListView.builder(
      itemCount: appState.bookings.length,
      itemBuilder: (context, index) {
        var pair = appState.bookings[index];
        return ListTile(
          leading: Icon(Icons.event_available),
          title: Row(
            children: [
              Text(
                pair.asLowerCase,
                style: TextStyle(color: Colors.white),
              ),
              SizedBox(width: 50),
              ElevatedButton(
                onPressed: () {
                  // Handle unbooking action
                  appState.toggleBooking(pair);
                },
                style: ElevatedButton.styleFrom(
                    backgroundColor: Colors.white // Set button color
                    ),
                child: Text('Unbook'),
              ),
            ],
          ),
        );
      },
    );
  }
}
