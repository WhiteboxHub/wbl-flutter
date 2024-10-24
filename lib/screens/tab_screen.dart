// import 'package:flutter/material.dart';
// import 'package:wbl_mobile_app/screens/featured_screen.dart';
// import 'package:wbl_mobile_app/screens/schedule_resources_screen.dart';
// import 'package:wbl_mobile_app/theme/colors.dart';
// import 'package:wbl_mobile_app/screens/my_learning_screen.dart';
// import 'package:wbl_mobile_app/screens/your_profile_screen.dart';

// class TabScreen extends StatefulWidget {
//   static const routeName = '/tab-screen';
//   const TabScreen({super.key});

//   @override
//   State<TabScreen> createState() => _TabScreenState();
// }

// class _TabScreenState extends State<TabScreen> {
//   int selectedIndex = 0;
//   static const List<Widget> tabScreensOptions = <Widget>[
//     FeaturedScreen(),
//     MyLearningScreen(),
//     ScheduleResourcesScreen(),
//     YourProfileScreen(),
//   ];

//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//       appBar: AppBar(
//         toolbarHeight: kToolbarHeight,
//         automaticallyImplyLeading: false,
//         flexibleSpace: Container(
//           padding: const EdgeInsets.only(top: 30, left: 10, right: 20),
//           decoration: const BoxDecoration(
//             color: Color.fromARGB(255, 99, 29, 230)
//           ),
//           child: Row(
//             mainAxisAlignment: MainAxisAlignment.spaceBetween,
//             crossAxisAlignment: CrossAxisAlignment.center,
//             children: [
//               Container(width: 48),
//               Expanded(
//                 child: Text(
//                   "Whitebox-Learning",
//                   style: Theme.of(context).textTheme.titleLarge!.copyWith(
//                         color: kGreyWhiteColor,
//                         fontWeight: FontWeight.bold,
//                       ),
//                   overflow: TextOverflow.ellipsis,
//                   maxLines: 1,
//                 ),
//               ),
//               Icon(
//                 Icons.notifications,
//                 color: kGreyWhiteColor,
//               ),
//             ],
//           ),
//         ),
//       ),
//       resizeToAvoidBottomInset: true,
//       body: Center(
//         child: tabScreensOptions.elementAt(selectedIndex),
//       ),
//       bottomNavigationBar: BottomNavigationBar(
//         type: BottomNavigationBarType.fixed,
//         currentIndex: selectedIndex,
//         onTap: (int index) {
//           setState(() {
//             selectedIndex = index;
//           });
//         },
//         elevation: 15, // Add elevation to bottom nav bar
//         backgroundColor: Colors.transparent, // Make background transparent
//         selectedItemColor: kPurpleColor,
//         unselectedItemColor: kPrimarySwatchColor,
//         items: [
//           _buildBottomNavigationBarItem(
//               icon: Icons.home_outlined,
//               activeIcon: Icons.home,
//               isActive: selectedIndex == 0),
//           _buildBottomNavigationBarItem(
//               icon: Icons.school_outlined,
//               activeIcon: Icons.school,
//               isActive: selectedIndex == 1),
//           _buildBottomNavigationBarItem(
//               icon: Icons.schedule_outlined,
//               activeIcon: Icons.schedule,
//               isActive: selectedIndex == 2),
//           _buildBottomNavigationBarItem(
//               icon: Icons.account_circle_outlined,
//               activeIcon: Icons.account_circle,
//               isActive: selectedIndex == 3),
//         ],
//         // Reduce the height of the BottomNavigationBar by adjusting the icon size and padding
//         iconSize: 24, // Set icon size
//         selectedFontSize: 0, // Disable label text
//         unselectedFontSize: 0, // Disable label text
//       ),
//     );
//   }

//   BottomNavigationBarItem _buildBottomNavigationBarItem({
//     required IconData icon,
//     required IconData activeIcon,
//     required bool isActive,
//   }) {
//     return BottomNavigationBarItem(
//       icon: _buildCustomIcon(icon, isActive),
//       activeIcon: _buildCustomIcon(activeIcon, isActive),
//       label: '', // Set empty label
//     );
//   }

//   Widget _buildCustomIcon(IconData icon, bool isActive) {
//     return Container(
//       decoration: BoxDecoration(
//         shape: BoxShape.circle,
//         color: isActive ? kPurpleColor : Colors.transparent,
//         boxShadow: isActive
//             ? [
//                 BoxShadow(
//                   color: Colors.black26,
//                   blurRadius: 6.0,
//                   spreadRadius: 1.0,
//                   offset: Offset(0, 3),
//                 ),
//               ]
//             : null,
//       ),
//       padding: const EdgeInsets.symmetric(vertical: 20.0, horizontal: 8.0), // Adjusted padding
//       child: Icon(
//         icon,
//         color: isActive ? Colors.white : kPrimarySwatchColor,
//         size: isActive ? 30 : 24, // Enlarge icon when active
//       ),
//     );
//   }
// }

