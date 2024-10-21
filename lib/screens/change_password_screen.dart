// import 'package:flutter/material.dart';
// import 'package:modal_progress_hud_nsn/modal_progress_hud_nsn.dart';
// import 'package:wbl_mobile_app/screens/login_screen.dart';

// class ChangePasswordScreen extends StatefulWidget {
//   static const routeName = '/change-password-screen';

//   const ChangePasswordScreen({super.key});

//   @override
//   State<ChangePasswordScreen> createState() => _ChangePasswordScreenState();
// }

// class _ChangePasswordScreenState extends State<ChangePasswordScreen> {
//   final formKey = GlobalKey<FormState>();
//   final TextEditingController passwordController = TextEditingController();
//   final TextEditingController confirmPasswordController = TextEditingController();
//   bool showSpinner = false;

//   @override
//   void dispose() {
//     passwordController.dispose();
//     confirmPasswordController.dispose();
//     formKey.currentState?.dispose();
//     super.dispose();
//   }

//   void _submit() async {
//     if (formKey.currentState?.validate() ?? false) {
//       setState(() {
//         showSpinner = true;
//       });
//       // Implement your password change logic here.
//       setState(() {
//         showSpinner = false;
//       });
//       Navigator.pushReplacementNamed(context, LoginScreen.routeName);
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
//           body: SafeArea(
//             child: Column(
//               children: [
//               // Back button with icon
//                 Padding(
//                   padding: const EdgeInsets.only(top: 16.0), // Add space from the top
//                   child: Row(
//                     children: [
//                       IconButton(
//                         icon: const Icon(Icons.arrow_back, color: Colors.black),
//                         onPressed: () {
//                           Navigator.pop(context); // Go back to the previous screen
//                         },
//                       ),
//                       const SizedBox(width: 10), // Add some space after the icon
//                     ],
//                   ),
//                 ),
//                 const SizedBox(height: 30), // Add some space after the back button
//                 Expanded(
//                   child: SingleChildScrollView(
//                     padding: const EdgeInsets.all(32.0),
//                     child: Form(
//                       key: formKey,
//                       child: Column(
//                         crossAxisAlignment: CrossAxisAlignment.start,
//                         children: [
//                           Text(
//                             'Change Password',
//                             style: Theme.of(context).textTheme.headlineLarge!.copyWith(
//                                   color: const Color.fromARGB(255, 107, 75, 253),
//                                   fontWeight: FontWeight.bold,
//                                 ),
//                           ),
//                           const SizedBox(height: 40),
//                           TextFormField(
//                             controller: passwordController,
//                             decoration: InputDecoration(
//                               labelText: 'Current Password *',
//                               border: OutlineInputBorder(
//                                 borderRadius: BorderRadius.circular(30),
//                               ),
//                               filled: true,
//                               fillColor: Colors.transparent, // Transparent background
//                               prefixIcon: const Icon(Icons.lock, color: Colors.teal),
//                             ),
//                             obscureText: true,
//                             validator: (value) {
//                               if (value == null || value.isEmpty) {
//                                 return 'Please enter your current password';
//                               }
//                               return null;
//                             },
//                           ),
//                           const SizedBox(height: 16), // Space between inputs
//                           TextFormField(
//                             controller: passwordController,
//                             decoration: InputDecoration(
//                               labelText: 'New Password *',
//                               border: OutlineInputBorder(
//                                 borderRadius: BorderRadius.circular(30),
//                               ),
//                               filled: true,
//                               fillColor: Colors.transparent, // Transparent background
//                               prefixIcon: const Icon(Icons.lock, color: Colors.teal),
//                             ),
//                             obscureText: true,
//                             validator: (value) {
//                               if (value == null || value.isEmpty) {
//                                 return 'Please enter a new password';
//                               }
//                               return null;
//                             },
//                           ),
//                           const SizedBox(height: 16),
//                           TextFormField(
//                             controller: confirmPasswordController,
//                             decoration: InputDecoration(
//                               labelText: 'Confirm Password *',
//                               border: OutlineInputBorder(
//                                 borderRadius: BorderRadius.circular(30),
//                               ),
//                               filled: true,
//                               fillColor: Colors.transparent, // Transparent background
//                               prefixIcon: const Icon(Icons.lock, color: Colors.teal),
//                             ),
//                             obscureText: true,
//                             validator: (value) {
//                               if (value == null || value.isEmpty) {
//                                 return 'Please confirm your password';
//                               }
//                               if (value != passwordController.text) {
//                                 return 'Passwords do not match';
//                               }
//                               return null;
//                             },
//                           ),
//                           const SizedBox(height: 24),
//                           Container(
//                             width: double.infinity,
//                             margin: const EdgeInsets.symmetric(horizontal: 20),
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
//                                 'Change Password',
//                                 style: TextStyle(color: Colors.white),
//                               ),
//                             ),
//                           ),
//                         ],
//                       ),
//                     ),
//                   ),
//                 ),
//               ],
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

class ChangePasswordScreen extends StatefulWidget {
  static const routeName = '/change-password-screen';

  const ChangePasswordScreen({super.key});

