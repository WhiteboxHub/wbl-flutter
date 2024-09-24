// class UserModel {
//   final String username;
//   final String email;
//   String? profilePicture;

//   UserModel({
//     required this.username,
//     required this.email,
//     this.profilePicture,
//   });

//   // Method to convert JSON to UserModel object
//   factory UserModel.fromJson(Map<String, dynamic> json) {
//     return UserModel(
//       username: json['username'],
//       email: json['email'],
//       profilePicture: json['profilePicture'],
//     );
//   }
// }



class UserModel {
  final String username;
  final String email;
  String? profilePicture;

  UserModel({
    required this.username,
    required this.email,
    this.profilePicture,
  });

  // Method to convert JSON to UserModel object
  factory UserModel.fromJson(Map<String, dynamic> json) {
    return UserModel(
      username: json['username'],
      email: json['email'],
      profilePicture: json['profilePicture'],
    );
  }
}
