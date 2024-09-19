// import 'package:flutter/material.dart';

// class RegisterScreen extends StatelessWidget {
//   static const routeName = '/register-screen';

//   const RegisterScreen({super.key});

//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//       appBar: AppBar(
//         title: Text('Register'),
//       ),
//       body: Center(
//         child: Text('Register Screen'),
//       ),
//     );
//   }
// }


import 'package:flutter/material.dart';

class RegisterScreen extends StatelessWidget {
  static const routeName = '/register-screen';

  const RegisterScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Register'),
      ),
      body: const Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Icon(Icons.app_registration, size: 100, color: Colors.green),
            SizedBox(height: 20),
            Text('Register Screen', style: TextStyle(fontSize: 24)),
          ],
        ),
      ),
    );
  }
}
