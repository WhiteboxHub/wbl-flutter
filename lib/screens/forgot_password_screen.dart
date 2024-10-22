// import 'package:flutter/material.dart';
// import 'package:modal_progress_hud_nsn/modal_progress_hud_nsn.dart';
// import 'package:wbl_mobile_app/screens/login_screen.dart'; // Assuming you have a login screen.

// class ForgotPasswordScreen extends StatefulWidget {
//   const ForgotPasswordScreen({super.key});
//   static const routeName = '/forgot-password-screen';

//   @override
//   State<ForgotPasswordScreen> createState() => _ForgotPasswordScreenState();
// }

// class _ForgotPasswordScreenState extends State<ForgotPasswordScreen> {
//   final formKey = GlobalKey<FormState>();
//   TextEditingController emailController = TextEditingController();
//   bool showSpinner = false;

//   @override
//   void dispose() {
//     emailController.dispose();
//     formKey.currentState?.dispose();
//     super.dispose();
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
//                       'Forgot Password',
//                       style:
//                           Theme.of(context).textTheme.headlineLarge!.copyWith(
//                                    color: const Color.fromARGB(255, 107, 75, 253),
//                                 fontWeight: FontWeight.bold,
//                               ),
//                     ),
//                     const SizedBox(height: 24),
//                     Form(
//                       key: formKey,
//                       child: Column(
//                         crossAxisAlignment: CrossAxisAlignment.start,
//                         children: [                     
//                           const SizedBox(height: 32),
//                 TextField(
//                   controller: emailController,
//                   decoration: InputDecoration(
//                     labelText: 'Email Address *',
//                     border: OutlineInputBorder(
//                       borderRadius: BorderRadius.circular(30),
//                     ),
//                     filled: true,
//                     fillColor: Colors.white,
//                     prefixIcon: const Icon(Icons.email, color: Colors.teal),
//                   ),
//                 ),
                     
//                           const SizedBox(height: 24), 
//         Container(
//               width: double.infinity, // Full-width button
//               margin: const EdgeInsets.symmetric(horizontal: 20), // Margin outside the button
//               padding: const EdgeInsets.symmetric(horizontal: 16), // Padding inside the container
//               child: ElevatedButton(
//                 onPressed: () {
//                   // Handle login
//                 },
//                 style: ElevatedButton.styleFrom(
//                   backgroundColor: const Color.fromARGB(255, 95, 46, 209),
//                   shape: RoundedRectangleBorder(
//                     borderRadius: BorderRadius.circular(30),
//                   ),
//                   padding: const EdgeInsets.symmetric(vertical: 16), // Padding inside the button
//                 ),
//                 child: const Text('Forgot Password', style: TextStyle(color: Colors.white)),
//               ),
//             ),
//                           Center(
//                             child: TextButton( 
//                               onPressed: () {
//                                 Navigator.pushNamed(
//                                     context, LoginScreen.routeName);
//                               },
//                               style: TextButton.styleFrom(
//                                 backgroundColor: Colors.transparent,
//                               ),
//                               child: const Text(
//                                 'Go back to login',
//                                 style: TextStyle(
//                                   // color: Colors.blueGrey,
//                                   color: Colors.teal,
//                                   // decoration: TextDecoration.underline,
//                                 ),
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

class ForgotPasswordScreen extends StatefulWidget {
  const ForgotPasswordScreen({super.key});
  static const routeName = '/forgot-password-screen';

  @override
  State<ForgotPasswordScreen> createState() => _ForgotPasswordScreenState();
}

class _ForgotPasswordScreenState extends State<ForgotPasswordScreen> {
  final formKey = GlobalKey<FormState>();
  TextEditingController emailController = TextEditingController();
  bool showSpinner = false;

  @override
  void dispose() {
    emailController.dispose();
    super.dispose();
  }

  void _submit() async {
    if (formKey.currentState?.validate() ?? false) {
      setState(() {
        showSpinner = true;
      });
      // Implement your password reset logic here.
      await Future.delayed(Duration(seconds: 1)); // Simulate a network call
      setState(() {
        showSpinner = false;
      });
      Navigator.pushReplacementNamed(context, LoginScreen.routeName);
    }
  }

  // Email validation regex
  bool _isValidEmail(String email) {
    final regex = RegExp(r'^[^@]+@[^@]+\.[^@]+');
    return regex.hasMatch(email);
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
          resizeToAvoidBottomInset: true,
          body: SafeArea(
            child: Center(
              child: SingleChildScrollView(
                physics: const ClampingScrollPhysics(),
                padding: const EdgeInsets.all(32.0),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: [
                    Text(
                      'Forgot Password',
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
                          const SizedBox(height: 32),
                          TextFormField(
                            controller: emailController,
                            decoration: InputDecoration(
                              labelText: 'Email Address *',
                              border: OutlineInputBorder(
                                borderRadius: BorderRadius.circular(30),
                              ),
                              filled: true,
                              fillColor: Colors.white,
                              prefixIcon: const Icon(Icons.email, color: Colors.teal),
                            ),
                            validator: (value) {
                              if (value == null || value.isEmpty) {
                                return 'Please enter your email address';
                              }
                              if (!_isValidEmail(value)) {
                                return 'Please enter a valid email address';
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
                              child: const Text('Send Reset Link', style: TextStyle(color: Colors.white)),
                            ),
                          ),
                          Center(
                            child: TextButton(
                              onPressed: () {
                                Navigator.pushNamed(context, LoginScreen.routeName);
                              },
                              style: TextButton.styleFrom(
                                backgroundColor: Colors.transparent,
                              ),
                              child: const Text(
                                'Go back to login',
                                style: TextStyle(
                                  color: Colors.teal,
                                ),
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
