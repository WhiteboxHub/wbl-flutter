// // wbl_flutter_new\lib\screens\your_profile_screen.dart
// import 'package:flutter/material.dart';
// import 'package:wbl_mobile_app/screens/change_password_screen.dart'; // Import the Change Password screen
// import 'package:wbl_mobile_app/screens/edit_profile_screen.dart'; // Import the Edit Profile screen
// import 'package:provider/provider.dart';
// import '../providers/user_provider.dart'; // Ensure this is the correct path to your UserProvider
// import './login_screen.dart'; // Ensure this is the correct path to your LoginScreen
// import './contact_us_screen.dart'; // Import the Contact Us screen
// import '../widgets/profile_picture.dart';  // Import the profile picture widget

// class YourProfileScreen extends StatelessWidget {
//   static const routeName = '/your-profile';

//   const YourProfileScreen({super.key});

//   @override
//   Widget build(BuildContext context) {
//     final userProvider = Provider.of<UserProvider>(context);
    
//     final user = userProvider.user;

//     // print('----------------------userProvider: ${userProvider}'); // Add this
//     // print('----------------------User : ${user}'); // Add this
//     // print('----------------------User in Profile Screen: ${user?.username}'); // Add this

//     return Scaffold(
//       body: Padding(
//         padding: const EdgeInsets.all(16.0),
//         child: Column(
//           crossAxisAlignment: CrossAxisAlignment.center,
//           children: [
//             ProfilePicture(
//               imagePath: user?.profilePicture,  // Use profile picture from user model
//               username: user?.username ?? 'User',  // Fallback to 'User' if username is null
//             ),
//             SizedBox(height: 10),
//             Text(
//               user != null ? 'Welcome, ${user.username}' : 'Welcome, User',
//               style: TextStyle(fontSize: 22, fontWeight: FontWeight.bold),
//             ),
//             SizedBox(height: 20),

//             // Display the selected course
//             ListTile(
//               leading: Icon(Icons.school),
//               title: Text('Current Course: ${userProvider.selectedCourse}'),
//             ),

//             // Change Course
//             ListTile(
//               leading: Icon(Icons.change_circle),
//               title: Text('Change Course'),
//               trailing: Icon(Icons.arrow_forward_ios),
//               onTap: () {
//                 // Show dialog to select course
//                 showDialog(
//                   context: context,
//                   builder: (context) {
//                     return AlertDialog(
//                       title: Text('Select Course'),
//                       content: Column(
//                         mainAxisSize: MainAxisSize.min,
//                         children: [
//                           RadioListTile<String>(
//                             title: Text('Machine Learning - ML'),
//                             value: 'ML', // Store abbreviation
//                             groupValue: userProvider.selectedCourse,
//                             onChanged: (value) {
//                               userProvider.changeCourse(value!);
//                               Navigator.of(context).pop();
//                             },
//                           ),
//                           RadioListTile<String>(
//                             title: Text('Fullstack - UI'),
//                             value: 'UI', // Store abbreviation
//                             groupValue: userProvider.selectedCourse,
//                             onChanged: (value) {
//                               userProvider.changeCourse(value!);
//                               Navigator.of(context).pop();
//                             },
//                           ),
//                           RadioListTile<String>(
//                             title: Text('Quality Engineering - QE'),
//                             value: 'QA', // Store abbreviation
//                             groupValue: userProvider.selectedCourse,
//                             onChanged: (value) {
//                               userProvider.changeCourse(value!);
//                               Navigator.of(context).pop();
//                             },
//                           ),
//                         ],
//                       ),
//                     );
//                   },
//                 );
//               },
//             ),

//             // Edit Profile
//             ListTile(
//               leading: Icon(Icons.edit),
//               title: Text('Edit Profile'),
//               trailing: Icon(Icons.arrow_forward_ios),
//               onTap: () {
//                 // Navigate to Edit Profile screen
//                 Navigator.pushNamed(context, EditProfileScreen.routeName);
//               },
//             ),

//             // Downloaded Courses
//             ListTile(
//               leading: Icon(Icons.download),
//               title: Text('Downloaded Courses'),
//               trailing: Icon(Icons.arrow_forward_ios),
//               onTap: () {
//                 // Implement Downloaded Courses navigation or logic here
//               },
//             ),

