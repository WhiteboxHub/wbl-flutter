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
import 'package:googleapis/calendar/v3.dart' as calendar;
import '../widgets/calendar_widget.dart';
import '../components/google_calendar_api.dart';
import 'package:wbl_mobile_app/widgets/table_widget.dart'; // Import MyTableWidget

class ScheduleResourcesScreen extends StatefulWidget {
  static const routeName = '/schedule-resources-screen';

  const ScheduleResourcesScreen({super.key});

  @override
  _ScheduleResourcesScreenState createState() =>
      _ScheduleResourcesScreenState();
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

  String selectedOption = 'Schedule'; // Default selected option

  // Custom colors for button states
  final Color selectedButtonColor = Colors.purple;
  final Color unselectedButtonColor = Colors.grey.shade300;
  final Color selectedTextColor = Colors.white;
  final Color unselectedTextColor = Colors.black;

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      top: false, // Disable the top padding
      child: Scaffold(
        body: Column(
          children: [
            Container(
              margin: const EdgeInsets.fromLTRB(
                  16.0, 18.0, 16.0, 18.0), // left, top, right, bottom
              color: Colors
                  .grey.shade200, // Set background color for the button area
              child: SingleChildScrollView(
                scrollDirection: Axis.horizontal,
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                  children: [
                    ElevatedButton.icon(
                      onPressed: () {
                        setState(() {
                          selectedOption = 'Schedule';
                        });
                      },
                      icon: const Icon(
                          Icons.calendar_month_outlined), // Icon for Schedule
                      label: Text(
                        'Schedule',
                        style: TextStyle(
                          color: selectedOption == 'Schedule'
                              ? selectedTextColor
                              : unselectedTextColor,
                        ),
                      ),
                      style: ElevatedButton.styleFrom(
                        backgroundColor: selectedOption == 'Schedule'
                            ? selectedButtonColor
                            : unselectedButtonColor,
                      ),
                    ),
                    ElevatedButton.icon(
                      onPressed: () {
                        setState(() {
                          selectedOption = 'Course Content';
                        });
                      },
                      icon: const Icon(
                          Icons.chrome_reader_mode), // Icon for Course Content
                      label: Text(
                        'Course Content',
                        style: TextStyle(
                          color: selectedOption == 'Course Content'
                              ? selectedTextColor
                              : unselectedTextColor,
                        ),
                      ),
                      style: ElevatedButton.styleFrom(
                        backgroundColor: selectedOption == 'Course Content'
                            ? selectedButtonColor
                            : unselectedButtonColor,
                      ),
                    ),
                  ],
                ),
              ),
            ),
            // Conditional rendering of CalendarWidget or MyTableWidget
            Expanded(
              child: Center(
                child: selectedOption == 'Schedule'
                    ? CalendarWidget(events: _events)
                    : MyTableWidget(), // Render MyTableWidget when Course Content is selected
              ),
            ),
          ],
        ),
      ),
    );
  }
}
