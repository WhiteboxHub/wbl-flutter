// wbl_flutter_new\lib\services\local_storage_service.dart
import 'package:shared_preferences/shared_preferences.dart';

class LocalStorageService {
  static Future<void> saveUserData(String username, String email) async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    await prefs.setBool('isLoggedIn', true);
    await prefs.setString('username', username);
    await prefs.setString('email', email);
      // Print statements to verify the saved data
       // Debugging: Print the data to console to verify
    print('-------------------- SAVING USER DATA --------------------');
    print('Username: $username');
    print('Email: $email');
    print('-----------------------------------------------------------');
  }

  static Future<void> clearUserData() async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    await prefs.clear();
     print('-------------------- USER DATA CLEARED --------------------');
  }

  // static Future<bool> isLoggedIn() async {
  //   SharedPreferences prefs = await SharedPreferences.getInstance();
  //   return prefs.getBool('isLoggedIn') ?? false;
  // }

    static Future<bool> isLoggedIn() async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    bool loggedIn = prefs.getBool('isLoggedIn') ?? false;
    
    print('-------------------- CHECKING LOGIN STATUS --------------------');
    print('Is Logged In: $loggedIn');
    print('---------------------------------------------------------------');
    
    return loggedIn;
  }
}
