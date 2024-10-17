// // wbl_flutter_new\lib\widgets\profile_picture.dart
// import 'package:flutter/material.dart';
// import 'dart:io';  // <-- Import this to use File

// class ProfilePicture extends StatelessWidget {
//   final String? imagePath;
//   final String username;

//   const ProfilePicture({Key? key, this.imagePath, required this.username}) : super(key: key);

//   @override
//   Widget build(BuildContext context) {
//     return CircleAvatar(
//       radius: 50,
//       backgroundColor: Colors.blueGrey,
//       backgroundImage: imagePath != null ? FileImage(File(imagePath!)) : null,
//       child: imagePath == null
//           ? Text(
//               username.isNotEmpty ? username[0].toUpperCase() : '?',
//               style: TextStyle(fontSize: 40, color: Colors.white),
//             )
//           : null,
//     );
//   }
// }



import 'package:flutter/material.dart';
import 'dart:io';

class ProfilePicture extends StatelessWidget {
  final String? imagePath;  // Nullable image path for profile picture
  final String username;    // Non-nullable username

  const ProfilePicture({Key? key, this.imagePath, required this.username}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return CircleAvatar(
      radius: 50,
      backgroundColor: Colors.blueGrey,
      backgroundImage: imagePath != null && imagePath!.isNotEmpty  // Check if imagePath exists and is non-empty
          ? FileImage(File(imagePath!)) 
          : null,  // No imagePath provided
      child: imagePath == null || imagePath!.isEmpty  // If no profile picture, show the first letter of the username
          ? Text(
              username.isNotEmpty ? username[0].toUpperCase() : '?',  // First letter of username or fallback '?'
              style: const TextStyle(fontSize: 40, color: Colors.white),
            )
          : null,  // Do not display text if image is available
    );
  }
}
