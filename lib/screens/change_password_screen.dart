// import 'package:flutter/material.dart';
// import 'package:modal_progress_hud_nsn/modal_progress_hud_nsn.dart'; // For showing loading spinner
// import 'package:wbl_mobile_app/screens/login_screen.dart'; // Assuming you have a login screen.

// class ChangePasswordScreen extends StatefulWidget {
//   static const routeName = '/change-password-screen';

//   const ChangePasswordScreen({Key? key}) : super(key: key);

//   @override
//   State<ChangePasswordScreen> createState() => _ChangePasswordScreenState();
// }

// class _ChangePasswordScreenState extends State<ChangePasswordScreen> {
//   final formKey = GlobalKey<FormState>();
//   final TextEditingController passwordController = TextEditingController();
//   final TextEditingController confirmPasswordController = TextEditingController();
//   final TextEditingController currentPasswordController = TextEditingController();
//   bool showSpinner = false;

//   @override
//   void dispose() {
//     passwordController.dispose();
//     confirmPasswordController.dispose();
//     currentPasswordController.dispose();
//     formKey.currentState?.dispose();
//     super.dispose();
//   }

//   void _submit() async {
//     if (formKey.currentState?.validate() ?? false) {
//       setState(() {
//         showSpinner = true;
//       });

//       // Implement your password change logic here.
//       // Once done, hide the spinner.
//       setState(() {
//         showSpinner = false;
//       });

//       // Navigate back to login screen after password change
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
//                       'Change Password',
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
//                             controller: currentPasswordController,
//                             decoration: InputDecoration(
//                               labelText: 'Current Password *',
//                               border: OutlineInputBorder(
//                                 borderRadius: BorderRadius.circular(30),
//                               ),
//                               filled: true,
//                               fillColor: Colors.white,
//                               prefixIcon: Icon(Icons.lock, color: Colors.teal),
//                             ),
//                             obscureText: true,
//                             validator: (value) {
//                               if (value == null || value.isEmpty) {
//                                 return 'Please enter your current password';
//                               }
//                               return null;
//                             },
//                           ),
//                           const SizedBox(height: 16), // Equal spacing between inputs
//                           TextFormField(
//                             controller: passwordController,
//                             decoration: InputDecoration(
//                               labelText: 'New Password *',
//                               border: OutlineInputBorder(
//                                 borderRadius: BorderRadius.circular(30),
//                               ),
//                               filled: true,
//                               fillColor: Colors.white,
//                               prefixIcon: Icon(Icons.lock, color: Colors.teal),
//                             ),
//                             obscureText: true,
//                             validator: (value) {
//                               if (value == null || value.isEmpty) {
//                                 return 'Please enter a new password';
//                               }
//                               return null;
//                             },
//                           ),
//                           const SizedBox(height: 16), // Equal spacing between inputs
//                           TextFormField(
//                             controller: confirmPasswordController,
//                             decoration: InputDecoration(
//                               labelText: 'Confirm Password *',
//                               border: OutlineInputBorder(
//                                 borderRadius: BorderRadius.circular(30),
//                               ),
//                               filled: true,
//                               fillColor: Colors.white,
//                               prefixIcon: Icon(Icons.lock, color: Colors.teal),
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
//                           const SizedBox(height: 24), // Equal spacing between inputs and button
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
//                                 'Change Password',
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

class ChangePasswordScreen extends StatefulWidget {
  static const routeName = '/change-password-screen';

  const ChangePasswordScreen({Key? key}) : super(key: key);

  @override
  State<ChangePasswordScreen> createState() => _ChangePasswordScreenState();
}

class _ChangePasswordScreenState extends State<ChangePasswordScreen> {
  final formKey = GlobalKey<FormState>();
  final TextEditingController passwordController = TextEditingController();
  final TextEditingController confirmPasswordController = TextEditingController();
  bool showSpinner = false;

  @override
  void dispose() {
    passwordController.dispose();
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
                      'Change Password',
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
                            controller: passwordController,
                            decoration: InputDecoration(
                              labelText: 'Current Password *',
                              border: OutlineInputBorder(
                                borderRadius: BorderRadius.circular(30),
                              ),
                              filled: true,
                              fillColor: Colors.transparent, // Transparent background
                              prefixIcon: Icon(Icons.lock, color: Colors.teal),
                            ),
                            obscureText: true,
                            validator: (value) {
                              if (value == null || value.isEmpty) {
                                return 'Please enter your current password';
                              }
                              return null;
                            },
                          ),
                          const SizedBox(height: 16), // Space between inputs
                          TextFormField(
                            controller: passwordController,
                            decoration: InputDecoration(
                              labelText: 'New Password *',
                              border: OutlineInputBorder(
                                borderRadius: BorderRadius.circular(30),
                              ),
                              filled: true,
                              fillColor: Colors.transparent, // Transparent background
                              prefixIcon: Icon(Icons.lock, color: Colors.teal),
                            ),
                            obscureText: true,
                            validator: (value) {
                              if (value == null || value.isEmpty) {
                                return 'Please enter a new password';
                              }
                              return null;
                            },
                          ),
                          const SizedBox(height: 16),
                          TextFormField(
                            controller: confirmPasswordController,
                            decoration: InputDecoration(
                              labelText: 'Confirm Password *',
                              border: OutlineInputBorder(
                                borderRadius: BorderRadius.circular(30),
                              ),
                              filled: true,
                              fillColor: Colors.transparent, // Transparent background
                              prefixIcon: Icon(Icons.lock, color: Colors.teal),
                            ),
                            obscureText: true,
                            validator: (value) {
                              if (value == null || value.isEmpty) {
                                return 'Please confirm your password';
                              }
                              if (value != passwordController.text) {
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
