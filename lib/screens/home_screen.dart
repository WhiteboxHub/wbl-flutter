// import 'package:flutter/material.dart';

// class HomeScreen extends StatelessWidget {
//   static const routeName = '/home-screen';

//   const HomeScreen({super.key});

//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//       appBar: AppBar(
//         title: Text('Home'),
//       ),
//       body: Center(
//         child: Text('Home Screen'),
//       ),
//     );
//   }
// }

import 'package:flutter/material.dart';

class HomeScreen extends StatelessWidget {
  static const routeName = '/home-screen';

  const HomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Home'),
      ),
      body: const Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Icon(Icons.home, size: 100, color: Colors.blue),
            SizedBox(height: 20),
            Text('Home Screen', style: TextStyle(fontSize: 24)),
          ],
        ),
      ),
    );
  }
}
