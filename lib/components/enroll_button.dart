import 'package:flutter/material.dart';

class EnrollButton extends StatelessWidget {
  const EnrollButton({super.key});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 20.0),
      child: ElevatedButton(
        style: ElevatedButton.styleFrom(
          backgroundColor: Colors.blueAccent, // Background color
        ),
        onPressed: () {
          // Add your navigation or action here
        },
        child: const Text('Enroll Now'),
      ),
    );
  }
}