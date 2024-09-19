
import 'package:flutter/material.dart';
// import '../components/custom_app_bar.dart'; // Import the custom app bar
import '../components/custom_carousel.dart'; // Import the custom carousel
import '../components/course_section.dart'; // Import the course section
import '../components/enroll_button.dart'; // Import the enroll button

class HomeScreen extends StatelessWidget {
  static const routeName = '/home-screen';
  const HomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return const Scaffold(
      // appBar: CustomAppBar(),
      body: SingleChildScrollView(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            // CustomCarousel(),
            Padding(
              padding: EdgeInsets.all(20.0),
              child: Text(
                'A comprehensive learning ecosystem tailored for developers, machine learning enthusiasts, and data engineers.',
                textAlign: TextAlign.center,
                style: TextStyle(
                  // color: Colors.black,
                  fontSize: 20,
                ),
              ),
            ),
            CourseSection(
              title: "Machine Learning",
              imagePath: "assets/courses/machine_learning.jpeg", // Replace with actual image path
            ),
            EnrollButton(),
            CourseSection(
              title: "Fullstack Development",
              imagePath: "assets/courses/fullstack_development.jpeg", // Replace with actual image path
            ),
            EnrollButton(),
            CourseSection(
              title: "Data Engineering",
              imagePath: "assets/courses/data_engineer.jpg", // Replace with actual image path
            ),
            EnrollButton(),
          ],
        ),
      ),
    );
  }
}

// import 'package:flutter/material.dart';
// import '../utils/menu_utils.dart'; // Import the menu_utils.dart file

// class HomeScreen extends StatelessWidget {
//   @override
//   Widget build(BuildContext context) {
//     final menuItems = generateMenuItems(context);

//     return Scaffold(
//       appBar: AppBar(title: Text('Home Screen')),
//       body: ListView.builder(
//         itemCount: menuItems.length,
//         itemBuilder: (context, index) {
//           final item = menuItems[index];
//           return ListTile(
//             leading: Icon(item.icon),
//             title: Text(item.title),
//             onTap: () {
//               // Handle tap events here
//               if (item.type == MenuItemType.home) {
//                 // Navigate to Home
//               } else if (item.type == MenuItemType.profile) {
//                 // Navigate to Profile
//               } else if (item.type == MenuItemType.settings) {
//                 // Navigate to Settings
//               }
//             },
//           );
//         },
//       ),
//     );
//   }
// }
