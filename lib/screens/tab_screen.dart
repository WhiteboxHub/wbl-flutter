// import 'package:flutter/material.dart';
// import 'package:wbl_mobile_app/screens/featured_screen.dart';
// import 'package:wbl_mobile_app/theme/colors.dart';
// import 'package:wbl_mobile_app/screens/login_screen.dart';
// import 'package:wbl_mobile_app/screens/register_screen.dart';
// import 'package:wbl_mobile_app/screens/schedule_resources_screen.dart';

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
//     Text('Index 1: Business'),
//     Text('Index 2: School'),
//     Text('Index 3: Settings'),
//   ];

//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//       appBar: AppBar(
//         // title: Text('Home'),
//         // leading: Builder(
//         //   builder: (context) => IconButton(
//         //     icon: Icon(Icons.menu),
//         //     onPressed: () {
//         //       Scaffold.of(context).openDrawer();
//          title: Text('Home'),
//         leading: Builder(
//           builder: (context) => Container(
//             color: Colors.blue, // Background color of the icon
//             child: IconButton(
//               icon: Icon(Icons.menu, color: Colors.white), // Icon color
//               onPressed: () {
//                 Scaffold.of(context).openDrawer();
//            },
//             ),
//           ),
//         ),
//       ),
//       drawer: Drawer(
//         child: ListView(
//           children: <Widget>[
//             ListTile(
//               leading: Icon(Icons.login),
//               title: Text('Login'),
//               onTap: () {
//                 Navigator.pushNamed(context, LoginScreen.routeName);
//               },
//             ),
//             ListTile(
//               leading: Icon(Icons.app_registration),
//               title: Text('Register'),
//               onTap: () {
//                 Navigator.pushNamed(context, RegisterScreen.routeName);
//               },
//             ),
//             ListTile(
//               leading: Icon(Icons.calendar_today),
//               title: Text('Schedule Resources'),
//               onTap: () {
//                 Navigator.pushNamed(context, ScheduleResourcesScreen.routeName);
//               },
//             ),
//           ],
//         ),
//       ),
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
//         items: const [
//           BottomNavigationBarItem(
//             activeIcon: Icon(Icons.home),
//             icon: Icon(Icons.home_outlined),
//             label: 'Home',
//           ),
//           BottomNavigationBarItem(
//             activeIcon: Icon(Icons.leaderboard),
//             icon: Icon(Icons.leaderboard_outlined),
//             label: 'My Learning',
//           ),
//           BottomNavigationBarItem(
//             activeIcon: Icon(Icons.list),
//             icon: Icon(Icons.list_outlined),
//             label: 'My Wishlist',
//           ),
//           BottomNavigationBarItem(
//             activeIcon: Icon(Icons.settings),
//             icon: Icon(Icons.settings_outlined),
//             label: 'Settings',
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

import 'package:flutter/material.dart';
import 'package:wbl_mobile_app/screens/featured_screen.dart';
import 'package:wbl_mobile_app/screens/schedule_resources_screen.dart';
import 'package:wbl_mobile_app/theme/colors.dart';
import 'package:wbl_mobile_app/screens/my_learning_screen.dart';
import 'package:wbl_mobile_app/screens/my_wishlist_screen.dart';
import 'package:wbl_mobile_app/screens/settings_screen.dart';

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
    // Text('Index 1: Business'),
    // Text('Index 2: School'),
    // Text('Index 3: Settings'),
    MyLearningScreen(),
    ScheduleResourcesScreen(), // My Learning screen
    SettingsScreen(), // Settings screen
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        // Reduced height
        toolbarHeight: kToolbarHeight, // Default app bar height
        automaticallyImplyLeading: false, // Disable default leading icon
        flexibleSpace: Container(
          padding: const EdgeInsets.only(
              top: 30, left: 10, right: 20), // Reduced top padding
          decoration: BoxDecoration(
            // borderRadius: const BorderRadius.only(
            //   bottomLeft: Radius.circular(25),
            //   bottomRight: Radius.circular(25),
            // ),
            color: kPurpleColor,
          ),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            crossAxisAlignment: CrossAxisAlignment
                .center, // Ensures items align on the same line
            children: [
              // No drawer icon, left side empty
              Container(width: 48), // Placeholder width for consistency
              // "Whitebox-Learning" title
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
              // Notifications icon
              Icon(
                Icons.notifications,
                color: kGreyWhiteColor,
              ),
            ],
          ),
        ),
      ),
      // Removed Drawer completely
      resizeToAvoidBottomInset: true,
      body: Center(
        child: tabScreensOptions.elementAt(selectedIndex),
      ),
      bottomNavigationBar: BottomNavigationBar(
        type: BottomNavigationBarType.fixed,
        selectedItemColor: kPurpleColor,
        backgroundColor: kGreyWhiteColor,
        unselectedItemColor: kPrimarySwatchColor,
        elevation: 0,
        showSelectedLabels: false, // Hide selected labels
        showUnselectedLabels: false, // Hide unselected labels
        items: const [
          BottomNavigationBarItem(
            activeIcon: Icon(Icons.home),
            icon: Icon(Icons.home_outlined),
            label: 'Home',
          ),
          BottomNavigationBarItem(
            activeIcon: Icon(Icons.library_books),
            icon: Icon(Icons.library_books_outlined),
            label: 'My Learning',
          ),
          BottomNavigationBarItem(
            activeIcon: Icon(Icons.info),
            icon: Icon(Icons.info_outline),
            label: 'My Wishlist',
          ),
          BottomNavigationBarItem(
            activeIcon: Icon(Icons.account_circle),
            icon: Icon(Icons.account_circle_outlined),
            label: 'Settings',
          ),
        ],
        currentIndex: selectedIndex,
        onTap: (int index) {
          setState(() {
            selectedIndex = index;
          });
        },
      ),
    );
  }
}
