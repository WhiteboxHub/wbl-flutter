import 'package:flutter/material.dart';
import 'dart:io';  // <-- Import this to use File

class ProfilePicture extends StatelessWidget {
  final String? imagePath;
  final String username;

  const ProfilePicture({Key? key, this.imagePath, required this.username}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return CircleAvatar(
      radius: 50,
      backgroundColor: Colors.blueGrey,
      backgroundImage: imagePath != null ? FileImage(File(imagePath!)) : null,
      child: imagePath == null
          ? Text(
              username.isNotEmpty ? username[0].toUpperCase() : '?',
              style: TextStyle(fontSize: 40, color: Colors.white),
            )
          : null,
    );
  }
}
