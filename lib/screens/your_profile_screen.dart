import 'package:flutter/material.dart';
import 'package:wbl_mobile_app/screens/change_password_screen.dart'; // Import the Change Password screen
import 'package:wbl_mobile_app/screens/edit_profile_screen.dart'; // Import the Edit Profile screen
import 'package:provider/provider.dart';
import '../providers/user_provider.dart'; // Ensure this is the correct path to your UserProvider
import './login_screen.dart'; // Ensure this is the correct path to your LoginScreen


class YourProfileScreen extends StatelessWidget {
  static const routeName = '/your-profile';

  const YourProfileScreen({super.key});

  @override
  Widget build(BuildContext context) {
     final userProvider = Provider.of<UserProvider>(context);
    final user = userProvider.user;
    return Scaffold(          
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            CircleAvatar(
              radius: 50,   
                backgroundImage: AssetImage('assets/images/profile_icon.jpg'),
            ),
            SizedBox(height: 10),
            Text(
              user != null ? 'Welcome ${user.username}' : 'Welcome User',
            // Text(
            //   'Welcome User',  // You can replace with dynamic user data
              style: TextStyle(fontSize: 22, fontWeight: FontWeight.bold),
            ),
            SizedBox(height: 20),

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

            // Log Out
            ListTile(
              leading: Icon(Icons.logout),
              title: Text('Log Out'),
              trailing: Icon(Icons.arrow_forward_ios),
              onTap: () {
                // Implementing the logout functionality
                userProvider.logout();
                Navigator.pushReplacementNamed(context, LoginScreen.routeName);
              },
            ),
          ],
        ),
      ),    
    );
  }
}