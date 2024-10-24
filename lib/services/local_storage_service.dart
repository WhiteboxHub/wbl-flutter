// // wbl_flutter_new/lib/services/local_storage_service.dart
// import 'package:shared_preferences/shared_preferences.dart';

// class LocalStorageService {
//   static Future<void> saveUserData(String username, String email) async {
//     SharedPreferences prefs = await SharedPreferences.getInstance();
//     await prefs.setBool('isLoggedIn', true);
//     await prefs.setString('username', username);
//     await prefs.setString('email', email);
//     // await prefs.setString('accessToken', accessToken);
    
//     print('-------------------- SAVING USER DATA --------------------');
//     print('Username: $username');
//     print('Email: $email');
//     // print('Access Token: $accessToken');
//     print('-----------------------------------------------------------');
//   }

//   static Future<void> clearUserData() async {
//     SharedPreferences prefs = await SharedPreferences.getInstance();
//     await prefs.setBool('isLoggedIn', false); // Set login status to false
//     await prefs.remove('username'); // Remove username
//     await prefs.remove('email'); // Remove email
//     await prefs.remove('accessToken'); // Remove access token
//     await prefs.setBool('firstTime', true); // Reset first-time flag
//     print('-------------------- USER DATA CLEARED --------------------');
//   }

//   static Future<bool> isLoggedIn() async {
//     SharedPreferences prefs = await SharedPreferences.getInstance();
//     bool loggedIn = prefs.getBool('isLoggedIn') ?? false;
    
//     print('-------------------- CHECKING LOGIN STATUS --------------------');
//     print('Is Logged In: $loggedIn');
//     print('---------------------------------------------------------------');
    
//     return loggedIn;
//   }

//   static Future<bool> isFirstTimeUser() async {
//     SharedPreferences prefs = await SharedPreferences.getInstance();
//     bool firstTime = prefs.getBool('firstTime') ?? true;

//     if (firstTime) {
//       await prefs.setBool('firstTime', false);
//     }

//     print('-------------------- CHECKING FIRST TIME USER --------------------');
//     print('Is First Time User: $firstTime');
//     print('---------------------------------------------------------------');
    
//     return firstTime;
//   }

//   static Future<Map<String, String?>> getUserData() async {
//     SharedPreferences prefs = await SharedPreferences.getInstance();
//     String? username = prefs.getString('username');
//     String? email = prefs.getString('email');
//     String? accessToken = prefs.getString('accessToken');
    
//     print('-------------------- RETRIEVING USER DATA --------------------');
//     print('Username: $username');
//     print('Email: $email');
//     print('Access Token: $accessToken');
//     print('---------------------------------------------------------------');

//     return {
//       'username': username,
//       'email': email,
//       'accessToken': accessToken,
//     };
//   }
// }



// wbl_flutter_new/lib/services/local_storage_service.dart
import 'package:shared_preferences/shared_preferences.dart';

class LocalStorageService {
  static Future<void> saveUserData(String username, String email) async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    await prefs.setBool('isLoggedIn', true);
    await prefs.setString('username', username);
    await prefs.setString('email', email);
    // await prefs.setString('accessToken', accessToken);
    
    print('-------------------- SAVING USER DATA --------------------');
    print('Username: $username');
    print('Email: $email');
    // print('Access Token: $accessToken');
    print('-----------------------------------------------------------');
  }

  static Future<void> clearUserData() async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    await prefs.setBool('isLoggedIn', false); // Set login status to false
    await prefs.remove('username'); // Remove username
    await prefs.remove('email'); // Remove email
    await prefs.remove('accessToken'); // Remove access token
    await prefs.setBool('firstTime', true); // Reset first-time flag
    print('-------------------- USER DATA CLEARED --------------------');
  }

  static Future<bool> isLoggedIn() async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    bool loggedIn = prefs.getBool('isLoggedIn') ?? false;
    
    print('-------------------- CHECKING LOGIN STATUS --------------------');
    print('Is Logged In: $loggedIn');
    print('---------------------------------------------------------------');
    
    return loggedIn;
  }

  static Future<bool> isFirstTimeUser() async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    bool firstTime = prefs.getBool('firstTime') ?? true;

    if (firstTime) {
      await prefs.setBool('firstTime', false); // Only set to false after the first visit.
    }

    print('-------------------- CHECKING FIRST TIME USER --------------------');
    print('Is First Time User: $firstTime');
    print('---------------------------------------------------------------');
    
    return firstTime;
  }

  static Future<Map<String, String?>> getUserData() async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    String? username = prefs.getString('username');
    String? email = prefs.getString('email');
    String? accessToken = prefs.getString('accessToken');
    
    print('-------------------- RETRIEVING USER DATA --------------------');
    print('Username: $username');
    print('Email: $email');
    print('Access Token: $accessToken');
    print('---------------------------------------------------------------');

    return {
      'username': username,
      'email': email,
      'accessToken': accessToken,
    };
  }
}
