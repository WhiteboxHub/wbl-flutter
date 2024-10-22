// import 'package:flutter/material.dart';
// import 'package:wbl_mobile_app/screens/login_screen.dart';

// class RegisterScreen extends StatefulWidget {
//   static const routeName = '/register';

//   const RegisterScreen({super.key});

//   @override
//   State<RegisterScreen> createState() => _RegisterScreenState();
// }

// class _RegisterScreenState extends State<RegisterScreen> {
//   bool _acceptPrivacyPolicy = false;
//   bool isPasswordVisible = false; // Added for password visibility

//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//       backgroundColor: Colors.blueGrey[50],
//       body: Padding(
//         padding: const EdgeInsets.all(16.0),
//         child: SingleChildScrollView(
//           physics: const ClampingScrollPhysics(),
//           child: Column(
//             crossAxisAlignment: CrossAxisAlignment.center,
//             mainAxisAlignment: MainAxisAlignment.center, // Center the content
//             children: [
//               const SizedBox(height: 50),
//               CircleAvatar(
//                 radius: 50,
//                 child: Image.asset('assets/signup_image.png'), // Replace with your asset
//               ),
//               const Text(
//                 'Create your account',
//                 style: TextStyle(
//                   fontSize: 32,
//                   fontWeight: FontWeight.bold,
//                   color: Color.fromARGB(255, 126, 22, 245),                   
//                 ),
//               ),
//               const SizedBox(height: 8),
//               const Text(
//                 'Welcome. We exist to make learning easier.',
//                 style: TextStyle(
//                   fontSize: 18,
//                   color: Color.fromARGB(255, 107, 75, 253),
//                 ),
//               ),
//               const SizedBox(height: 32),
//               TextField(
//                 decoration: InputDecoration(
//                   labelText: 'Full Name *',
//                   border: OutlineInputBorder(
//                     borderRadius: BorderRadius.circular(30),
//                   ),
//                   filled: true,
//                   fillColor: Colors.white,
//                   prefixIcon: const Icon(Icons.person, color: Colors.teal),
//                 ),
//               ),
//               const SizedBox(height: 16),
//               Row(
//                 children: [
//                   Expanded(
//                     child: TextField(
//                       decoration: InputDecoration(
//                         labelText: 'Country Code *',
//                         border: OutlineInputBorder(
//                           borderRadius: BorderRadius.circular(30),
//                         ),
//                         filled: true,
//                         fillColor: Colors.white,
//                         prefixIcon: const Icon(Icons.flag, color: Colors.teal),
//                       ),
//                     ),
//                   ),
//                   const SizedBox(width: 16),
//                   Expanded(
//                     child: TextField(
//                       decoration: InputDecoration(
//                         labelText: 'Phone *',
//                         border: OutlineInputBorder(
//                           borderRadius: BorderRadius.circular(30),
//                         ),
//                         filled: true,
//                         fillColor: Colors.white,
//                         prefixIcon: const Icon(Icons.phone, color: Colors.teal),
//                       ),
//                     ),
//                   ),
//                 ],
//               ),
//               const SizedBox(height: 16),
//               TextField(
//                 decoration: InputDecoration(
//                   labelText: 'Email Address *',
//                   border: OutlineInputBorder(
//                     borderRadius: BorderRadius.circular(30),
//                   ),
//                   filled: true,
//                   fillColor: Colors.white,
//                   prefixIcon: const Icon(Icons.email, color: Colors.teal),
//                 ),
//               ),
//               const SizedBox(height: 16),
//               // Password Field with Visibility Toggle
//               TextField(
//                 decoration: InputDecoration(
//                   labelText: 'Password *',
//                   border: OutlineInputBorder(
//                     borderRadius: BorderRadius.circular(30),
//                   ),
//                   filled: true,
//                   fillColor: Colors.white,
//                   prefixIcon: const Icon(Icons.lock, color: Colors.teal),
//                   suffixIcon: IconButton(
//                     icon: Icon(
//                       isPasswordVisible
//                           ? Icons.visibility
//                           : Icons.visibility_off,
//                       color: Colors.teal,
//                     ),
//                     onPressed: () {
//                       setState(() {
//                         isPasswordVisible = !isPasswordVisible;
//                       });
//                     },
//                   ),
//                 ),
//                 obscureText: !isPasswordVisible, // Use the variable here
//               ),
//               const SizedBox(height: 16),
//               TextField(
//                 decoration: InputDecoration(
//                   labelText: 'Address *',
//                   border: OutlineInputBorder(
//                     borderRadius: BorderRadius.circular(30),
//                   ),
//                   filled: true,
//                   fillColor: Colors.white,
//                   prefixIcon: const Icon(Icons.home, color: Colors.teal),
//                 ),
//               ),
//               const SizedBox(height: 16),
//               TextField(
//                 decoration: InputDecoration(
//                   labelText: 'Zip *',
//                   border: OutlineInputBorder(
//                     borderRadius: BorderRadius.circular(30),
//                   ),
//                   filled: true,
//                   fillColor: Colors.white,
//                   prefixIcon: const Icon(Icons.pin_drop, color: Colors.teal),
//                 ),
//               ),
//               const SizedBox(height: 16),
//               Row(
//                 children: [
//                   Checkbox(
//                     value: _acceptPrivacyPolicy,
//                     onChanged: (bool? value) {
//                       setState(() {
//                         _acceptPrivacyPolicy = value ?? false;
//                       });
//                     },
//                   ),
//                   Expanded(
//                     child: Text(
//                       'I accept the Privacy Policy.',
//                       style: TextStyle(
//                         fontSize: 14,
//                         color: Colors.teal[600],
//                       ),
//                     ),
//                   ),
//                 ],
//               ),
//               const SizedBox(height: 16),
//               Container(
//                 width: double.infinity,
//                 margin: const EdgeInsets.symmetric(horizontal: 20),
//                 padding: const EdgeInsets.symmetric(horizontal: 16),
//                 child: ElevatedButton(
//                   onPressed: () {
//                     // Handle registration
//                   },
//                   style: ElevatedButton.styleFrom(
//                     backgroundColor: const Color.fromARGB(255, 95, 46, 209),
//                     shape: RoundedRectangleBorder(
//                       borderRadius: BorderRadius.circular(30),
//                     ),
//                     padding: const EdgeInsets.symmetric(vertical: 16),
//                   ),
//                   child: const Text('Register', style: TextStyle(color: Colors.white)),
//                 ),
//               ),
//               const SizedBox(height: 16),
//               Center(
//                 child: Row(
//                   mainAxisAlignment: MainAxisAlignment.center,
//                   children: [
//                     const Text("Already have an account?"),
//                     TextButton(
//                       onPressed: () {
//                         Navigator.pushNamed(context, LoginScreen.routeName);
//                       },
//                       style: TextButton.styleFrom(
//                         backgroundColor: Colors.transparent,
//                       ),
//                       child: const Text('Login', style: TextStyle(color: Colors.teal)),
//                     ),
//                   ],
//                 ),
//               ),
//             ],
//           ),
//         ),
//       ),
//     );
//   }
// }



