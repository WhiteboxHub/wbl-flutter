import 'package:flutter/material.dart';

class CourseSection extends StatelessWidget {
  final String title;
  final String imagePath;

  const CourseSection({super.key, required this.title, required this.imagePath});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(16.0),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          Image.asset(
            imagePath,
            height: 150,
            fit: BoxFit.cover,
          ),
          const SizedBox(height: 8),
          Text(
            title,
            style: const TextStyle(
              fontWeight: FontWeight.bold,
              fontSize: 20,
              // color: Colors.white,
            ),
          ),
        ],
      ),
    );
  }
}