import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart'; // Import Google Fonts
import 'package:wbl_mobile_app/screens/featured_screen.dart';
import 'package:wbl_mobile_app/screens/schedule_resources_screen.dart';
import 'package:wbl_mobile_app/theme/colors.dart';
import 'package:wbl_mobile_app/screens/my_learning_screen.dart';
import 'package:wbl_mobile_app/screens/your_profile_screen.dart';

class TabScreen extends StatefulWidget {
  static const routeName = '/tab-screen';
  const TabScreen({super.key});

  @override
  State<TabScreen> createState() => _TabScreenState();
}

class _TabScreenState extends State<TabScreen> {
  int selectedIndex = 0;
  static const List<Widget> tabScreensOptions = <Widget>[
    FeaturedScreen(),
    MyLearningScreen(),
    ScheduleResourcesScreen(),
    YourProfileScreen(),
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        toolbarHeight: kToolbarHeight,
        automaticallyImplyLeading: false,
        flexibleSpace: Container(
          padding: const EdgeInsets.only(top: 30, left: 10, right: 20),
          decoration: const BoxDecoration(
            gradient: LinearGradient(
              colors: [
                Color.fromARGB(255, 125, 34, 223), // Gradient color start
                Color.fromARGB(255, 145, 78, 217), // Gradient color start
                Color.fromARGB(255, 194, 145, 246), // Gradient color start
                // Color.fromARGB(255, 140, 180, 248), // Gradient color end
              ],
              begin: Alignment.topLeft,
              end: Alignment.bottomRight,
            ),
          ),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              Container(width: 48),
              Expanded(
                child: Text(
                  "Whitebox-Learning",
                  style: GoogleFonts.poppins(
                    textStyle: Theme.of(context).textTheme.titleLarge!.copyWith(
                          // color: const Color.fromARGB(255, 72, 18, 249),
                          color:  Colors.white,
                          
                          fontWeight: FontWeight.bold,
                          fontSize: 25, // You can set a specific font size if needed
                        ),
                  ),
                  overflow: TextOverflow.ellipsis,
                  maxLines: 1,
                ),
              ),
              // Icon(
              //   Icons.notifications,
              //   color: kGreyWhiteColor,
              // ),
            ],
          ),
        ),
      ),
      resizeToAvoidBottomInset: true,
      body: Center(
        child: tabScreensOptions.elementAt(selectedIndex),
      ),
      bottomNavigationBar: BottomNavigationBar(
        type: BottomNavigationBarType.fixed,
        currentIndex: selectedIndex,
        onTap: (int index) {
          setState(() {
            selectedIndex = index;
          });
        },
        elevation: 15, // Add elevation to bottom nav bar
        backgroundColor: Colors.transparent, // Make background transparent
        selectedItemColor: kPurpleColor,
        unselectedItemColor: kPrimarySwatchColor,
        items: [
          _buildBottomNavigationBarItem(
              icon: Icons.home_outlined,
              activeIcon: Icons.home,
              isActive: selectedIndex == 0),
          _buildBottomNavigationBarItem(
              icon: Icons.school_outlined,
              activeIcon: Icons.school,
              isActive: selectedIndex == 1),
          _buildBottomNavigationBarItem(
              icon: Icons.schedule_outlined,
              activeIcon: Icons.schedule,
              isActive: selectedIndex == 2),
          _buildBottomNavigationBarItem(
              icon: Icons.account_circle_outlined,
              activeIcon: Icons.account_circle,
              isActive: selectedIndex == 3),
        ],
        // Reduce the height of the BottomNavigationBar by adjusting the icon size and padding
        iconSize: 24, // Set icon size
        selectedFontSize: 0, // Disable label text
        unselectedFontSize: 0, // Disable label text
      ),
    );
  }

  BottomNavigationBarItem _buildBottomNavigationBarItem({
    required IconData icon,
    required IconData activeIcon,
    required bool isActive,
  }) {
    return BottomNavigationBarItem(
      icon: _buildCustomIcon(icon, isActive),
      activeIcon: _buildCustomIcon(activeIcon, isActive),
      label: '', // Set empty label
    );
  }

  Widget _buildCustomIcon(IconData icon, bool isActive) {
    return Container(
      decoration: BoxDecoration(
        shape: BoxShape.circle,
        color: isActive ? const Color.fromARGB(255, 124, 80, 255) : Colors.transparent,
        boxShadow: isActive
            ? [
                BoxShadow(
                  color: const Color.fromARGB(255, 215, 202, 254),
                  blurRadius: 6.0,
                  spreadRadius: 1.0,
                  offset: Offset(0, 3),
                ),
              ]
            : null,
      ),
      padding: const EdgeInsets.symmetric(vertical: 20.0, horizontal: 8.0), // Adjusted padding
      child: Icon(
        icon,
        color: isActive ? Colors.white : kPrimarySwatchColor,
        size: isActive ? 30 : 24, // Enlarge icon when active
      ),
    );
  }
}
