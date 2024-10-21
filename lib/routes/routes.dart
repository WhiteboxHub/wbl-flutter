// import 'package:wbl_mobile_app/screens/course_screen.dart';
// import 'package:wbl_mobile_app/screens/featured_screen.dart';
// import 'package:wbl_mobile_app/screens/forgot_password_screen.dart';
// import 'package:wbl_mobile_app/screens/sign_in_screen.dart';
// import 'package:wbl_mobile_app/screens/sign_up_screen.dart';
// import 'package:wbl_mobile_app/screens/splash_screen.dart';
// import 'package:wbl_mobile_app/screens/welcome_screen.dart';
// import 'package:flutter/material.dart';
// import 'package:wbl_mobile_app/screens/tab_screen.dart';
// import 'package:wbl_mobile_app/screens/my_learning_screen.dart';
// import 'package:wbl_mobile_app/screens/my_wishlist_screen.dart';
// import 'package:wbl_mobile_app/screens/settings_screen.dart';

// class PageRoutes {
//   Map<String, WidgetBuilder> routes() {
//     return {
//       SplashScreen.routeName: (context) => const SplashScreen(),
//       TabScreen.routeName: (context) => const TabScreen(),
//       SignInScreen.routeName: (context) => const SignInScreen(),
//       SignUpScreen.routeName: (context) => const SignUpScreen(),
//       WelcomeScreen.routeName: (context) => const WelcomeScreen(),
//       ForgotPasswordScreen.routeName: (context) => const ForgotPasswordScreen(),
//       FeaturedScreen.routeName: (context) => const FeaturedScreen(),
//       CourseScreen.routeName: (context) => const CourseScreen(),
//       MyLearningScreen.routeName: (context) => const MyLearningScreen(),
//       MyWishlistScreen.routeName: (context) => const MyWishlistScreen(),
//       SettingsScreen.routeName: (context) => const SettingsScreen(),
//     };
//   }
// }


// wbl_flutter_new\lib\routes\routes.dart 
import 'package:flutter/material.dart';
import 'package:wbl_mobile_app/screens/login_screen.dart';
import 'package:wbl_mobile_app/screens/register_screen.dart'; // Updated import
import 'package:wbl_mobile_app/screens/course_screen.dart';
import 'package:wbl_mobile_app/screens/featured_screen.dart';
import 'package:wbl_mobile_app/screens/forgot_password_screen.dart';
import 'package:wbl_mobile_app/screens/splash_screen.dart';
import 'package:wbl_mobile_app/screens/tab_screen.dart';
import 'package:wbl_mobile_app/screens/my_learning_screen.dart';
import 'package:wbl_mobile_app/screens/my_wishlist_screen.dart';
import 'package:wbl_mobile_app/screens/your_profile_screen.dart';
import 'package:wbl_mobile_app/screens/change_password_screen.dart';
import 'package:wbl_mobile_app/screens/edit_profile_screen.dart';
import 'package:wbl_mobile_app/screens/contact_us_screen.dart'; // Import the Contact Us screen

class PageRoutes {
  Map<String, WidgetBuilder> routes() {
    return {
      SplashScreen.routeName: (context) => const SplashScreen(),
      LoginScreen.routeName: (context) => const LoginScreen(),
      RegisterScreen.routeName: (context) => const RegisterScreen(), // Added RegisterScreen
      TabScreen.routeName: (context) => const TabScreen(),
      ForgotPasswordScreen.routeName: (context) => const ForgotPasswordScreen(),
      FeaturedScreen.routeName: (context) => const FeaturedScreen(),
      CourseScreen.routeName: (context) => const CourseScreen(),
      MyLearningScreen.routeName: (context) => const MyLearningScreen(),
      MyWishlistScreen.routeName: (context) => const MyWishlistScreen(),
      // SettingsScreen.routeName: (context) => const SettingsScreen(),
      YourProfileScreen.routeName: (ctx) => const YourProfileScreen(),
      ChangePasswordScreen.routeName: (ctx) => const ChangePasswordScreen(),
      EditProfileScreen.routeName: (ctx) =>const EditProfileScreen(),
      ContactUsScreen.routeName: (ctx) => const ContactUsScreen(), // Added Contact Us Screen route

    };
  }
}