//             // Change Password
//             ListTile(
//               leading: Icon(Icons.lock),
//               title: Text('Change Password'),
//               trailing: Icon(Icons.arrow_forward_ios),
//               onTap: () {
//                 // Navigate to Change Password screen
//                 Navigator.pushNamed(context, ChangePasswordScreen.routeName);
//               },
//             ),

//             // Contact Us
//             ListTile(
//               leading: Icon(Icons.contact_mail), // Changed the icon
//               title: Text('Contact Us'),
//               trailing: Icon(Icons.arrow_forward_ios),
//               onTap: () {
//                 Navigator.pushNamed(context, ContactUsScreen.routeName);
//               },
//             ),

//             // Log Out
//             ListTile(
//               leading: Icon(Icons.logout),
//               title: Text('Log Out'),
//               trailing: Icon(Icons.arrow_forward_ios),
//               onTap: () {
//                 // Implementing the logout functionality
//                 userProvider.logout(); // Call the logout method to clear the token
//                 Navigator.pushReplacementNamed(context, LoginScreen.routeName); // Navigate to LoginScreen
//               },
//             ),
//           ],
//         ),
//       ),
//     );
//   }
// }



// // wbl_flutter_new\lib\screens\your_profile_screen.dart
// import 'package:flutter/material.dart';
// import 'package:wbl_mobile_app/screens/change_password_screen.dart'; // Import the Change Password screen
// import 'package:wbl_mobile_app/screens/edit_profile_screen.dart'; // Import the Edit Profile screen
// import 'package:provider/provider.dart';
// import '../providers/user_provider.dart'; // Ensure this is the correct path to your UserProvider
// import './login_screen.dart'; // Ensure this is the correct path to your LoginScreen
// import './contact_us_screen.dart'; // Import the Contact Us screen
// import '../widgets/profile_picture.dart';  // Import the profile picture widget

// class YourProfileScreen extends StatelessWidget {
//   static const routeName = '/your-profile';

//   const YourProfileScreen({super.key});

//   @override
//   Widget build(BuildContext context) {
//     final userProvider = Provider.of<UserProvider>(context);
//     final user = userProvider.user;

//     // Debugging prints (optional)
//     print('----------------------userProvider: ${userProvider}'); // Add this
//     print('----------------------User : ${user}'); // Add this
//     print('----------------------User in Profile Screen: ${user?.username}'); // Add this
//     print('---------------------- User : ${userProvider.user}'); // Check if the user is fetched
//     print('---------------------- Full Name : ${userProvider.user?.fullName}'); // Check if the full name is fetched
//     print('---------------------- Email : ${userProvider.user?.email}'); // Check if the email is fetched

//     return Scaffold(
//       body: Padding(
//         padding: const EdgeInsets.all(16.0),
//         child: Column(
//           crossAxisAlignment: CrossAxisAlignment.center,
//           children: [
//             ProfilePicture(
//               imagePath: user?.profilePicture,  // Use profile picture from user model
//               username: user?.username ?? 'User',  // Fallback to 'User' if username is null
//             ),
//             SizedBox(height: 10),
//             Text(
//               user != null ? 'Welcome, ${user.username}' : 'Welcome, User',
//               style: TextStyle(fontSize: 22, fontWeight: FontWeight.bold),
//             ),
//             SizedBox(height: 10),

//             // Display the user's full name (new addition)
//             if (user != null && userProvider.user?.fullName != null) 
//               Text(
//                 'Full Name: ${userProvider.user!.fullName}',  // Full name of the user
//                 style: TextStyle(fontSize: 18),
//               ),

//             SizedBox(height: 10),

//             // Display the user's email (new addition)
//             if (user != null && userProvider.user?.email != null) 
//               Text(
//                 'Email: ${userProvider.user!.email}',  // Email of the user
//                 style: TextStyle(fontSize: 18),
//               ),

//             SizedBox(height: 20),

//             // Display the selected course
//             ListTile(
//               leading: Icon(Icons.school),
//               title: Text('Current Course: ${userProvider.selectedCourse}'),
//             ),

