// import 'package:flutter/material.dart';

// class LoginScreen extends StatelessWidget {
//   static const routeName = '/login-screen';

//   const LoginScreen({super.key});

//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//       appBar: AppBar(
//         title: Text('Login'),
//       ),
//       body: Center(
//         child: Text('Login Screen'),
//       ),
//     );
//   }
// }

import 'package:flutter/material.dart';

class LoginScreen extends StatelessWidget {
  static const routeName = '/login-screen';

  const LoginScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Login'),
      ),
      body: const Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Icon(Icons.login, size: 100, color: Colors.blue),
            SizedBox(height: 20),
            Text('Login Screen', style: TextStyle(fontSize: 24)),
          ],
        ),
      ),
    );
  }
}
