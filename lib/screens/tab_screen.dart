import 'package:flutter/material.dart';
import 'package:flutter_educational_app_ui/screens/featured_screen.dart';
import 'package:flutter_educational_app_ui/theme/colors.dart';

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
    Text('Index 1: Business'),
    Text('Index 2: School'),
    Text('Index 3: Settings'),
  ];


  @override
  Widget build(BuildContext context) {
    return Scaffold(
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
        items: [
          BottomNavigationBarItem(
            activeIcon: Icon(Icons.home,
            
            ),
            icon: Icon(Icons.home_outlined),
            label: 'Home',
            ),
          BottomNavigationBarItem(
            activeIcon: Icon(Icons.leaderboard,
            ),
            icon: Icon(Icons.leaderboard_outlined),
            label: 'My Learning',
            ),
          BottomNavigationBarItem(
            activeIcon: Icon(Icons.list,
            ),
            icon: Icon(Icons.list_outlined),
            label: 'My Wishlist',
            ),
          BottomNavigationBarItem(
            activeIcon: Icon(Icons.settings,
            ),
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