// import 'package:flutter/material.dart';
// import 'package:wbl_mobile_app/screens/login_screen.dart';

// class RegisterScreen extends StatefulWidget {
//   static const routeName = '/register';

//   const RegisterScreen({super.key});

//   @override
//   State<RegisterScreen> createState() => _RegisterScreenState();
// }

// class _RegisterScreenState extends State<RegisterScreen> {
//   final _formKey = GlobalKey<FormState>();
//   bool _acceptPrivacyPolicy = false;
//   bool isPasswordVisible = false; // Added for password visibility

//   // Text editing controllers
//   final TextEditingController nameController = TextEditingController();
//   final TextEditingController countryCodeController = TextEditingController();
//   final TextEditingController phoneController = TextEditingController();
//   final TextEditingController emailController = TextEditingController();
//   final TextEditingController passwordController = TextEditingController();
//   final TextEditingController addressController = TextEditingController();
//   final TextEditingController zipController = TextEditingController();

//   @override
//   void dispose() {
//     // Dispose controllers
//     nameController.dispose();
//     countryCodeController.dispose();
//     phoneController.dispose();
//     emailController.dispose();
//     passwordController.dispose();
//     addressController.dispose();
//     zipController.dispose();
//     super.dispose();
//   }

//   void _submit() {
//     if (_formKey.currentState?.validate() ?? false) {
//       // Perform registration logic here
//       // For example, send data to your API
//       ScaffoldMessenger.of(context).showSnackBar(
//         SnackBar(content: Text('Registering...')),
//       );
//     }
//   }

