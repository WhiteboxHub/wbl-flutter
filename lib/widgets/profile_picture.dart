// import 'package:flutter/material.dart';
// import 'dart:io';

// class ProfilePicture extends StatelessWidget {
//   final String? imagePath;  // Nullable image path for profile picture
//   final String username;    // Non-nullable username

//   const ProfilePicture({super.key, this.imagePath, required this.username});

//   @override
//   Widget build(BuildContext context) {
//     return CircleAvatar(
//       radius: 50,
//       backgroundColor:  Color.fromARGB(255, 175, 134, 223),
//       backgroundImage: imagePath != null && imagePath!.isNotEmpty  // Check if imagePath exists and is non-empty
//           ? FileImage(File(imagePath!)) 
//           : null,  // No imagePath provided
//       child: imagePath == null || imagePath!.isEmpty  // If no profile picture, show the first letter of the username
//           ? Text(
//               username.isNotEmpty ? username[0].toUpperCase() : '?',  // First letter of username or fallback '?'
//               style: const TextStyle(fontSize: 40, color: Colors.teal),
//             )
//           : null,  // Do not display text if image is available
//     );
//   }
// }

// import 'package:flutter/material.dart';
// import 'dart:io';

// class ProfilePicture extends StatelessWidget {
//   final String? imagePath; // Nullable image path for profile picture
//   final String username;    // Non-nullable username

//   const ProfilePicture({super.key, this.imagePath, required this.username});

//   @override
//   Widget build(BuildContext context) {
//     return Container(
//       width: 100, // Set a width for the container
//       height: 100, // Set a height for the container
//       decoration: BoxDecoration(
//         shape: BoxShape.circle,
//         gradient: LinearGradient( // Use a gradient
//           colors: [
//             Color.fromARGB(255, 118, 248, 187), // First color
//             Color.fromARGB(255, 184, 238, 213), // First color
//             // Color.fromARGB(255, 252, 10, 10), // Second color
//           ],
//           begin: Alignment.topLeft,
//           end: Alignment.bottomRight,
//         ),
//       ),
//       child: CircleAvatar(
//         radius: 50,
//         backgroundColor: Colors.transparent, // Make background transparent
//         backgroundImage: imagePath != null && imagePath!.isNotEmpty // Check if imagePath exists and is non-empty
//             ? FileImage(File(imagePath!))
//             : null, // No imagePath provided
//         child: imagePath == null || imagePath!.isEmpty // If no profile picture, show the first letter of the username
//             ? Text(
//                 username.isNotEmpty ? username[0].toUpperCase() : '?', // First letter of username or fallback '?'
//                 style: const TextStyle(fontSize: 40, color: Color.fromARGB(255, 161, 127, 255)),
//               )
//             : null, // Do not display text if image is available
//       ),
//     );
//   }
// }



// import 'package:flutter/material.dart';
// import 'dart:io';

// class ProfilePicture extends StatelessWidget {
//   final String? imagePath; // Nullable image path for profile picture
//   final String username;    // Non-nullable username
//   final String? fullName;   // Nullable full name
//   const ProfilePicture({
//     super.key,
//     this.imagePath,
//     required this.username,
//     this.fullName, // Added full name parameter
//   });

//   @override
//   Widget build(BuildContext context) {
// print('**************************************************');
// print("username :"+username);
// print(fullName);
//     return Container(
//       width: 100, // Set a width for the container
//       height: 100, // Set a height for the container
//       decoration: BoxDecoration(
//         shape: BoxShape.circle,
//         gradient: LinearGradient( // Use a gradient
//           colors: [
//             Color.fromARGB(255, 118, 248, 187), // First color
//             Color.fromARGB(255, 184, 238, 213), // Second color
//           ],
//           begin: Alignment.topLeft,
//           end: Alignment.bottomRight,
//         ),
//       ),
//       child: CircleAvatar(
//         radius: 50,
//         backgroundColor: Colors.transparent, // Make background transparent
//         backgroundImage: imagePath != null && imagePath!.isNotEmpty // Check if imagePath exists and is non-empty
//             ? FileImage(File(imagePath!))
//             : null, // No imagePath provided
//         child: imagePath == null || imagePath!.isEmpty // If no profile picture, show the first letter of the full name
//             ? Text(
//                 fullName != null && fullName!.isNotEmpty
//                     ? fullName![0].toUpperCase() // First letter of the full name
//                     : username.isNotEmpty
//                         ? username[0].toUpperCase() // Fallback to first letter of username if full name is not available
//                         : '?', // Fallback if both are empty
//                 style: const TextStyle(fontSize: 40, color: Color.fromARGB(255, 161, 127, 255)),
//               )
//             : null, // Do not display text if image is available
//       ),
//     );
//   }
// }


// wbl_flutter_new\lib\widgets\profile_picture.dart
import 'package:flutter/material.dart';
import 'dart:io';

class ProfilePicture extends StatelessWidget {
  final String? imagePath; // Nullable image path for profile picture
  final String username;    // Non-nullable username
  final String? fullName;   // Nullable full name

  const ProfilePicture({
    super.key,
    this.imagePath,
    required this.username,
    this.fullName, // Added full name parameter
  });

  @override
  Widget build(BuildContext context) {
    print('***************************');
    print(fullName);
    return Container(
      width: 100, // Set a width for the container
      height: 100, // Set a height for the container
      decoration: BoxDecoration(
        shape: BoxShape.circle,
        gradient: LinearGradient( // Use a gradient
          colors: [
            Color.fromARGB(255, 118, 248, 187), // First color
            Color.fromARGB(255, 184, 238, 213), // Second color
          ],
          begin: Alignment.topLeft,
          end: Alignment.bottomRight,
        ),
      ),
      child: CircleAvatar(
        radius: 50,
        backgroundColor: Colors.transparent, // Make background transparent
        backgroundImage: imagePath != null && imagePath!.isNotEmpty // Check if imagePath exists and is non-empty
            ? FileImage(File(imagePath!))
            : null, // No imagePath provided
        child: imagePath == null || imagePath!.isEmpty // If no profile picture, show the first letter of the full name
            ? Text(
                fullName != null && fullName!.isNotEmpty
                    ? fullName![0].toUpperCase() // First letter of the full name
                    : username.isNotEmpty
                        ? username[0].toUpperCase() // Fallback to first letter of username if full name is not available
                        : '?', // Fallback if both are empty
                style: const TextStyle(fontSize: 40, color: Color.fromARGB(255, 161, 127, 255)),
              )
            : null, // Do not display text if image is available
      ),
    );
  }
}
