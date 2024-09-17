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


import 'package:flutter/material.dart';

class ScheduleResourcesScreen extends StatelessWidget {
  static const routeName = '/schedule-resources-screen';

  const ScheduleResourcesScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Schedule Resources'),
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Icon(Icons.calendar_today, size: 100, color: Colors.orange),
            SizedBox(height: 20),
            Text('Schedule Resources Screen', style: TextStyle(fontSize: 24)),
          ],
        ),
      ),
    );
  }
}