//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//       backgroundColor: Colors.blueGrey[50],
//       body: Padding(
//         padding: const EdgeInsets.all(16.0),
//         child: SingleChildScrollView(
//           physics: const ClampingScrollPhysics(),
//           child: Form(
//             key: _formKey,
//             child: Column(
//               crossAxisAlignment: CrossAxisAlignment.center,
//               mainAxisAlignment: MainAxisAlignment.center, // Center the content
//               children: [
//                 const SizedBox(height: 50),
//                 CircleAvatar(
//                   radius: 50,
//                   child: Image.asset('assets/signup_image.png'), // Replace with your asset
//                 ),
//                 const Text(
//                   'Create your account',
//                   style: TextStyle(
//                     fontSize: 32,
//                     fontWeight: FontWeight.bold,
//                     color: Color.fromARGB(255, 126, 22, 245),
//                   ),
//                 ),
//                 const SizedBox(height: 8),
//                 const Text(
//                   'Welcome. We exist to make learning easier.',
//                   style: TextStyle(
//                     fontSize: 18,
//                     color: Color.fromARGB(255, 107, 75, 253),
//                   ),
//                 ),
//                 const SizedBox(height: 32),
//                 // Full Name Field
//                 TextFormField(
//                   controller: nameController,
//                   decoration: InputDecoration(
//                     labelText: 'Full Name *',
//                     border: OutlineInputBorder(
//                       borderRadius: BorderRadius.circular(30),
//                     ),
//                     filled: true,
//                     fillColor: Colors.white,
//                     prefixIcon: const Icon(Icons.person, color: Colors.teal),
//                   ),
//                   validator: (value) {
//                     if (value == null || value.isEmpty) {
//                       return 'Please enter your full name';
//                     }
//                     return null;
//                   },
//                 ),
//                 const SizedBox(height: 16),
//                 Row(
//                   children: [
//                     Expanded(
//                       child: TextFormField(
//                         controller: countryCodeController,
//                         decoration: InputDecoration(
//                           labelText: 'Country Code *',
//                           border: OutlineInputBorder(
//                             borderRadius: BorderRadius.circular(30),
//                           ),
//                           filled: true,
//                           fillColor: Colors.white,
//                           prefixIcon: const Icon(Icons.flag, color: Colors.teal),
//                         ),
//                         validator: (value) {
//                           if (value == null || value.isEmpty) {
//                             return 'Please enter your country code';
//                           }
//                           return null;
//                         },
//                       ),
//                     ),
//                     const SizedBox(width: 16),
//                     Expanded(
//                       child: TextFormField(
//                         controller: phoneController,
//                         decoration: InputDecoration(
//                           labelText: 'Phone *',
//                           border: OutlineInputBorder(
//                             borderRadius: BorderRadius.circular(30),
//                           ),
//                           filled: true,
//                           fillColor: Colors.white,
//                           prefixIcon: const Icon(Icons.phone, color: Colors.teal),
//                         ),
//                         validator: (value) {
//                           if (value == null || value.isEmpty) {
//                             return 'Please enter your phone number';
//                           }
//                           return null;
//                         },
//                       ),
//                     ),
//                   ],
//                 ),
//                 const SizedBox(height: 16),
//                 // Email Field
//                 TextFormField(
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
//                   validator: (value) {
//                     if (value == null || value.isEmpty) {
//                       return 'Please enter your email address';
//                     }
//                     final regex = RegExp(r'^[^@]+@[^@]+\.[^@]+');
//                     if (!regex.hasMatch(value)) {
//                       return 'Please enter a valid email address';
//                     }
//                     return null;
//                   },
//                 ),
//                 const SizedBox(height: 16),
//                 // Password Field with Visibility Toggle
//                 TextFormField(
//                   controller: passwordController,
//                   decoration: InputDecoration(
//                     labelText: 'Password *',
//                     border: OutlineInputBorder(
//                       borderRadius: BorderRadius.circular(30),
//                     ),
//                     filled: true,
//                     fillColor: Colors.white,
//                     prefixIcon: const Icon(Icons.lock, color: Colors.teal),
//                     suffixIcon: IconButton(
//                       icon: Icon(
//                         isPasswordVisible ? Icons.visibility : Icons.visibility_off,
//                         color: Colors.teal,
//                       ),
//                       onPressed: () {
//                         setState(() {
//                           isPasswordVisible = !isPasswordVisible;
//                         });
//                       },
//                     ),
//                   ),
//                   obscureText: !isPasswordVisible, // Use the variable here
//                   validator: (value) {
//                     if (value == null || value.isEmpty) {
//                       return 'Please enter a password';
//                     }
//                     if (value.length < 6) {
//                       return 'Password must be at least 6 characters';
//                     }
//                     return null;
//                   },
//                 ),
//                 const SizedBox(height: 16),
//                 // Address Field
//                 TextFormField(
//                   controller: addressController,
//                   decoration: InputDecoration(
//                     labelText: 'Address *',
//                     border: OutlineInputBorder(
//                       borderRadius: BorderRadius.circular(30),
//                     ),
//                     filled: true,
//                     fillColor: Colors.white,
//                     prefixIcon: const Icon(Icons.home, color: Colors.teal),
//                   ),
//                   validator: (value) {
//                     if (value == null || value.isEmpty) {
//                       return 'Please enter your address';
//                     }
//                     return null;
//                   },
//                 ),
//                 const SizedBox(height: 16),
//                 // Zip Field
//                 TextFormField(
//                   controller: zipController,
//                   decoration: InputDecoration(
//                     labelText: 'Zip *',
//                     border: OutlineInputBorder(
//                       borderRadius: BorderRadius.circular(30),
//                     ),
//                     filled: true,
//                     fillColor: Colors.white,
//                     prefixIcon: const Icon(Icons.pin_drop, color: Colors.teal),
//                   ),
//                   validator: (value) {
//                     if (value == null || value.isEmpty) {
//                       return 'Please enter your zip code';
//                     }
//                     return null;
//                   },
//                 ),
//                 const SizedBox(height: 16),
//                 // Privacy Policy Checkbox
//                 Row(
//                   children: [
//                     Checkbox(
//                       value: _acceptPrivacyPolicy,
//                       onChanged: (bool? value) {
//                         setState(() {
//                           _acceptPrivacyPolicy = value ?? false;
//                         });
//                       },
//                     ),
//                     Expanded(
//                       child: Text(
//                         'I accept the Privacy Policy.',
//                         style: TextStyle(
//                           fontSize: 14,
//                           color: Colors.teal[600],
//                         ),
//                       ),
//                     ),
//                   ],
//                 ),
//                 const SizedBox(height: 16),
//                 Container(
//                   width: double.infinity,
//                   margin: const EdgeInsets.symmetric(horizontal: 20),
//                   padding: const EdgeInsets.symmetric(horizontal: 16),
//                   child: ElevatedButton(
//                     onPressed: _acceptPrivacyPolicy ? _submit : null,
//                     style: ElevatedButton.styleFrom(
//                       backgroundColor: const Color.fromARGB(255, 95, 46, 209),
//                       shape: RoundedRectangleBorder(
//                         borderRadius: BorderRadius.circular(30),
//                       ),
//                       padding: const EdgeInsets.symmetric(vertical: 16),
//                     ),
//                     child: const Text('Register', style: TextStyle(color: Colors.white)),
//                   ),
//                 ),
//                 const SizedBox(height: 16),
//                 Center(
//                   child: Row(
//                     mainAxisAlignment: MainAxisAlignment.center,
//                     children: [
//                       const Text("Already have an account?"),
//                       TextButton(
//                         onPressed: () {
//                           Navigator.pushNamed(context, LoginScreen.routeName);
//                         },
//                         style: TextButton.styleFrom(
//                           backgroundColor: Colors.transparent,
//                         ),
//                         child: const Text('Login', style: TextStyle(color: Colors.teal)),
//                       ),
//                     ],
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
import 'package:wbl_mobile_app/screens/login_screen.dart';
import 'package:http/http.dart' as http;
import 'dart:convert';

