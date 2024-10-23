// // wbl_flutter_new\lib\main.dart
// import 'package:flutter/material.dart';
// import 'package:shared_preferences/shared_preferences.dart';
// import 'package:wbl_mobile_app/routes/routes.dart';
// import 'package:wbl_mobile_app/screens/splash_screen.dart';
// import 'package:wbl_mobile_app/screens/tab_screen.dart';
// import 'package:wbl_mobile_app/screens/login_screen.dart';
// import 'package:wbl_mobile_app/theme/theme_style.dart';
// import 'package:provider/provider.dart';
// import 'providers/user_provider.dart';
// import 'screens/your_profile_screen.dart'; // Added for routing

// void main() async {
//   WidgetsFlutterBinding.ensureInitialized();

//   runApp(
//     ChangeNotifierProvider(
//       create: (context) => UserProvider()..autoLogin(), // AutoLogin
//       child: const MyApp(),
//     ),
//   );
// }

// class MyApp extends StatelessWidget {
//   const MyApp({super.key});

//   Future<Widget> _checkAutoLogin() async {
//     final prefs = await SharedPreferences.getInstance();
//     final accessToken = prefs.getString('access_token');    
//     print('-----------------Access Token: $accessToken'); // Print the access token
// print('----------------------------------------------------------------');
//     if (accessToken != null && accessToken.isNotEmpty) {
//       return const TabScreen();
//     } else {
//       return const LoginScreen();
//     }
//   }

//   @override
//   Widget build(BuildContext context) {
//     return FutureBuilder<Widget>(
//       future: _checkAutoLogin(),
//       builder: (BuildContext context, AsyncSnapshot<Widget> snapshot) {
//         if (snapshot.connectionState == ConnectionState.waiting) {
//                    print('--------------Waiting for authentication check...'); // Print while waiting

//           return const MaterialApp(
//             home: SplashScreen(),
//             debugShowCheckedModeBanner: false,
//           );
//         } else {
//                     print('----------------Authentication check complete.'); // Print when done

//           return MaterialApp(
//             debugShowCheckedModeBanner: false,
//             title: 'Whitebox-Learning',
//             theme: ThemeStyle.lightTheme,
//             home: snapshot.data,
//             routes: {
//               ...PageRoutes().routes(),
//               YourProfileScreen.routeName: (context) => const YourProfileScreen(),
//             },
//           );
//         }
//       },
//     );
//   }
// }



// // wbl_flutter_new/lib/main.dart
// import 'package:flutter/material.dart';
// import 'package:shared_preferences/shared_preferences.dart';
// import 'screens/welcome_screen.dart';
// import 'screens/login_screen.dart';
// import 'screens/tab_screen.dart';
// import 'services/local_storage_service.dart';

// void main() {
//   runApp(const MyApp());
// }

// class MyApp extends StatelessWidget {
//   const MyApp({super.key});

//   @override
//   Widget build(BuildContext context) {
//     return MaterialApp(
//       title: 'White Box Learning',
//       theme: ThemeData(
//         primarySwatch: Colors.blue,
//       ),
//       home: FutureBuilder(
//         future: determineStartScreen(),
//         builder: (context, AsyncSnapshot<Widget> snapshot) {
//           if (snapshot.connectionState == ConnectionState.waiting) {
//             return const CircularProgressIndicator();
//           } else {
//             return snapshot.data ?? const WelcomeScreen();
//           }
//         },
//       ),
//     );
//   }

//   Future<Widget> determineStartScreen() async {
//     bool firstTimeUser = await LocalStorageService.isFirstTimeUser();
//     bool loggedIn = await LocalStorageService.isLoggedIn();

//     if (firstTimeUser) {
//       return const WelcomeScreen();
//     } else if (loggedIn) {
//       return const TabScreen();
//     } else {
//       return const LoginScreen();
//     }
//   }
// }




import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'screens/welcome_screen.dart'; // Import WelcomeScreen
import 'screens/splash_screen.dart';
import 'screens/tab_screen.dart';
import 'providers/user_provider.dart';
import 'routes/routes.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return ChangeNotifierProvider(
      create: (ctx) => UserProvider(),
      child: MaterialApp(
        title: 'White Box Learning',
        theme: ThemeData(
          primarySwatch: Colors.blue,
        ),
        initialRoute: SplashScreen.routeName,
        routes: PageRoutes().routes(),
         debugShowCheckedModeBanner: false,
      ),
    );
  }
}

// New Function to check user login status
Future<void> checkLoginStatus(BuildContext context) async {

  SharedPreferences prefs = await SharedPreferences.getInstance();
  bool isLoggedIn = prefs.getBool('isLoggedIn') ?? false;
  if (isLoggedIn) {
    Navigator.of(context).pushReplacementNamed(TabScreen.routeName);
  } else {
    Navigator.of(context).pushReplacementNamed(WelcomeScreen.routeName);
  }
}

// Call this function in the SplashScreen

