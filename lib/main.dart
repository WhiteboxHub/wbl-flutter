// // ----------------------------------------below code is without login ---------------------------------------------------
// import 'package:flutter/material.dart';
// import 'package:wbl_mobile_app/routes/routes.dart';
// import 'package:wbl_mobile_app/screens/splash_screen.dart';
// import 'package:wbl_mobile_app/theme/theme_style.dart';
// import 'package:flutter_dotenv/flutter_dotenv.dart'; // Import dotenv


// void main() async {
//   WidgetsFlutterBinding.ensureInitialized();
//       // await dotenv.load();
//   runApp(const MyApp());
// }

// class MyApp extends StatelessWidget {
//   const MyApp({super.key});

//   @override
//   Widget build(BuildContext context) {
//     return MaterialApp(
//       debugShowCheckedModeBanner: false,
//       title: 'Whitebox-Learning',
//       theme: ThemeStyle.lightTheme,
//       initialRoute: SplashScreen.routeName,
//       routes: PageRoutes().routes(),
//     );
//   }
// }
// ----------------------------------------above code is without login ---------------------------------------------------


// ----------------------------------------below  code is with login ---------------------------------------------------
// import 'package:flutter/material.dart';
// import 'package:shared_preferences/shared_preferences.dart';
// import 'package:wbl_mobile_app/routes/routes.dart';
// import 'package:wbl_mobile_app/screens/splash_screen.dart';
// import 'package:wbl_mobile_app/screens/tab_screen.dart';
// import 'package:wbl_mobile_app/screens/login_screen.dart';
// import 'package:wbl_mobile_app/theme/theme_style.dart';
// import 'package:flutter_dotenv/flutter_dotenv.dart';
// import 'package:provider/provider.dart';
// import 'providers/user_provider.dart';

// void main() async {
//   WidgetsFlutterBinding.ensureInitialized();
//   // await dotenv.load(); // Load environment variables if needed

//   runApp(
//     ChangeNotifierProvider(
//       // create: (context) => UserProvider(),
//             create: (context) => UserProvider()..autoLogin(), // AutoLogin is triggered here

//       child: const MyApp(),
//     ),
//   );
// }

// class MyApp extends StatelessWidget {
//   const MyApp({super.key});

//   Future<Widget> _checkAutoLogin() async {
//     final prefs = await SharedPreferences.getInstance();
//     final accessToken = prefs.getString('access_token');

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
//           return const MaterialApp(
//             home: SplashScreen(),
//             debugShowCheckedModeBanner: false,
//           );
//         } else {
//           return MaterialApp(
//             debugShowCheckedModeBanner: false,
//             title: 'Whitebox-Learning',
//             theme: ThemeStyle.lightTheme,
//             home: snapshot.data,
//             routes: PageRoutes().routes(),
//           );
//         }
//       },
//     );
//   }
// }

// ----------------------------------------above code is without login ---------------------------------------------------


// wbl_flutter_new\lib\main.dart
import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:wbl_mobile_app/routes/routes.dart';
import 'package:wbl_mobile_app/screens/splash_screen.dart';
import 'package:wbl_mobile_app/screens/tab_screen.dart';
import 'package:wbl_mobile_app/screens/login_screen.dart';
import 'package:wbl_mobile_app/theme/theme_style.dart';
import 'package:flutter_dotenv/flutter_dotenv.dart';
import 'package:provider/provider.dart';
import 'providers/user_provider.dart';
import 'screens/your_profile_screen.dart'; // Added for routing

void main() async {
  WidgetsFlutterBinding.ensureInitialized();

  runApp(
    ChangeNotifierProvider(
      create: (context) => UserProvider()..autoLogin(), // AutoLogin
      child: const MyApp(),
    ),
  );
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  Future<Widget> _checkAutoLogin() async {
    final prefs = await SharedPreferences.getInstance();
    final accessToken = prefs.getString('access_token');    
    print('-----------------Access Token: $accessToken'); // Print the access token
print('----------------------------------------------------------------');
    if (accessToken != null && accessToken.isNotEmpty) {
      return const TabScreen();
    } else {
      return const LoginScreen();
    }
  }

  @override
  Widget build(BuildContext context) {
    return FutureBuilder<Widget>(
      future: _checkAutoLogin(),
      builder: (BuildContext context, AsyncSnapshot<Widget> snapshot) {
        if (snapshot.connectionState == ConnectionState.waiting) {
                   print('--------------Waiting for authentication check...'); // Print while waiting

          return const MaterialApp(
            home: SplashScreen(),
            debugShowCheckedModeBanner: false,
          );
        } else {
                    print('----------------Authentication check complete.'); // Print when done

          return MaterialApp(
            debugShowCheckedModeBanner: false,
            title: 'Whitebox-Learning',
            theme: ThemeStyle.lightTheme,
            home: snapshot.data,
            routes: {
              ...PageRoutes().routes(),
              YourProfileScreen.routeName: (context) => const YourProfileScreen(),
            },
          );
        }
      },
    );
  }
}