class RegisterScreen extends StatefulWidget {
  static const routeName = '/register';

  const RegisterScreen({super.key});

  @override
  State<RegisterScreen> createState() => _RegisterScreenState();
}

class _RegisterScreenState extends State<RegisterScreen> {
  final _formKey = GlobalKey<FormState>();
  bool _acceptPrivacyPolicy = false;
  bool isPasswordVisible = false; // Added for password visibility

  // Text editing controllers
  final TextEditingController nameController = TextEditingController();
  final TextEditingController countryCodeController = TextEditingController();
  final TextEditingController phoneController = TextEditingController();
  final TextEditingController emailController = TextEditingController();
  final TextEditingController passwordController = TextEditingController();
  final TextEditingController addressController = TextEditingController();
  final TextEditingController zipController = TextEditingController();

  @override
  void dispose() {
    // Dispose controllers
    nameController.dispose();
    countryCodeController.dispose();
    phoneController.dispose();
    emailController.dispose();
    passwordController.dispose();
    addressController.dispose();
    zipController.dispose();
    super.dispose();
  }

  static const apiUrl = "https://whitebox-learning.com/api";

  Future<void> _submit() async {
    if (_formKey.currentState?.validate() ?? false) {
      final response = await http.post(
        Uri.parse('${apiUrl}/signup'), // Update with your API URL
        headers: {
          'Content-Type': 'application/json',
        },
        body: jsonEncode({
          'uname': emailController.text,
          'passwd': passwordController.text,
          'fullname': nameController.text,
          'phone': phoneController.text,
          'address': addressController.text,
          'Zip': zipController.text,
          'registereddate': DateTime.now().toIso8601String(),
          'level3date': DateTime.now().toIso8601String(),
        }),
      );

      final data = jsonDecode(response.body);

      if (response.statusCode == 200) {
        // Handle successful registration
        ScaffoldMessenger.of(context).showSnackBar(
          SnackBar(content: Text(data['message'] ?? "Registration successful!")),
        );
        // Optionally navigate to another screen
      } else {
        // Handle registration error
        ScaffoldMessenger.of(context).showSnackBar(
          SnackBar(content: Text(data['detail'] ?? "Registration failed")),
        );
      }
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.blueGrey[50],
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: SingleChildScrollView(
          physics: const ClampingScrollPhysics(),
          child: Form(
            key: _formKey,
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.center,
              mainAxisAlignment: MainAxisAlignment.center, // Center the content
              children: [
                const SizedBox(height: 50),
                CircleAvatar(
                  radius: 50,
                  child: Image.asset('assets/signup_image.png'), // Replace with your asset
                ),
                const Text(
                  'Create your account',
                  style: TextStyle(
                    fontSize: 32,
                    fontWeight: FontWeight.bold,
                    color: Color.fromARGB(255, 126, 22, 245),
                  ),
                ),
                const SizedBox(height: 8),
                const Text(
                  'Welcome. We exist to make learning easier.',
                  style: TextStyle(
                    fontSize: 18,
                    color: Color.fromARGB(255, 107, 75, 253),
                  ),
                ),
                const SizedBox(height: 32),
                // Full Name Field
                TextFormField(
                  controller: nameController,
                  decoration: InputDecoration(
                    labelText: 'Full Name *',
                    border: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(30),
                    ),
                    filled: true,
                    fillColor: Colors.white,
                    prefixIcon: const Icon(Icons.person, color: Colors.teal),
                  ),
                  validator: (value) {
                    if (value == null || value.isEmpty) {
                      return 'Please enter your full name';
                    }
                    return null;
                  },
                ),
                const SizedBox(height: 16),
                Row(
                  children: [
                    Expanded(
                      child: TextFormField(
                        controller: countryCodeController,
                        decoration: InputDecoration(
                          labelText: 'Country Code *',
                          border: OutlineInputBorder(
                            borderRadius: BorderRadius.circular(30),
                          ),
                          filled: true,
                          fillColor: Colors.white,
                          prefixIcon: const Icon(Icons.flag, color: Colors.teal),
                        ),
                        validator: (value) {
                          if (value == null || value.isEmpty) {
                            return 'Please enter your country code';
                          }
                          return null;
                        },
                      ),
                    ),
                    const SizedBox(width: 16),
                    Expanded(
                      child: TextFormField(
                        controller: phoneController,
                        decoration: InputDecoration(
                          labelText: 'Phone *',
                          border: OutlineInputBorder(
                            borderRadius: BorderRadius.circular(30),
                          ),
                          filled: true,
                          fillColor: Colors.white,
                          prefixIcon: const Icon(Icons.phone, color: Colors.teal),
                        ),
                        validator: (value) {
                          if (value == null || value.isEmpty) {
                            return 'Please enter your phone number';
                          }
                          return null;
                        },
                      ),
                    ),
                  ],
                ),
                const SizedBox(height: 16),
                // Email Field
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
                    final regex = RegExp(r'^[^@]+@[^@]+\.[^@]+');
                    if (!regex.hasMatch(value)) {
                      return 'Please enter a valid email address';
                    }
                    return null;
                  },
                ),
                const SizedBox(height: 16),
                // Password Field with Visibility Toggle
                TextFormField(
                  controller: passwordController,
                  decoration: InputDecoration(
                    labelText: 'Password *',
                    border: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(30),
                    ),
                    filled: true,
                    fillColor: Colors.white,
                    prefixIcon: const Icon(Icons.lock, color: Colors.teal),
                    suffixIcon: IconButton(
                      icon: Icon(
                        isPasswordVisible ? Icons.visibility : Icons.visibility_off,
                        color: Colors.teal,
                      ),
                      onPressed: () {
                        setState(() {
                          isPasswordVisible = !isPasswordVisible;
                        });
                      },
                    ),
                  ),
                  obscureText: !isPasswordVisible, // Use the variable here
                  validator: (value) {
                    if (value == null || value.isEmpty) {
                      return 'Please enter a password';
                    }
                    if (value.length < 6) {
                      return 'Password must be at least 6 characters';
                    }
                    return null;
                  },
                ),
                const SizedBox(height: 16),
                // Address Field
                TextFormField(
                  controller: addressController,
                  decoration: InputDecoration(
                    labelText: 'Address *',
                    border: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(30),
                    ),
                    filled: true,
                    fillColor: Colors.white,
                    prefixIcon: const Icon(Icons.home, color: Colors.teal),
                  ),
                  validator: (value) {
                    if (value == null || value.isEmpty) {
                      return 'Please enter your address';
                    }
                    return null;
                  },
                ),
                const SizedBox(height: 16),
                // Zip Field
                TextFormField(
                  controller: zipController,
                  decoration: InputDecoration(
                    labelText: 'Zip *',
                    border: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(30),
                    ),
                    filled: true,
                    fillColor: Colors.white,
                    prefixIcon: const Icon(Icons.pin_drop, color: Colors.teal),
                  ),
                  validator: (value) {
                    if (value == null || value.isEmpty) {
                      return 'Please enter your zip code';
                    }
                    return null;
                  },
                ),
                const SizedBox(height: 16),
                // Privacy Policy Checkbox
                Row(
                  children: [
                    Checkbox(
                      value: _acceptPrivacyPolicy,
                      onChanged: (bool? value) {
                        setState(() {
                          _acceptPrivacyPolicy = value ?? false;
                        });
                      },
                    ),
                    Expanded(
                      child: Text(
                        'I accept the Privacy Policy.',
                        style: TextStyle(
                          fontSize: 14,
                          color: Colors.teal[600],
                        ),
                      ),
                    ),
                  ],
                ),
                const SizedBox(height: 16),
                Container(
                  width: double.infinity,
                  margin: const EdgeInsets.symmetric(horizontal: 20),
                  padding: const EdgeInsets.symmetric(horizontal: 16),
                  child: ElevatedButton(
                    onPressed: _acceptPrivacyPolicy ? _submit : null,
                    style: ElevatedButton.styleFrom(
                      backgroundColor: const Color.fromARGB(255, 95, 46, 209),
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(30),
                      ),
                      padding: const EdgeInsets.symmetric(vertical: 16),
                    ),
                    child: const Text('Register', style: TextStyle(color: Colors.white)),
                  ),
                ),
                const SizedBox(height: 16),
                Center(
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      const Text("Already have an account?"),
                      TextButton(
                        onPressed: () {
                          Navigator.pushNamed(context, LoginScreen.routeName);
                        },
                        style: TextButton.styleFrom(
                          backgroundColor: Colors.transparent,
                        ),
                        child: const Text('Login', style: TextStyle(color: Colors.teal)),
                      ),
                    ],
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
