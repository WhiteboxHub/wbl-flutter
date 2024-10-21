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
//     // Text('Index 1: Business'),
//     // Text('Index 2: School'),
//     // Text('Index 3: Settings'),
//     MyLearningScreen(),
//     ScheduleResourcesScreen(), // My Learning screen
//     YourProfileScreen()
//   ];

//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//       appBar: AppBar(
//         // Reduced height
//         toolbarHeight: kToolbarHeight, // Default app bar height
//         automaticallyImplyLeading: false, // Disable default leading icon
//         flexibleSpace: Container(
//           padding: const EdgeInsets.only(
//               top: 30, left: 10, right: 20), // Reduced top padding
//           decoration: BoxDecoration(
//             // borderRadius: const BorderRadius.only(
//             //   bottomLeft: Radius.circular(25),
//             //   bottomRight: Radius.circular(25),
//             // ),
//             color: kPurpleColor,
//           ),
//           child: Row(
//             mainAxisAlignment: MainAxisAlignment.spaceBetween,
//             crossAxisAlignment: CrossAxisAlignment
//                 .center, // Ensures items align on the same line
//             children: [
//               // No drawer icon, left side empty
//               Container(width: 48), // Placeholder width for consistency
//               // "Whitebox-Learning" title
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
//               // Notifications icon
//               Icon(
//                 Icons.notifications,
//                 color: kGreyWhiteColor,
//               ),
//             ],
//           ),
//         ),
//       ),
//       // Removed Drawer completely
//       resizeToAvoidBottomInset: true,
//       body: Center(
//         child: tabScreensOptions.elementAt(selectedIndex),
//       ),
//       bottomNavigationBar: BottomNavigationBar(
//         type: BottomNavigationBarType.fixed,
//         selectedItemColor: kPurpleColor,
//         backgroundColor: kGreyWhiteColor,
//         unselectedItemColor: kPrimarySwatchColor,
//         elevation: 0,
//         showSelectedLabels: false, // Hide selected labels
//         showUnselectedLabels: false, // Hide unselected labels
//         items: const [
//           BottomNavigationBarItem(
//             activeIcon: Icon(Icons.home),
//             icon: Icon(Icons.home_outlined),
//             label: 'Home',
//           ),
//           BottomNavigationBarItem(
//             activeIcon: Icon(Icons.school),
//             icon: Icon(Icons.school_outlined),
//             label: 'My Learning',
//           ),
//           BottomNavigationBarItem(
//             activeIcon: Icon(Icons.schedule),
//             icon: Icon(Icons.schedule_outlined),
//             label: 'Schedule',
//           ),
//           BottomNavigationBarItem(
//             activeIcon: Icon(Icons.account_circle),
//             icon: Icon(Icons.account_circle_outlined),
//             label: 'Your Profile',
//           ),
//         ],
//         currentIndex: selectedIndex,
//         onTap: (int index) {
//           setState(() {
//             selectedIndex = index;
//           });
//         },
//       ),
//     );
//   }
// }


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
//           decoration: BoxDecoration(
//             color: kPurpleColor,
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
//       padding: const EdgeInsets.all(8.0), // Add padding to increase tap area
//       child: Icon(
//         icon,
//         color: isActive ? Colors.white : kPrimarySwatchColor,
//         size: isActive ? 30 : 24, // Enlarge icon when active
//       ),
//     );
//   }
// }


import 'package:flutter/material.dart';
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
          decoration: BoxDecoration(
            color: kPurpleColor,
          ),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              Container(width: 48),
              Expanded(
                child: Text(
                  "Whitebox-Learning",
                  style: Theme.of(context).textTheme.titleLarge!.copyWith(
                        color: kGreyWhiteColor,
                        fontWeight: FontWeight.bold,
                      ),
                  overflow: TextOverflow.ellipsis,
                  maxLines: 1,
                ),
              ),
              Icon(
                Icons.notifications,
                color: kGreyWhiteColor,
              ),
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
        color: isActive ? kPurpleColor : Colors.transparent,
        boxShadow: isActive
            ? [
                BoxShadow(
                  color: Colors.black26,
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
