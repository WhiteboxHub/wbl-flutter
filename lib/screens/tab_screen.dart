// import 'package:flutter/material.dart';
// import 'package:wbl_mobile_app/screens/featured_screen.dart';
// import 'package:wbl_mobile_app/theme/colors.dart';

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
//             activeIcon: Icon(Icons.home,
            
//             ),
//             icon: Icon(Icons.home_outlined),
//             label: 'Home',
//             ),
//           BottomNavigationBarItem(
//             activeIcon: Icon(Icons.leaderboard,
//             ),
//             icon: Icon(Icons.leaderboard_outlined),
//             label: 'My Learning',
//             ),
//           BottomNavigationBarItem(
//             activeIcon: Icon(Icons.list,
//             ),
//             icon: Icon(Icons.list_outlined),
//             label: 'My Wishlist',
//             ),
//           BottomNavigationBarItem(
//             activeIcon: Icon(Icons.settings,
//             ),
//             icon: Icon(Icons.settings_outlined),
//             label: 'Settings',
//             ),
//         ],
//         currentIndex: selectedIndex,
//         onTap: (int index) {
//           setState(() {
//             selectedIndex = index;
//           });
//         },
//        ),
//     );
//   }
// }



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
//         title: Text('Home'),
//       ),
//       drawer: Drawer(
//         child: ListView(
//           children: <Widget>[
//             ListTile(
//               title: Text('Login'),
//               onTap: () {
//                 Navigator.pushNamed(context, LoginScreen.routeName);
//               },
//             ),
//             ListTile(
//               title: Text('Register'),
//               onTap: () {
//                 Navigator.pushNamed(context, RegisterScreen.routeName);
//               },
//             ),
//             ListTile(
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
import 'package:wbl_mobile_app/theme/colors.dart';
import 'package:wbl_mobile_app/screens/login_screen.dart';
import 'package:wbl_mobile_app/screens/register_screen.dart';
import 'package:wbl_mobile_app/screens/schedule_resources_screen.dart';

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
    Text('Index 2: School'),
    Text('Index 3: Settings'),
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Home'),
      ),
      drawer: Drawer(
        child: ListView(
          children: <Widget>[
            ListTile(
              leading: Icon(Icons.login),
              title: Text('Login'),
              onTap: () {
                Navigator.pushNamed(context, LoginScreen.routeName);
              },
            ),
            ListTile(
              leading: Icon(Icons.app_registration),
              title: Text('Register'),
              onTap: () {
                Navigator.pushNamed(context, RegisterScreen.routeName);
              },
            ),
            ListTile(
              leading: Icon(Icons.calendar_today),
              title: Text('Schedule Resources'),
              onTap: () {
                Navigator.pushNamed(context, ScheduleResourcesScreen.routeName);
              },
            ),
          ],
        ),
      ),
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
        items: const [
          BottomNavigationBarItem(
            activeIcon: Icon(Icons.home),
            icon: Icon(Icons.home_outlined),
            label: 'Home',
          ),
          BottomNavigationBarItem(
            activeIcon: Icon(Icons.leaderboard),
            icon: Icon(Icons.leaderboard_outlined),
            label: 'My Learning',
          ),
          BottomNavigationBarItem(
            activeIcon: Icon(Icons.list),
            icon: Icon(Icons.list_outlined),
            label: 'My Wishlist',
          ),
          BottomNavigationBarItem(
            activeIcon: Icon(Icons.settings),
            icon: Icon(Icons.settings_outlined),
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
