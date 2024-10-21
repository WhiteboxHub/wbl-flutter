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

  Future<void> fetchUserData() async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    String? username = prefs.getString('username');
    // String? email = prefs.getString('email');
    
    if (username != null) {
      _user = UserModel(username: username);
      notifyListeners();
    }
  }

  Future<void> autoLogin() async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    if (prefs.getBool('isLoggedIn') ?? false) {
      String? username = prefs.getString('username');
      // String? email = prefs.getString('email');
      // Print loaded data for debugging
      // print('-------------------- LOADING USER DATA --------------------');
      
      // print('Username: $username');
      // print('Email: $email');
      // print('-----------------------------------------------------------');
      // Load selected course from shared preferences
      _selectedCourse = prefs.getString('selected_course') ?? 'ML'; // Default to 'ML'

      if (username != null) {
        _user = UserModel(username: username);
        notifyListeners();
      } else {
        print('User is not logged in');
      }
    }
  }

  void logout() async {
    // Clear the access token from SharedPreferences
    SharedPreferences prefs = await SharedPreferences.getInstance();
    await prefs.remove('access_token'); // Remove access token
    await prefs.remove('isLoggedIn'); // Remove login status
    await prefs.setString('selected_course', _selectedCourse); // Save selected course
    _user = null;
    notifyListeners();
  }
}