//             // Change Course
//             ListTile(
//               leading: Icon(Icons.change_circle),
//               title: Text('Change Course'),
//               trailing: Icon(Icons.arrow_forward_ios),
//               onTap: () {
//                 // Show dialog to select course
//                 showDialog(
//                   context: context,
//                   builder: (context) {
//                     return AlertDialog(
//                       title: Text('Select Course'),
//                       content: Column(
//                         mainAxisSize: MainAxisSize.min,
//                         children: [
//                           RadioListTile<String>(
//                             title: Text('Machine Learning - ML'),
//                             value: 'ML', // Store abbreviation
//                             groupValue: userProvider.selectedCourse,
//                             onChanged: (value) {
//                               userProvider.changeCourse(value!);
//                               Navigator.of(context).pop();
//                             },
//                           ),
//                           RadioListTile<String>(
//                             title: Text('Fullstack - UI'),
//                             value: 'UI', // Store abbreviation
//                             groupValue: userProvider.selectedCourse,
//                             onChanged: (value) {
//                               userProvider.changeCourse(value!);
//                               Navigator.of(context).pop();
//                             },
//                           ),
//                           RadioListTile<String>(
//                             title: Text('Quality Engineering - QE'),
//                             value: 'QA', // Store abbreviation
//                             groupValue: userProvider.selectedCourse,
//                             onChanged: (value) {
//                               userProvider.changeCourse(value!);
//                               Navigator.of(context).pop();
//                             },
//                           ),
//                         ],
//                       ),
//                     );
//                   },
//                 );
//               },
//             ),

//             // Edit Profile
//             ListTile(
//               leading: Icon(Icons.edit),
//               title: Text('Edit Profile'),
//               trailing: Icon(Icons.arrow_forward_ios),
//               onTap: () {
//                 // Navigate to Edit Profile screen
//                 Navigator.pushNamed(context, EditProfileScreen.routeName);
//               },
//             ),

//             // Downloaded Courses
//             ListTile(
//               leading: Icon(Icons.download),
//               title: Text('Downloaded Courses'),
//               trailing: Icon(Icons.arrow_forward_ios),
//               onTap: () {
//                 // Implement Downloaded Courses navigation or logic here
//               },
//             ),

//             // Change Password
//             ListTile(
//               leading: Icon(Icons.lock),
//               title: Text('Change Password'),
//               trailing: Icon(Icons.arrow_forward_ios),
//               onTap: () {
//                 // Navigate to Change Password screen
//                 Navigator.pushNamed(context, ChangePasswordScreen.routeName);
//               },
//             ),

//             // Contact Us
//             ListTile(
//               leading: Icon(Icons.contact_mail), // Changed the icon
//               title: Text('Contact Us'),
//               trailing: Icon(Icons.arrow_forward_ios),
//               onTap: () {
//                 Navigator.pushNamed(context, ContactUsScreen.routeName);
//               },
//             ),

//             // Log Out
//             ListTile(
//               leading: Icon(Icons.logout),
//               title: Text('Log Out'),
//               trailing: Icon(Icons.arrow_forward_ios),
//               onTap: () {
//                 // Implementing the logout functionality
//                 userProvider.logout(); // Call the logout method to clear the token
//                 Navigator.pushReplacementNamed(context, LoginScreen.routeName); // Navigate to LoginScreen
//               },
//             ),
//           ],
//         ),
//       ),
//     );
//   }
// }



// wbl_flutter_new\lib\screens\your_profile_screen.dart
import 'package:flutter/material.dart';
import 'package:wbl_mobile_app/screens/change_password_screen.dart'; // Import the Change Password screen
import 'package:wbl_mobile_app/screens/edit_profile_screen.dart'; // Import the Edit Profile screen
import 'package:provider/provider.dart';
import '../providers/user_provider.dart'; // Ensure this is the correct path to your UserProvider
import './login_screen.dart'; // Ensure this is the correct path to your LoginScreen
import './contact_us_screen.dart'; // Import the Contact Us screen
import '../widgets/profile_picture.dart';  // Import the profile picture widget

class YourProfileScreen extends StatelessWidget {
  static const routeName = '/your-profile';

  const YourProfileScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final userProvider = Provider.of<UserProvider>(context);
    final user = userProvider.user;

    // Debugging prints (optional)
    print('----------------------userProvider: ${userProvider}'); // Add this
    print('----------------------User : ${user}'); // Add this
    print('----------------------User in Profile Screen: ${user?.username}'); // Add this
    print('---------------------- User : ${userProvider.user}'); // Check if the user is fetched
    print('---------------------- Full Name : ${userProvider.user?.fullName}'); // Check if the full name is fetched
    print('---------------------- Email : ${userProvider.user?.email}'); // Check if the email is fetched

