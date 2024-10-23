// import 'dart:async';
// // import 'package:wbl_mobile_app/screens/sign_in_screen.dart';
// import 'package:wbl_mobile_app/screens/tab_screen.dart';
// import 'package:flutter/material.dart';

// class SplashScreen extends StatefulWidget {
//   const SplashScreen({super.key});
//   static const routeName = '/splash-screen';

//   @override
//   State<SplashScreen> createState() => _SplashScreenState();
// }

// class _SplashScreenState extends State<SplashScreen> {
//   @override
//   void initState() {
//     super.initState();
//     _checkUser();
//   }

//   Future<void> _checkUser() async {
//     Timer(
//       const Duration(seconds: 1),
//       () => Navigator.pushNamedAndRemoveUntil(
//         context,
//         // SignInScreen.routeName,
//         TabScreen.routeName,
//         (route) => false,
//       ),
//     );
//   }

//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//       body: Center(
//         child: Container(
//           padding: const EdgeInsets.all(16.0),
//           child: Image.asset('assets/images/logo-square.png'),

//         ),
//       ),
//     );
//   }
// }

// wbl_flutter_new\lib\screens\splash_screen.dart
import 'package:flutter/material.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';
import 'package:wbl_mobile_app/screens/login_screen.dart';
import 'package:wbl_mobile_app/screens/tab_screen.dart';
import 'package:wbl_mobile_app/screens/welcome_screen.dart';
import 'package:wbl_mobile_app/services/local_storage_service.dart';

class SplashScreen extends StatefulWidget {
  static const routeName = '/splash';

  const SplashScreen({super.key});

  @override
  State<SplashScreen> createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen> {
  @override
  void initState() {
    super.initState();
    Future.delayed(const Duration(seconds: 2), () {
      checkUserNavigation(context);
    });
  }

  Future<void> checkUserNavigation(BuildContext context) async {
    // Check if it's the first time user
    bool isFirstTime = await LocalStorageService.isFirstTimeUser();
    
    // Check if user is logged in
    bool isLoggedIn = await LocalStorageService.isLoggedIn();
    
    // Decide the navigation based on these flags
    if (isFirstTime) {
      Navigator.of(context).pushReplacementNamed(WelcomeScreen.routeName);
    } else if (isLoggedIn) {
      Navigator.of(context).pushReplacementNamed(TabScreen.routeName);
    } else {
      Navigator.of(context).pushReplacementNamed(LoginScreen.routeName);
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: SpinKitSpinningLines(
          color: const Color.fromARGB(255, 110, 45, 231),  // You can choose a color here
          size: 150.0,          // Adjust the size as needed
        ),
      ),
    );
  }
}
