import 'package:flutter/material.dart';

class ScrollToTop extends StatelessWidget {
  const ScrollToTop({super.key});

  @override
  Widget build(BuildContext context) {
    return FloatingActionButton(
      onPressed: () {
        // Implement scroll to top functionality
      },
      child: const Icon(Icons.arrow_upward),
    );
  }
}
