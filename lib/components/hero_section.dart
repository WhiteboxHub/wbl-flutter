// import 'package:flutter/material.dart';

// class HeroSection extends StatelessWidget {
//   @override
//   Widget build(BuildContext context) {
//     return Container(
//       padding: EdgeInsets.all(16),
//       child: Text('Hero Section'),
//       // Add more hero section properties and widgets here
//     );
//   }
// }

import 'package:flutter/material.dart';

class HeroSection extends StatelessWidget {
  const HeroSection({super.key});

  @override
  Widget build(BuildContext context) {
    // Get the current theme's text color based on brightness (dark/light mode)
    final textColor = Theme.of(context).brightness == Brightness.dark
        ? Colors.white
        : Colors.black;

    return Container(
      padding: const EdgeInsets.all(16),
      child: Text(
        'Hero Section',
        style: TextStyle(color: textColor),
      ),
      // Add more hero section properties and widgets here
    );
  }
}
