// // wbl_flutter_new\lib\models\user_model.dart
// class UserModel {
//   final String username;
//   // final String email;
//   String? profilePicture;

//   UserModel({
//     required this.username,
//     // required this.email,
//     this.profilePicture,
//   });

//   // Method to convert JSON to UserModel object
//   factory UserModel.fromJson(Map<String, dynamic> json) {
//     return UserModel(
//       username: json['username'],
//       // email: json['email'],
//       profilePicture: json['profilePicture'],
//     );
//   }
//     @override
//   String toString() {
//     return 'UserModel( username: $username, profilePicture: $profilePicture)';
//   }
// }





// // wbl_flutter_new\lib\models\user_model.dart
// class UserModel {
//   final String username;
//   String? profilePicture;
  
//   // Adding the new fields
//   // final String? email;
//   final String? fullName;

//   UserModel({
//     required this.username,
//     this.profilePicture,
//     // this.email,      // Keep new fields optional for now
//     this.fullName,
//   });

//   // Method to convert JSON to UserModel object
// factory UserModel.fromJson(Map<String, dynamic> json) {
//   return UserModel(
//     username: json['uname'],  // Change to 'uname' to match your API
//     profilePicture: json['profilePicture'],
//     // email: json['uname'],  // If email is the username
//     fullName: json['fullname'],  // Correct the key to 'fullname'
//   );
// }


//   @override
//   String toString() {
//     return 'UserModel( username: $username,fullName: $fullName, profilePicture: $profilePicture)';
//   }
// }



// wbl_flutter_new\lib\models\user_model.dart
class UserModel {
  final String username;
  String? profilePicture;

  // Adding the new fields
  final String? email;
  final String? fullName;

  UserModel({
    required this.username,
    this.profilePicture,
    this.email, // Keep new fields optional for now
    this.fullName,
  });

  // Method to convert JSON to UserModel object
  factory UserModel.fromJson(Map<String, dynamic> json) {
    return UserModel(
      username: json['uname'], // Correct mapping for username
      profilePicture: json['profilePicture'],
      email: json['email'], // Add email parsing
      fullName: json['fullname'], // Add full name parsing (use exact key from API)
    );
  }

  @override
  String toString() {
    return 'UserModel( username: $username, email: $email, fullName: $fullName, profilePicture: $profilePicture)';
  }
}
