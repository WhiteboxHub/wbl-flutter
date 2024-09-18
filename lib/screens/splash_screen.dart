import 'dart:async';
// import 'package:wbl_mobile_app/screens/sign_in_screen.dart';
import 'package:wbl_mobile_app/screens/tab_screen.dart';
import 'package:flutter/material.dart';

class SplashScreen extends StatefulWidget {
  const SplashScreen({super.key});
  static const routeName = '/splash-screen';

  @override
  State<SplashScreen> createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen> {
  @override
  void initState() {
    super.initState();
    _checkUser();
  }

  Future<void> _checkUser() async {
    Timer(
      const Duration(seconds: 1),
      () => Navigator.pushNamedAndRemoveUntil(
        context,
        // SignInScreen.routeName,
        TabScreen.routeName,
        (route) => false,
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: Container(
          padding: const EdgeInsets.all(16.0),
          child: Image.asset('assets/images/logo-square.png'),

        ),
      ),
    );
  }
}
