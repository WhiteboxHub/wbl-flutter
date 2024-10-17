// import 'package:flutter/material.dart';
// import 'package:shared_preferences/shared_preferences.dart';
// import '../models/user_model.dart';

// class UserProvider with ChangeNotifier {
//   UserModel? _user;

//   UserModel? get user => _user;

//   Future<void> login(String username, String email) async {
//     _user = UserModel(username: username, email: email);
//     notifyListeners();

//     SharedPreferences prefs = await SharedPreferences.getInstance();
//     prefs.setBool('isLoggedIn', true);
//     prefs.setString('username', username);
//     prefs.setString('email', email);
//       // Debugging: Add print statements to verify if login is called
//   print('Login successful. Username: $username, Email: $email');
//   }

//   Future<void> autoLogin() async {
//     SharedPreferences prefs = await SharedPreferences.getInstance();
//     if (prefs.getBool('isLoggedIn') ?? false) {
//       String? username = prefs.getString('username');
//       String? email = prefs.getString('email');
//       if (username != null && email != null) {
//         _user = UserModel(username: username, email: email);
//         notifyListeners();
//           // Debugging: Add print statements to verify autoLogin is working
//       print('AutoLogin successful. Username: $username, Email: $email');
//       }
  //     }else {
  //     print('AutoLogin failed. No user is logged in.');
  //   }
  //   }

  //   void logout() async {
  //     _user = null;
  //     notifyListeners();

  //     SharedPreferences prefs = await SharedPreferences.getInstance();
  //     prefs.setBool('isLoggedIn', false);
  //   }
  // }


// wbl_flutter_new\lib\providers\user_provider.dart
import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';
import '../models/user_model.dart';

class UserProvider with ChangeNotifier {
  UserModel? _user;
  String _selectedCourse = 'ML'; // Default course

  UserModel? get user => _user;
  String get selectedCourse => _selectedCourse; // Getter for selected course

  void changeCourse(String course) async {
    _selectedCourse = course;
    notifyListeners();

    SharedPreferences prefs = await SharedPreferences.getInstance();
    await prefs.setString('selected_course', _selectedCourse); // Save abbreviation
  }

  Future<void> autoLogin() async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    if (prefs.getBool('isLoggedIn') ?? false) {
      String? username = prefs.getString('username');
      String? email = prefs.getString('email');
        // Print loaded data for debugging
    print('-------------------- LOADING USER DATA --------------------');
    print('Username: $username');
    print('Email: $email');
    print('-----------------------------------------------------------');
      // Load selected course from shared preferences
      _selectedCourse = prefs.getString('selected_course') ?? 'ML'; // Default to 'ML'

      if (username != null && email != null) {
        _user = UserModel(username: username, email: email);
        notifyListeners();
      }
      else {
    print('User is not logged in');
  }
    }
  }

  void logout() async {
    // Save selected course in shared preferences on logout
    SharedPreferences prefs = await SharedPreferences.getInstance();
    await prefs.setString('selected_course', _selectedCourse);
    _user = null;
    notifyListeners();
  }
}
