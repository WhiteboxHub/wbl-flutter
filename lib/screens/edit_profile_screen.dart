// import 'package:flutter/material.dart';
// import 'package:modal_progress_hud_nsn/modal_progress_hud_nsn.dart'; // For showing loading spinner
// import 'package:wbl_mobile_app/screens/login_screen.dart'; // Assuming you have a login screen.

// class EditProfileScreen extends StatefulWidget {
//   static const routeName = '/edit-profile-screen';

//   const EditProfileScreen({Key? key}) : super(key: key);

//   @override
//   State<EditProfileScreen> createState() => _EditProfileScreenState();
// }

// class _EditProfileScreenState extends State<EditProfileScreen> {
//   final formKey = GlobalKey<FormState>();
//   final TextEditingController usernameController = TextEditingController();
//   final TextEditingController emailController = TextEditingController();
//   bool showSpinner = false;

//   @override
//   void dispose() {
//     usernameController.dispose();
//     emailController.dispose();
//     formKey.currentState?.dispose();
//     super.dispose();
//   }

//   void _submit() async {
//     if (formKey.currentState?.validate() ?? false) {
//       setState(() {
//         showSpinner = true;
//       });

//       // Implement your profile update logic here.
//       // Once done, hide the spinner.
//       setState(() {
//         showSpinner = false;
//       });

//       // Navigate back to profile screen after editing
//       Navigator.pop(context);
//     }
//   }

//   @override
//   Widget build(BuildContext context) {
//     return ModalProgressHUD(
//       inAsyncCall: showSpinner,
//       child: GestureDetector(
//         onTap: () {
//           FocusScope.of(context).unfocus();
//         },
//         child: Scaffold(
//           appBar: AppBar(
//             title: Text('Edit Profile'),
//             leading: IconButton(
//               icon: Icon(Icons.arrow_back),
//               onPressed: () {
//                 Navigator.pop(context); // Navigate back
//               },
//             ),
//           ),
//           resizeToAvoidBottomInset: true,
//           body: SafeArea(
//             child: Center(
//               child: SingleChildScrollView(
//                 physics: const ClampingScrollPhysics(),
//                 padding: const EdgeInsets.all(32.0),
//                 child: Column(
//                   crossAxisAlignment: CrossAxisAlignment.center,
//                   children: [
//                     Text(
//                       'Edit Profile',
//                       style: Theme.of(context).textTheme.headlineLarge!.copyWith(
//                             color: const Color.fromARGB(255, 107, 75, 253),
//                             fontWeight: FontWeight.bold,
//                           ),
//                     ),
//                     const SizedBox(height: 24),
//                     Form(
//                       key: formKey,
//                       child: Column(
//                         crossAxisAlignment: CrossAxisAlignment.start,
//                         children: [
//                           TextFormField(
//                             controller: usernameController,
//                             decoration: InputDecoration(
//                               labelText: 'Username *',
//                               border: OutlineInputBorder(
//                                 borderRadius: BorderRadius.circular(30),
//                               ),
//                               filled: true,
//                               fillColor: Colors.white,
//                               prefixIcon: Icon(Icons.person, color: Colors.teal),
//                             ),
//                             validator: (value) {
//                               if (value == null || value.isEmpty) {
//                                 return 'Please enter your username';
//                               }
//                               return null;
//                             },
//                           ),
//                           const SizedBox(height: 16), // Equal spacing between inputs
//                           TextFormField(
//                             controller: emailController,
//                             decoration: InputDecoration(
//                               labelText: 'Email *',
//                               border: OutlineInputBorder(
//                                 borderRadius: BorderRadius.circular(30),
//                               ),
//                               filled: true,
//                               fillColor: Colors.white,
//                               prefixIcon: Icon(Icons.email, color: Colors.teal),
//                             ),
//                             validator: (value) {
//                               if (value == null || value.isEmpty) {
//                                 return 'Please enter your email';
//                               }
//                               if (!RegExp(r'^[^@]+@[^@]+\.[^@]+').hasMatch(value)) {
//                                 return 'Please enter a valid email address';
//                               }
//                               return null;
//                             },
//                           ),
//                           const SizedBox(height: 16), // Equal spacing between inputs
//                           Container(
//                             width: double.infinity,
//                             margin: const EdgeInsets.symmetric(horizontal: 20),
//                             padding: const EdgeInsets.symmetric(horizontal: 16),
//                             child: ElevatedButton(
//                               onPressed: _submit,
//                               style: ElevatedButton.styleFrom(
//                                 backgroundColor: const Color.fromARGB(255, 95, 46, 209),
//                                 shape: RoundedRectangleBorder(
//                                   borderRadius: BorderRadius.circular(30),
//                                 ),
//                                 padding: const EdgeInsets.symmetric(vertical: 16),
//                               ),
//                               child: const Text(
//                                 'Save Changes',
//                                 style: TextStyle(color: Colors.white),
//                               ),
//                             ),
//                           ),
//                         ],
//                       ),
//                     ),
//                   ],
//                 ),
//               ),
//             ),
//           ),
//         ),
//       ),
//     );
//   }
// }


