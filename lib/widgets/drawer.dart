// import 'package:flutter/material.dart';
// import 'package:wbl_mobile_app/screens/sign_in_screen.dart';
// import 'package:wbl_mobile_app/screens/sign_up_screen.dart';


// class DrawerWidget extends StatelessWidget {
//   const DrawerWidget({super.key});

//   @override
//   Widget build(BuildContext context) {
//     return Drawer(
//       child: ListView(
//         padding: EdgeInsets.zero,
//         children: <Widget>[
//           DrawerHeader(
//             decoration: BoxDecoration(
//               color: Colors.blue,
//             ),
//             child: Text(
//               'Navigation',
//               style: TextStyle(
//                 color: Colors.white,
//                 fontSize: 24,
//               ),
//             ),
//           ),
//           ListTile(
//             leading: Icon(Icons.login),
//             title: Text('Login'),
//             onTap: () {
//               Navigator.pushNamed(context, SignInScreen.routeName);
//             },
//           ),
//           ListTile(
//             leading: Icon(Icons.person_add),
//             title: Text('Register'),
//             onTap: () {
//               Navigator.pushNamed(context, SignUpScreen.routeName);
//             },
//           ),
//           ListTile(
//             leading: Icon(Icons.schedule),
//             title: Text('Schedule'),
//             onTap: () {
//               Navigator.pushNamed(context, ScheduleScreen.routeName);
//             },
//           ),
//           ListTile(
//             leading: Icon(Icons.library_books),
//             title: Text('Resources'),
//             onTap: () {
//               Navigator.pushNamed(context, ResourcesScreen.routeName);
//             },
//           ),
//         ],
//       ),
//     );
//   }
// }


// // import 'package:flutter/material.dart';
// // import 'package:wbl_mobile_app/screens/sign_in_screen.dart';
// // import 'package:wbl_mobile_app/screens/sign_up_screen.dart';
// // import 'package:wbl_mobile_app/screens/schedule_screen.dart';
// // import 'package:wbl_mobile_app/screens/resources_screen.dart';

// // class DrawerWidget extends StatelessWidget {
// //   const DrawerWidget({super.key});

// //   @override
// //   Widget build(BuildContext context) {
// //     return Drawer(
// //       child: ListView(
// //         padding: EdgeInsets.zero,
// //         children: <Widget>[
// //           DrawerHeader(
// //             decoration: BoxDecoration(
// //               color: Colors.blue,
// //             ),
// //             child: Column(
// //               crossAxisAlignment: CrossAxisAlignment.start,
// //               children: <Widget>[
// //                 CircleAvatar(
// //                   backgroundColor: Colors.white,
// //                   radius: 30,
// //                   child: Icon(
// //                     Icons.person,
// //                     size: 40,
// //                     color: Colors.blue,
// //                   ),
// //                 ),
// //                 SizedBox(height: 16),
// //                 Text(
// //                   'User Name',
// //                   style: TextStyle(
// //                     color: Colors.white,
// //                     fontSize: 20,
// //                     fontWeight: FontWeight.bold,
// //                   ),
// //                 ),
// //               ],
// //             ),
// //           ),
// //           ListTile(
// //             leading: Icon(Icons.login),
// //             title: Text('Login'),
// //             onTap: () {
// //               Navigator.pushNamed(context, SignInScreen.routeName);
// //             },
// //           ),
// //           ListTile(
// //             leading: Icon(Icons.person_add),
// //             title: Text('Register'),
// //             onTap: () {
// //               Navigator.pushNamed(context, SignUpScreen.routeName);
// //             },
// //           ),
// //           ListTile(
// //             leading: Icon(Icons.schedule),
// //             title: Text('Schedule'),
// //             onTap: () {
// //               Navigator.pushNamed(context, ScheduleScreen.routeName);
// //             },
// //           ),
// //           ListTile(
// //             leading: Icon(Icons.library_books),
// //             title: Text('Resources'),
// //             onTap: () {
// //               Navigator.pushNamed(context, ResourcesScreen.routeName);
// //             },
// //           ),
// //         ],
// //       ),
// //     );
// //   }
// // }
