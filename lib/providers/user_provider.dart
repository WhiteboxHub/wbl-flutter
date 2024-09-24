// import 'package:flutter/material.dart';
// import 'package:shared_preferences/shared_preferences.dart';
// import '../models/user_model.dart';

// class UserProvider with ChangeNotifier {
//   UserModel? _user;

//   UserModel? get user => _user;

//   Future<void> login(String username, String email) async {
//     _user = UserModel(username: username, email: email);
//     notifyListeners();

//     // Store login state
//     SharedPreferences prefs = await SharedPreferences.getInstance();
//     prefs.setBool('isLoggedIn', true);
//     prefs.setString('username', username);
//     prefs.setString('email', email);
//   }

//   Future<void> autoLogin() async {
//     SharedPreferences prefs = await SharedPreferences.getInstance();
//     if (prefs.getBool('isLoggedIn') ?? false) {
//       String? username = prefs.getString('username');
//       String? email = prefs.getString('email');
//       if (username != null && email != null) {
//         _user = UserModel(username: username, email: email);
//         notifyListeners();
//       }
//     }
//   }

//   void logout() async {
//     _user = null;
//     notifyListeners();

//     // Clear login state
//     SharedPreferences prefs = await SharedPreferences.getInstance();
//     prefs.setBool('isLoggedIn', false);
//   }
// }



import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';
import '../models/user_model.dart';

class UserProvider with ChangeNotifier {
  UserModel? _user;

  UserModel? get user => _user;

  Future<void> login(String username, String email) async {
    _user = UserModel(username: username, email: email);
    notifyListeners();

    SharedPreferences prefs = await SharedPreferences.getInstance();
    prefs.setBool('isLoggedIn', true);
    prefs.setString('username', username);
    prefs.setString('email', email);
      // Debugging: Add print statements to verify if login is called
  print('Login successful. Username: $username, Email: $email');
  }

  Future<void> autoLogin() async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    if (prefs.getBool('isLoggedIn') ?? false) {
      String? username = prefs.getString('username');
      String? email = prefs.getString('email');
      if (username != null && email != null) {
        _user = UserModel(username: username, email: email);
        notifyListeners();
          // Debugging: Add print statements to verify autoLogin is working
      print('AutoLogin successful. Username: $username, Email: $email');
      }
    }else {
    print('AutoLogin failed. No user is logged in.');
  }
  }

  void logout() async {
    _user = null;
    notifyListeners();

    SharedPreferences prefs = await SharedPreferences.getInstance();
    prefs.setBool('isLoggedIn', false);
  }
}