    return Scaffold(
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            // ProfilePicture(
            //   imagePath: user?.profilePicture,  // Use profile picture from user model
            //   username: user?.username ?? 'User',  // Fallback to 'User' if username is null
            // ),

            ProfilePicture(
  imagePath: user?.profilePicture,  // Use profile picture from user model
  username: user?.username ?? 'User',  // Fallback to 'User' if username is null
  fullName: user?.fullName, // Pass the full name here
),
            SizedBox(height: 20),
            // Update welcome text to include full name
            Text(
              'Welcome, ${user?.fullName ?? user?.username ?? 'User'}',
              style: TextStyle(fontSize: 22, fontWeight: FontWeight.bold),
            ),
            SizedBox(height: 20),

            // // Display the user's email (new addition)
            // if (user != null && userProvider.user?.email != null) 
            //   Text(
            //     'Email: ${userProvider.user!.email}',  // Email of the user
            //     style: TextStyle(fontSize: 18),
            //   ),

            // SizedBox(height: 20),

            // Display the selected course
            ListTile(
              leading: Icon(Icons.school),
              title: Text('Current Course: ${userProvider.selectedCourse}'),
            ),

            // Change Course
            ListTile(
              leading: Icon(Icons.change_circle),
              title: Text('Change Course'),
              trailing: Icon(Icons.arrow_forward_ios),
              onTap: () {
                // Show dialog to select course
                showDialog(
                  context: context,
                  builder: (context) {
                    return AlertDialog(
                      title: Text('Select Course'),
                      content: Column(
                        mainAxisSize: MainAxisSize.min,
                        children: [
                          RadioListTile<String>(
                            title: Text('Machine Learning - ML'),
                            value: 'ML', // Store abbreviation
                            groupValue: userProvider.selectedCourse,
                            onChanged: (value) {
                              userProvider.changeCourse(value!);
                              Navigator.of(context).pop();
                            },
                          ),
                          RadioListTile<String>(
                            title: Text('Fullstack - UI'),
                            value: 'UI', // Store abbreviation
                            groupValue: userProvider.selectedCourse,
                            onChanged: (value) {
                              userProvider.changeCourse(value!);
                              Navigator.of(context).pop();
                            },
                          ),
                          RadioListTile<String>(
                            title: Text('Quality Engineering - QE'),
                            value: 'QA', // Store abbreviation
                            groupValue: userProvider.selectedCourse,
                            onChanged: (value) {
                              userProvider.changeCourse(value!);
                              Navigator.of(context).pop();
                            },
                          ),
                        ],
                      ),
                    );
                  },
                );
              },
            ),

            // Edit Profile
            ListTile(
              leading: Icon(Icons.edit),
              title: Text('Edit Profile'),
              trailing: Icon(Icons.arrow_forward_ios),
              onTap: () {
                // Navigate to Edit Profile screen
                Navigator.pushNamed(context, EditProfileScreen.routeName);
              },
            ),

            // Downloaded Courses
            ListTile(
              leading: Icon(Icons.download),
              title: Text('Downloaded Courses'),
              trailing: Icon(Icons.arrow_forward_ios),
              onTap: () {
                // Implement Downloaded Courses navigation or logic here
              },
            ),

            // Change Password
            ListTile(
              leading: Icon(Icons.lock),
              title: Text('Change Password'),
              trailing: Icon(Icons.arrow_forward_ios),
              onTap: () {
                // Navigate to Change Password screen
                Navigator.pushNamed(context, ChangePasswordScreen.routeName);
              },
            ),

            // Contact Us
            ListTile(
              leading: Icon(Icons.contact_mail), // Changed the icon
              title: Text('Contact Us'),
              trailing: Icon(Icons.arrow_forward_ios),
              onTap: () {
                Navigator.pushNamed(context, ContactUsScreen.routeName);
              },
            ),

            // Log Out
            ListTile(
              leading: Icon(Icons.logout),
              title: Text('Log Out'),
              trailing: Icon(Icons.arrow_forward_ios),
              onTap: () {
                // Implementing the logout functionality
                userProvider.logout(); // Call the logout method to clear the token
                Navigator.pushReplacementNamed(context, LoginScreen.routeName); // Navigate to LoginScreen
              },
            ),
          ],
        ),
      ),
    );
  }
}
