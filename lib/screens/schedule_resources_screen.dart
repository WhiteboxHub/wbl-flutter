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
import 'package:http/http.dart' as http; // Import HTTP package
import 'dart:convert'; // Import for JSON decoding
import '../models/course_content.dart'; // Import the CourseContent model
import '../widgets/table_widget.dart'; // Import MyTableWidget

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
  List<CourseContent> _courseContents = []; // List to hold course content

  @override
  void initState() {
    super.initState();
    _loadEvents();
    _fetchCourseContent(); // Fetch course content when the screen initializes
  }

  Future<void> _loadEvents() async {
    List<calendar.Event> events = await _googleCalendarApi.getCalendarEvents();
    setState(() {
      _events = events;
    });
  }

  Future<void> _fetchCourseContent() async {
    final response = await http
        .get(Uri.parse('https://whitebox-learning.com/api/coursecontent'));
    print(response);
    if (response.statusCode == 200) {
      final data = json.decode(response.body);
      List<CourseContent> fetchedContents = (data['coursecontent'] as List)
          .map((item) => CourseContent.fromJson(item))
          .toList();

      setState(() {
        _courseContents = fetchedContents; // Store fetched data
      });
    } else {
      throw Exception('Failed to load course content');
    }
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
              child: SingleChildScrollView(
                scrollDirection: Axis.horizontal,
                child: Row(
                  mainAxisAlignment:
                      MainAxisAlignment.start, // Align items to the start
                  children: [
                    // Add space using SizedBox
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
                    SizedBox(width: 16), // Space between buttons
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
                    : MyTableWidget(
                        courseContents: _courseContents), // Pass fetched data
              ),
            ),
          ],
        ),
      ),
    );
  }
}
