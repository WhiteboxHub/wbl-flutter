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
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'The App Accelerator',
      theme: ThemeStyle.lightTheme,
      initialRoute: SplashScreen.routeName,
      routes: PageRoutes().routes(),
    );
  }
}

// import 'package:flutter/material.dart';
// import './widgets/calendar_widget.dart';
// import './components/google_calendar_api.dart';

// void main() {
//   runApp(MyApp());
// }

// class MyApp extends StatelessWidget {
//   @override
//   Widget build(BuildContext context) {
//     return MaterialApp(
//       title: 'Flutter Calendar App',
//       theme: ThemeData(
//         primarySwatch: Colors.blue,
//       ),
//       home: MyHomePage(),
//     );
//   }
// }

// class MyHomePage extends StatefulWidget {
//   @override
//   _MyHomePageState createState() => _MyHomePageState();
// }

// class _MyHomePageState extends State<MyHomePage> {
//   final GoogleCalendarApi _googleCalendarApi = GoogleCalendarApi();

//   @override
//   void initState() {
//     super.initState();
//     _googleCalendarApi.authenticate();
//   }

//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//       appBar: AppBar(
//         title: Text('Flutter Calendar App'),
//       ),
//       body: Center(
//         child: CalendarWidget(),
//       ),
//     );
//   }
// }