  @override
  State<ChangePasswordScreen> createState() => _ChangePasswordScreenState();
}

class _ChangePasswordScreenState extends State<ChangePasswordScreen> {
  final formKey = GlobalKey<FormState>();
  final TextEditingController currentPasswordController = TextEditingController();
  final TextEditingController newPasswordController = TextEditingController();
  final TextEditingController confirmPasswordController = TextEditingController();
  bool showSpinner = false;
  bool isCurrentPasswordVisible = false;
  bool isNewPasswordVisible = false;
  bool isConfirmPasswordVisible = false;

  @override
  void dispose() {
    currentPasswordController.dispose();
    newPasswordController.dispose();
    confirmPasswordController.dispose();
    formKey.currentState?.dispose();
    super.dispose();
  }

  void _submit() async {
    if (formKey.currentState?.validate() ?? false) {
      setState(() {
        showSpinner = true;
      });
      // Implement your password change logic here.
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
            child: Column(
              children: [
                // Back button with icon
                Padding(
                  padding: const EdgeInsets.only(top: 16.0), // Add space from the top
                  child: Row(
                    children: [
                      IconButton(
                        icon: const Icon(Icons.arrow_back, color: Colors.black),
                        onPressed: () {
                          Navigator.pop(context); // Go back to the previous screen
                        },
                      ),
                      const SizedBox(width: 10), // Add some space after the icon
                    ],
                  ),
                ),
                const SizedBox(height: 30), // Add some space after the back button
                Expanded(
                  child: SingleChildScrollView(
                    padding: const EdgeInsets.all(32.0),
                    child: Form(
                      key: formKey,
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text(
                            'Change Password',
                            style: Theme.of(context).textTheme.headlineLarge!.copyWith(
                                  color: const Color.fromARGB(255, 107, 75, 253),
                                  fontWeight: FontWeight.bold,
                                ),
                          ),
                          const SizedBox(height: 40),
                          // Current Password Field
                          TextFormField(
                            controller: currentPasswordController,
                            decoration: InputDecoration(
                              labelText: 'Current Password *',
                              border: OutlineInputBorder(
                                borderRadius: BorderRadius.circular(30),
                              ),
                              filled: true,
                              fillColor: Colors.transparent,
                              prefixIcon: const Icon(Icons.lock, color: Colors.teal),
                              suffixIcon: IconButton(
                                icon: Icon(
                                  isCurrentPasswordVisible
                                      ? Icons.visibility
                                      : Icons.visibility_off,
                                  color: Colors.teal,
                                ),
                                onPressed: () {
                                  setState(() {
                                    isCurrentPasswordVisible = !isCurrentPasswordVisible;
                                  });
                                },
                              ),
                            ),
                            obscureText: !isCurrentPasswordVisible,
                            validator: (value) {
                              if (value == null || value.isEmpty) {
                                return 'Please enter your current password';
                              }
                              return null;
                            },
                          ),
                          const SizedBox(height: 16), // Space between inputs
                          // New Password Field
                          TextFormField(
                            controller: newPasswordController,
                            decoration: InputDecoration(
                              labelText: 'New Password *',
                              border: OutlineInputBorder(
                                borderRadius: BorderRadius.circular(30),
                              ),
                              filled: true,
                              fillColor: Colors.transparent,
                              prefixIcon: const Icon(Icons.lock, color: Colors.teal),
                              suffixIcon: IconButton(
                                icon: Icon(
                                  isNewPasswordVisible
                                      ? Icons.visibility
                                      : Icons.visibility_off,
                                  color: Colors.teal,
                                ),
                                onPressed: () {
                                  setState(() {
                                    isNewPasswordVisible = !isNewPasswordVisible;
                                  });
                                },
                              ),
                            ),
                            obscureText: !isNewPasswordVisible,
                            validator: (value) {
                              if (value == null || value.isEmpty) {
                                return 'Please enter a new password';
                              }
                              return null;
                            },
                          ),
                          const SizedBox(height: 16),
                          // Confirm Password Field
                          TextFormField(
                            controller: confirmPasswordController,
                            decoration: InputDecoration(
                              labelText: 'Confirm Password *',
                              border: OutlineInputBorder(
                                borderRadius: BorderRadius.circular(30),
                              ),
                              filled: true,
                              fillColor: Colors.transparent,
                              prefixIcon: const Icon(Icons.lock, color: Colors.teal),
                              suffixIcon: IconButton(
                                icon: Icon(
                                  isConfirmPasswordVisible
                                      ? Icons.visibility
                                      : Icons.visibility_off,
                                  color: Colors.teal,
                                ),
                                onPressed: () {
                                  setState(() {
                                    isConfirmPasswordVisible = !isConfirmPasswordVisible;
                                  });
                                },
                              ),
                            ),
                            obscureText: !isConfirmPasswordVisible,
                            validator: (value) {
                              if (value == null || value.isEmpty) {
                                return 'Please confirm your password';
                              }
                              if (value != newPasswordController.text) {
                                return 'Passwords do not match';
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
                                'Change Password',
                                style: TextStyle(color: Colors.white),
                              ),
                            ),
                          ),
                        ],
                      ),
                    ),
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
