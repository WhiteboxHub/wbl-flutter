// import 'package:flutter/material.dart';

// class ScheduleResourcesScreen extends StatelessWidget {
//   static const routeName = '/schedule-resources-screen';

//   const ScheduleResourcesScreen({super.key});

//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//       appBar: AppBar(
//         title: Text('Schedule Resources'),
//       ),
//       body: Center(
//         child: Text('Schedule Resources Screen'),
//       ),
//     );
//   }
// }

// import 'package:flutter/material.dart';

// class ScheduleResourcesScreen extends StatelessWidget {
//   static const routeName = '/schedule-resources-screen';

//   const ScheduleResourcesScreen({super.key});

//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//       appBar: AppBar(
//         title: const Text('Schedule Resources'),
//       ),
//       body: const Center(
//         child: Column(
//           mainAxisAlignment: MainAxisAlignment.center,
//           children: [
//             Icon(Icons.calendar_today, size: 100, color: Colors.orange),
//             SizedBox(height: 20),
//             Text('Schedule Resources Screen', style: TextStyle(fontSize: 24)),
//           ],
//         ),
//       ),
//     );
//   }
// }

import 'package:flutter/material.dart';
import 'package:googleapis/calendar/v3.dart' as calendar;  // Ensure correct import
import '../widgets/calendar_widget.dart';
import '../components/google_calendar_api.dart';

class ScheduleResourcesScreen extends StatefulWidget {
  static const routeName = '/schedule-resources-screen';

  const ScheduleResourcesScreen({super.key});

  @override
  _ScheduleResourcesScreenState createState() => _ScheduleResourcesScreenState();
}

class _ScheduleResourcesScreenState extends State<ScheduleResourcesScreen> {
  final GoogleCalendarApi _googleCalendarApi = GoogleCalendarApi();
  List<calendar.Event> _events = [];

  @override
  void initState() {
    super.initState();
    _loadEvents();
  }

  Future<void> _loadEvents() async {
    List<calendar.Event> events = await _googleCalendarApi.getCalendarEvents();
    setState(() {
      _events = events;
    });
  }

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      top: false,  // Disable the top padding
      child: Scaffold(
        appBar: AppBar(
          title: const Text('Schedule Resources'),
        ),
        body: Center(
          child: CalendarWidget(events: _events),
        ),
      ),
    );
  }
}
