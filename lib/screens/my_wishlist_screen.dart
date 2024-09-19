import 'package:flutter/material.dart';

class MyWishlistScreen extends StatelessWidget {
  static const routeName = '/my-wishlist';

const MyWishlistScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(      
      body:const Center(
        child: Text(
          'This is the My Info screen',
          // style: TextStyle(fontSize: 20),
          style: TextStyle(),
        ),
      ),
    );
  }
}




// import 'package:flutter/material.dart';

// class MyLearningScreen extends StatelessWidget {
//   static const routeName = '/my-learning';  // Add this routeName property

//   const MyLearningScreen({super.key});

//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//       appBar: AppBar(
//         title: const Text('My Learning'),
//       ),
//       body: const Center(
//         child: Text('My Learning Content'),
//       ),
//     );
//   }
// }
