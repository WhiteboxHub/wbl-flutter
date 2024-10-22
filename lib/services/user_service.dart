// wbl_flutter_new\lib\services\user_service.dart
import 'package:http/http.dart' as http;
import 'dart:convert';

class UserService {
  static const String userUrl = "https://whitebox-learning.com/api/user_dashboard"; // Adjust this URL as needed

  static Future<Map<String, dynamic>> fetchUserDetails(String token) async {
    final response = await http.get(
      Uri.parse(userUrl),
      headers: {
        'Authorization': 'Bearer $token',
        'Content-Type': 'application/json',
      },
    );

    if (response.statusCode == 200) {
      return jsonDecode(response.body);
    } else {
      throw Exception('Failed to load user details');
    }
  }
}
