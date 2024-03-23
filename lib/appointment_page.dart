import 'package:flutter/material.dart';

// Assuming Config and other imports are correctly set up

enum FilterStatus { upcoming, complete, cancel }

class AppointmentPage extends StatefulWidget {
  const AppointmentPage({Key? key}) : super(key: key);

  @override
  _AppointmentPageState createState() => _AppointmentPageState();
}

class _AppointmentPageState extends State<AppointmentPage> {
  FilterStatus _status = FilterStatus.upcoming; // Initial status
  Alignment _alignment = Alignment.centerLeft;

  // Dummy data for the schedule
  final List<Map<String, dynamic>> _schedules = [
    {
      "court_name": "SportCenter",
      "category": "Badminton",
      "status": FilterStatus.upcoming,
    },
    {
      "court_name": "Classico",
      "category": "Football",
      "status": FilterStatus.complete,
    },
    {
      "court_name": "Briguskod",
      "category": "Tennis",
      "status": FilterStatus.complete,
    },
    {
      "court_name": "jjscjii",
      "category": "Basketball",
      "status": FilterStatus.cancel,
    },
  ];

  List<Map<String, dynamic>> get filteredSchedules =>
      _schedules.where((schedule) => schedule['status'] == _status).toList();

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        body: Padding(
          padding: const EdgeInsets.all(20.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.stretch,
            children: <Widget>[
              const Text(
                'Reservations Schedule',
                textAlign: TextAlign.center,
                style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
              ),
              SizedBox(height: 20),
              _buildFilterTabs(),
              SizedBox(height: 20),
              _buildScheduleList(),
            ],
          ),
        ),
      ),
    );
  }

  Widget _buildFilterTabs() {
    return Stack(
      children: <Widget>[
        Container(
          height: 40,
          decoration: BoxDecoration(
            color: Colors.grey[300],
            borderRadius: BorderRadius.circular(20),
          ),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: FilterStatus.values.map((status) => _buildTab(status)).toList(),
          ),
        ),
        AnimatedAlign(
          alignment: _alignment,
          duration: const Duration(milliseconds: 250),
          curve: Curves.easeInOut,
          child: Container(
            width: MediaQuery.of(context).size.width / 3,
            height: 40,
            decoration: BoxDecoration(
              color: Colors.blue, // Use your Config.primaryColor here
              borderRadius: BorderRadius.circular(20),
            ),
            child: Center(
              child: Text(
                _status.name.toUpperCase(),
                style: const TextStyle(color: Colors.white, fontWeight: FontWeight.bold),
              ),
            ),
          ),
        ),
      ],
    );
  }

  Widget _buildTab(FilterStatus status) {
    return Expanded(
      child: GestureDetector(
        onTap: () => _onTabTapped(status),
        child: Container(
          height: 40,
          child: Center(
            child: Text(
              status.name.toUpperCase(),
              style: TextStyle(
                color: Colors.black54,
                fontWeight: FontWeight.bold,
              ),
            ),
          ),
        ),
      ),
    );
  }

  void _onTabTapped(FilterStatus status) {
    setState(() {
      _status = status;
      switch (status) {
        case FilterStatus.upcoming:
          _alignment = Alignment.centerLeft;
          break;
        case FilterStatus.complete:
          _alignment = Alignment.center;
          break;
        case FilterStatus.cancel:
          _alignment = Alignment.centerRight;
          break;
      }
    });
  }

  Widget _buildScheduleList() {
    return Expanded(
      child: ListView.builder(
        itemCount: filteredSchedules.length,
        itemBuilder: (context, index) {
          var schedule = filteredSchedules[index];
          return _buildScheduleCard(schedule);
        },
      ),
    );
  }

  Widget _buildScheduleCard(Map<String, dynamic> schedule) {
    return Card(
      elevation: 4,
      margin: const EdgeInsets.only(bottom: 20),
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(15)),
      child: Padding(
        padding: const EdgeInsets.all(15),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Row(
              children: [
                CircleAvatar(
                  // Use appropriate placeholder and loading mechanism for images
                  backgroundColor: Colors.grey[200],
                  child: Icon(Icons.person, color: Colors.grey[700]),
                ),
                const SizedBox(width: 10),
                Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(schedule['court_name'], style: TextStyle(fontWeight: FontWeight.bold)),
                    Text(schedule['category'], style: TextStyle(color: Colors.grey[600])),
                  ],
                ),
              ],
            ),
            SizedBox(height: 15),
            ScheduleCard(), // Assuming ScheduleCard implementation is correct
          ],
        ),
      ),
    );
  }
}

class ScheduleCard extends StatelessWidget {
  const ScheduleCard({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.all(10),
      decoration: BoxDecoration(
        color: Colors.grey[200],
        borderRadius: BorderRadius.circular(10),
      ),
      child: Row(
        children: <Widget>[
          Icon(Icons.calendar_today, color: Colors.blue),
          SizedBox(width: 5),
          Text('Monday, 11/28/2022', style: TextStyle(color: Colors.blue)),
          SizedBox(width: 10),
          Icon(Icons.access_time, color: Colors.blue),
          SizedBox(width: 5),
          Text('2:00 PM', style: TextStyle(color: Colors.blue)),
        ],
      ),
    );
  }
}
