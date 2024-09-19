// import 'package:wbl_mobile_app/routes/routes.dart';
// // import 'package:wbl_mobile_app/screens/splash_screen.dart';
// import 'package:wbl_mobile_app/screens/tab_screen.dart';
// // import 'package:wbl_mobile_app/screens/welcome_screen.dart';w
// import 'package:wbl_mobile_app/theme/theme_style.dart';
// import 'package:flutter/material.dart';

// void main() async {
//   WidgetsFlutterBinding.ensureInitialized();
//   runApp(const MyApp());
// }

// class MyApp extends StatelessWidget {
//   const MyApp({super.key});

//   @override
//   Widget build(BuildContext context) {
//     return 
//      MaterialApp(
//         debugShowCheckedModeBanner: false,
//         title: 'The App Accelerator',
//         theme: ThemeStyle.lightTheme,
//         initialRoute: TabScreen.routeName,
//         routes: PageRoutes().routes(),
//       );
//   }
// }

  // import 'package:flutter_educational_app_ui/routes/routes.dart';
  // import 'package:flutter_educational_app_ui/screens/splash_screen.dart';
  // import 'package:flutter_educational_app_ui/theme/theme_style.dart';
  // import 'package:flutter/material.dart';

  // void main() async {
  //   WidgetsFlutterBinding.ensureInitialized();
  //   runApp(const MyApp());
  // }

  // class MyApp extends StatelessWidget {
  //   const MyApp({super.key});

  //   @override
  //   Widget build(BuildContext context) {
  //     return 
  //     MaterialApp(
  //         debugShowCheckedModeBanner: false,
  //         title: 'Whitebox-Learning',
  //         theme: ThemeStyle.lightTheme,
  //         initialRoute: SplashScreen.routeName,
  //         routes: PageRoutes().routes(),
  //       );
  //   }
  // }



  import 'package:wbl_mobile_app/routes/routes.dart';
  import 'package:wbl_mobile_app/screens/splash_screen.dart';
  import 'package:wbl_mobile_app/theme/theme_style.dart';
  import 'package:flutter/material.dart';

  void main() async {
    WidgetsFlutterBinding.ensureInitialized();
    runApp(const MyApp());
  }

  class MyApp extends StatelessWidget {
    const MyApp({super.key});

    @override
    Widget build(BuildContext context) {
      return 
      MaterialApp(
          debugShowCheckedModeBanner: false,
          title: 'Whitebox-Learning',
          theme: ThemeStyle.lightTheme,
          initialRoute: SplashScreen.routeName,
          routes: PageRoutes().routes(),
        );
    }
  }