import 'package:flutter/material.dart';
import 'package:modal_progress_hud_nsn/modal_progress_hud_nsn.dart';
import 'package:wbl_mobile_app/screens/login_screen.dart';

class EditProfileScreen extends StatefulWidget {
  static const routeName = '/edit-profile-screen';

  const EditProfileScreen({Key? key}) : super(key: key);

  @override
  State<EditProfileScreen> createState() => _EditProfileScreenState();
}

class _EditProfileScreenState extends State<EditProfileScreen> {
  final formKey = GlobalKey<FormState>();
  final TextEditingController usernameController = TextEditingController();
  final TextEditingController emailController = TextEditingController();
  bool showSpinner = false;

  @override
  void dispose() {
    usernameController.dispose();
    emailController.dispose();
    formKey.currentState?.dispose();
    super.dispose();
  }

  void _submit() async {
    if (formKey.currentState?.validate() ?? false) {
      setState(() {
        showSpinner = true;
      });
      // Implement your update profile logic here.
      setState(() {
        showSpinner = false;
      });
      Navigator.pushReplacementNamed(context, LoginScreen.routeName);
    }
  }

  @override
  Widget build(BuildContext context) {
    return ModalProgressHUD(
      inAsyncCall: showSpinner,
      child: GestureDetector(
        onTap: () {
          FocusScope.of(context).unfocus();
        },
        child: Scaffold(
          body: SafeArea(
            child: Center(
              child: SingleChildScrollView(
                padding: const EdgeInsets.all(32.0),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: [
                    // Back button with icon
                    Align(
                      alignment: Alignment.topLeft,
                      child: IconButton(
                        icon: Icon(Icons.arrow_back, color: Colors.black),
                        onPressed: () {
                          Navigator.pop(context); // Go back to the previous screen
                        },
                      ),
                    ),
                    Text(
                      'Edit Profile',
                      style: Theme.of(context).textTheme.headlineLarge!.copyWith(
                            color: const Color.fromARGB(255, 107, 75, 253),
                            fontWeight: FontWeight.bold,
                          ),
                    ),
                    const SizedBox(height: 24),
                    Form(
                      key: formKey,
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          TextFormField(
                            controller: usernameController,
                            decoration: InputDecoration(
                              labelText: 'Username *',
                              border: OutlineInputBorder(
                                borderRadius: BorderRadius.circular(30),
                              ),
                              filled: true,
                              fillColor: Colors.transparent, // Transparent background
                              prefixIcon: Icon(Icons.person, color: Colors.teal),
                            ),
                            validator: (value) {
                              if (value == null || value.isEmpty) {
                                return 'Please enter your username';
                              }
                              return null;
                            },
                          ),
                          const SizedBox(height: 16),
                          TextFormField(
                            controller: emailController,
                            decoration: InputDecoration(
                              labelText: 'Email *',
                              border: OutlineInputBorder(
                                borderRadius: BorderRadius.circular(30),
                              ),
                              filled: true,
                              fillColor: Colors.transparent, // Transparent background
                              prefixIcon: Icon(Icons.email, color: Colors.teal),
                            ),
                            validator: (value) {
                              if (value == null || value.isEmpty) {
                                return 'Please enter your email';
                              }
                              return null;
                            },
                          ),
                          const SizedBox(height: 24),
                          Container(
                            width: double.infinity,
                            margin: const EdgeInsets.symmetric(horizontal: 20),
                            child: ElevatedButton(
                              onPressed: _submit,
                              style: ElevatedButton.styleFrom(
                                backgroundColor: const Color.fromARGB(255, 95, 46, 209),
                                shape: RoundedRectangleBorder(
                                  borderRadius: BorderRadius.circular(30),
                                ),
                                padding: const EdgeInsets.symmetric(vertical: 16),
                              ),
                              child: const Text(
                                'Update Profile',
                                style: TextStyle(color: Colors.white),
                              ),
                            ),
                          ),
                        ],
                      ),
                    ),
                  ],
                ),
              ),
            ),
          ),
        ),
      ),
    );
  }
}
