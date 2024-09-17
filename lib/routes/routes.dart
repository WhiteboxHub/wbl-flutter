
// import 'package:flutter_educational_app_ui/screens/course_screen.dart';
// import 'package:flutter_educational_app_ui/screens/featured_screen.dart';
// import 'package:flutter_educational_app_ui/screens/forgot_password_screen.dart';
// import 'package:flutter_educational_app_ui/screens/sign_in_screen.dart';
// import 'package:flutter_educational_app_ui/screens/sign_up_screen.dart';
// import 'package:flutter_educational_app_ui/screens/splash_screen.dart';
// import 'package:flutter_educational_app_ui/screens/welcome_screen.dart';
// import 'package:flutter/material.dart';
// import 'package:flutter_educational_app_ui/screens/tab_screen.dart';
// import 'package:flutter_educational_app_ui/screens/settings_screen.dart';
// import 'package:flutter_educational_app_ui/screens/home_screen.dart';

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
import 'package:flutter_educational_app_ui/screens/course_screen.dart';
import 'package:flutter_educational_app_ui/screens/featured_screen.dart';
import 'package:flutter_educational_app_ui/screens/forgot_password_screen.dart';
import 'package:flutter_educational_app_ui/screens/sign_in_screen.dart';
import 'package:flutter_educational_app_ui/screens/sign_up_screen.dart';
import 'package:flutter_educational_app_ui/screens/splash_screen.dart';
import 'package:flutter_educational_app_ui/screens/welcome_screen.dart';
import 'package:flutter/material.dart';
import 'package:flutter_educational_app_ui/screens/tab_screen.dart';
import 'package:flutter_educational_app_ui/screens/settings_screen.dart';
import 'package:flutter_educational_app_ui/screens/home_screen.dart';
import 'package:flutter_educational_app_ui/screens/login_screen.dart';
import 'package:flutter_educational_app_ui/screens/register_screen.dart';
import 'package:flutter_educational_app_ui/screens/schedule_resources_screen.dart';

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
      SettingsScreen.routeName: (context) => const SettingsScreen(),
      HomeScreen.routeName: (context) => const HomeScreen(),
      LoginScreen.routeName: (context) => const LoginScreen(),
      RegisterScreen.routeName: (context) => const RegisterScreen(),
      ScheduleResourcesScreen.routeName: (context) => const ScheduleResourcesScreen(),
    };
  }
}
