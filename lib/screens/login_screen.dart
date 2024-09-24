import 'dart:convert';
import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'package:wbl_mobile_app/screens/register_screen.dart';
import 'package:wbl_mobile_app/screens/forgot_password_screen .dart';
import 'package:wbl_mobile_app/screens/tab_screen.dart'; // Assuming you have a TabScreen
import 'package:shared_preferences/shared_preferences.dart';


class LoginScreen extends StatefulWidget {
  static const routeName = '/login';

  const LoginScreen({super.key});

  @override
  State<LoginScreen> createState() => _LoginScreenState();
}

class _LoginScreenState extends State<LoginScreen> {
  final TextEditingController emailController = TextEditingController();
  final TextEditingController passwordController = TextEditingController();
  bool isLoading = false;

  // Use the correct URL for the emulator
  static const apiUrl = "http://10.0.2.2:8000/api/login"; // for Android emulator
// static const apiUrl = "http://192.168.0.219:8000/api/login";

  Future<void> loginUser() async {
    setState(() {
      isLoading = true;
    });

    try {
      final response = await http.post(
        Uri.parse(apiUrl),
        headers: {'Content-Type': 'application/x-www-form-urlencoded'}, // Correct content type
        body: {
          'grant_type': 'password',
          'username': emailController.text, // 'admin' in your case
          'password': passwordController.text, // 'training' in your case
          'scope': '',
          'client_id': 'string',
          'client_secret': 'string',
        },
      );

      if (response.statusCode == 200) {
        final data = jsonDecode(response.body);

        if (data['access_token'] != null) {
          // Save token in shared preferences for auto-login
          SharedPreferences prefs = await SharedPreferences.getInstance();
          await prefs.setString('access_token', data['access_token']);

          // Token received, navigate to the TabScreen
          Navigator.pushReplacementNamed(context, TabScreen.routeName);
        } else {
          _showErrorMessage('Login failed: ${data['message']}');
          _resetInputFields();
        }
      } else {
        _showErrorMessage('Error: ${response.statusCode}');
        _resetInputFields();
      }
    } catch (error) {
      _showErrorMessage('An error occurred. Please try again.');
      _resetInputFields();
    } finally {
      setState(() {
        isLoading = false;
      });
    }
  }

  void _resetInputFields() {
    emailController.clear();
    passwordController.clear();
  }

  void _showErrorMessage(String message) {
    showDialog(
      context: context,
      builder: (ctx) => AlertDialog(
        title: const Text('Login Error'),
        content: Text(message),
        actions: [
          TextButton(
            onPressed: () => Navigator.of(ctx).pop(),
            child: const Text('OK'),
          ),
        ],
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.blueGrey[50],
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Center(
          child: SingleChildScrollView(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.center,
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Text(
                  'Welcome!',
                  style: TextStyle(
                    fontSize: 32,
                    fontWeight: FontWeight.bold,
                    color: const Color.fromARGB(255, 126, 22, 245), 
                  ),
                ),
                const SizedBox(height: 8),
                Text(
                  'Sign In to your account',
                  style: TextStyle(
                    fontSize: 18,
                    color: const Color.fromARGB(255, 107, 75, 253),
                  ),
                ),
                const SizedBox(height: 32),
                TextField(
                  controller: emailController,
                  decoration: InputDecoration(
                    labelText: 'Email Address *',
                    border: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(30),
                    ),
                    filled: true,
                    fillColor: Colors.white,
                    prefixIcon: const Icon(Icons.email, color: Colors.teal),
                  ),
                ),
                const SizedBox(height: 16),
                TextField(
                  controller: passwordController,
                  decoration: InputDecoration(
                    labelText: 'Password *',
                    border: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(30),
                    ),
                    filled: true,
                    fillColor: Colors.white,
                    prefixIcon: const Icon(Icons.lock, color: Colors.teal),
                  ),
                  obscureText: true,
                ),
                const SizedBox(height: 16),
                Align(
                  alignment: Alignment.centerLeft,
                  child: TextButton(
                    onPressed: () {
                      Navigator.pushNamed(
                          context, ForgotPasswordScreen.routeName);
                    },
                    style: TextButton.styleFrom(
                      backgroundColor: Colors.transparent,
                    ),
                    child: const Text('Forgot Password?'),
                  ),
                ),
                const SizedBox(height: 24),
                isLoading
                    ? const CircularProgressIndicator()
                    : Container(
                        width: double.infinity, // Full-width button
                        margin: const EdgeInsets.symmetric(horizontal: 20),
                        padding: const EdgeInsets.symmetric(horizontal: 16),
                        child: ElevatedButton(
                          onPressed: loginUser,
                          style: ElevatedButton.styleFrom(
                            backgroundColor:
                                const Color.fromARGB(255, 95, 46, 209),
                            shape: RoundedRectangleBorder(
                              borderRadius: BorderRadius.circular(30),
                            ),
                            padding: const EdgeInsets.symmetric(vertical: 16),
                          ),
                          child: const Text('Login',
                              style: TextStyle(color: Colors.white)),
                        ),
                      ),
                const SizedBox(height: 16),
                Center(
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      const Text("Don’t have an account?"),
                      TextButton(
                        onPressed: () {
                          Navigator.pushNamed(
                              context, RegisterScreen.routeName);
                        },
                        style: TextButton.styleFrom(
                          backgroundColor: Colors.transparent,
                        ),
                        child:
                            const Text('Register', style: TextStyle(color: Colors.teal)),
                      ),
                    ],
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}