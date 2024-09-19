
// import 'package:wbl_mobile_app/screens/course_screen.dart';
// import 'package:wbl_mobile_app/screens/featured_screen.dart';
// import 'package:wbl_mobile_app/screens/forgot_password_screen.dart';
// import 'package:wbl_mobile_app/screens/sign_in_screen.dart';
// import 'package:wbl_mobile_app/screens/sign_up_screen.dart';
// import 'package:wbl_mobile_app/screens/splash_screen.dart';
// import 'package:wbl_mobile_app/screens/welcome_screen.dart';
// import 'package:flutter/material.dart';
// import 'package:wbl_mobile_app/screens/tab_screen.dart';
// import 'package:wbl_mobile_app/screens/settings_screen.dart';
// import 'package:wbl_mobile_app/screens/home_screen.dart';

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
//     };
//   }
// }
import 'package:wbl_mobile_app/screens/course_screen.dart';
import 'package:wbl_mobile_app/screens/featured_screen.dart';
import 'package:wbl_mobile_app/screens/forgot_password_screen.dart';
import 'package:wbl_mobile_app/screens/sign_in_screen.dart';
import 'package:wbl_mobile_app/screens/sign_up_screen.dart';
import 'package:wbl_mobile_app/screens/splash_screen.dart';
import 'package:wbl_mobile_app/screens/welcome_screen.dart';
import 'package:flutter/material.dart';
import 'package:wbl_mobile_app/screens/tab_screen.dart';
import 'package:wbl_mobile_app/screens/my_learning_screen.dart';
import 'package:wbl_mobile_app/screens/my_wishlist_screen.dart';
import 'package:wbl_mobile_app/screens/settings_screen.dart';

class PageRoutes {
  Map<String, WidgetBuilder> routes() {
    return {
      SplashScreen.routeName: (context) => const SplashScreen(),
      TabScreen.routeName: (context) => const TabScreen(),
      SignInScreen.routeName: (context) => const SignInScreen(),
      SignUpScreen.routeName: (context) => const SignUpScreen(),
      WelcomeScreen.routeName: (context) => const WelcomeScreen(),
      ForgotPasswordScreen.routeName: (context) => const ForgotPasswordScreen(),
      FeaturedScreen.routeName: (context) => const FeaturedScreen(),
      CourseScreen.routeName: (context) => const CourseScreen(),
      MyLearningScreen.routeName: (context) => const MyLearningScreen(),
      MyWishlistScreen.routeName: (context) => const MyWishlistScreen(),
      SettingsScreen.routeName: (context) => const SettingsScreen(),
    };
  }
}
