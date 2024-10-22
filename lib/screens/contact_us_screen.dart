
// import 'package:flutter/material.dart';
// import 'package:http/http.dart' as http;
// import 'dart:convert';

// class ContactUsScreen extends StatefulWidget {
//   static const routeName = '/contact-us';

//   const ContactUsScreen({super.key});

//   @override
//   State<ContactUsScreen> createState() => _ContactUsScreenState();
// }

// class _ContactUsScreenState extends State<ContactUsScreen> {
//   static const String apiUrl = "https://whitebox-learning.com/api/contact"; // Your API endpoint
//   final formKey = GlobalKey<FormState>();
//   final TextEditingController nameController = TextEditingController();
//   final TextEditingController emailController = TextEditingController();
//   final TextEditingController phoneController = TextEditingController();
//   final TextEditingController messageController = TextEditingController();

//   void _resetForm() {
//     formKey.currentState?.reset();
//     nameController.clear();
//     emailController.clear();
//     phoneController.clear();
//     messageController.clear();
//   }

//   Future<void> _submitForm() async {
//     if (formKey.currentState?.validate() ?? false) {
//       // Prepare the data
//       final data = {
//         'name': nameController.text,
//         'email': emailController.text,
//         'phone': phoneController.text,
//         'message': messageController.text,
//       };

//       try {
//         // Send the data to the API
//         final response = await http.post(
//           Uri.parse(apiUrl),
//           headers: {'Content-Type': 'application/json'},
//           body: json.encode(data),
//         );

//         if (response.statusCode == 200) {
//           // Handle success
//           ScaffoldMessenger.of(context).showSnackBar(
//             const SnackBar(content: Text("Message Sent Successfully!")),
//           );
//           _resetForm();
//         } else {
//           // Handle server error
//           ScaffoldMessenger.of(context).showSnackBar(
//             const SnackBar(content: Text("Failed to send message. Please try again.")),
//           );
//         }
//       } catch (error) {
//         // Handle error
//         ScaffoldMessenger.of(context).showSnackBar(
//           const SnackBar(content: Text("An error occurred. Please try again later.")),
//         );
//       }
//     }
//   }

//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//       body: SafeArea(
//         child: Padding(
//           padding: const EdgeInsets.all(16.0),
//           child: SingleChildScrollView(
//             child: Column(
//               crossAxisAlignment: CrossAxisAlignment.start,
//               children: [
//                 // Back button
//                 Row(
//                   children: [
//                     IconButton(
//                       icon: const Icon(Icons.arrow_back, color: Colors.black),
//                       onPressed: () {
//                         Navigator.pop(context); // Go back to the previous screen
//                       },
//                     ),
//                     const SizedBox(width: 10),
//                   ],
//                 ),

//                 // Contact Us Title
//                 Padding(
//                   padding: const EdgeInsets.only(left: 10.0),
//                   child: Text(
//                     "Contact Us",
//                     style: Theme.of(context).textTheme.headlineLarge!.copyWith(
//                           color: const Color.fromARGB(255, 107, 75, 253),
//                           fontWeight: FontWeight.bold,
//                         ),
//                   ),
//                 ),
//                 const SizedBox(height: 20),

//                 // Contact Form
//                 Form(
//                   key: formKey,
//                   child: Container(
//                     padding: const EdgeInsets.all(16.0),
//                     decoration: BoxDecoration(
//                       color: Colors.white,
//                       borderRadius: BorderRadius.circular(16.0),
//                       boxShadow: const [
//                         BoxShadow(
//                           color: Colors.black12,
//                           blurRadius: 8.0,
//                           offset: Offset(0, 2),
//                         ),
//                       ],
//                     ),
//                     child: Column(
//                       crossAxisAlignment: CrossAxisAlignment.start,
//                       children: [
//                         const Center(
//                           child: Column(
//                             children: [
//                               Text(
//                                 "Get in touch!",
//                                 style: TextStyle(
//                                   fontSize: 22,
//                                   fontWeight: FontWeight.bold,
//                                   color: Colors.teal,
//                                 ),
//                               ),
//                               SizedBox(height: 5),
//                               Text("We'd love to hear from you."),
//                             ],
//                           ),
//                         ),
//                         const SizedBox(height: 20),

//                         // Name Field
//                         TextFormField(
//                           controller: nameController,
//                           decoration: InputDecoration(
//                             labelText: "Name",
//                             hintText: "Enter Your Name",
//                             border: OutlineInputBorder(
//                               borderRadius: BorderRadius.circular(30),
//                             ),
//                             filled: true,
//                             fillColor: Colors.white,
//                             prefixIcon: const Icon(Icons.person),
//                           ),
//                           validator: (value) {
//                             if (value == null || value.isEmpty) {
//                               return 'Please enter your name';
//                             }
//                             return null;
//                           },
//                         ),
//                         const SizedBox(height: 16),

//                         // Email Field
//                         TextFormField(
//                           controller: emailController,
//                           decoration: InputDecoration(
//                             labelText: "Email",
//                             hintText: "Enter Your Email",
//                             border: OutlineInputBorder(
//                               borderRadius: BorderRadius.circular(30),
//                             ),
//                             filled: true,
//                             fillColor: Colors.white,
//                             prefixIcon: const Icon(Icons.email),
//                           ),
//                           validator: (value) {
//                             if (value == null || value.isEmpty) {
//                               return 'Please enter your email';
//                             }
//                             return null;
//                           },
//                         ),
//                         const SizedBox(height: 16),

//                         // Phone Field
//                         TextFormField(
//                           controller: phoneController,
//                           decoration: InputDecoration(
//                             labelText: "Phone",
//                             hintText: "Enter Your Phone",
//                             border: OutlineInputBorder(
//                               borderRadius: BorderRadius.circular(30),
//                             ),
//                             filled: true,
//                             fillColor: Colors.white,
//                             prefixIcon: const Icon(Icons.phone),
//                           ),
//                           validator: (value) {
//                             if (value == null || value.isEmpty) {
//                               return 'Please enter your phone number';
//                             }
//                             return null;
//                           },
//                         ),
//                         const SizedBox(height: 16),

//                         // Message Field
//                         TextFormField(
//                           controller: messageController,
//                           maxLines: 4,
//                           decoration: InputDecoration(
//                             labelText: "Message",
//                             hintText: "Enter your message",
//                             border: OutlineInputBorder(
//                               borderRadius: BorderRadius.circular(30),
//                             ),
//                             filled: true,
//                             fillColor: Colors.white,
//                           ),
//                           validator: (value) {
//                             if (value == null || value.isEmpty) {
//                               return 'Please enter a message';
//                             }
//                             return null;
//                           },
//                         ),
//                         const SizedBox(height: 24),

//                         // Buttons (Send and Reset)
//                         Row(
//                           mainAxisAlignment: MainAxisAlignment.center,
//                           children: [
//                             // Send Button
//                             Expanded(
//                               child: ElevatedButton(
//                                 onPressed: _submitForm,
//                                 style: ElevatedButton.styleFrom(
//                                   backgroundColor: const Color(0xFF5F2ED1),
//                                   shape: RoundedRectangleBorder(
//                                     borderRadius: BorderRadius.circular(30),
//                                   ),
//                                   padding: const EdgeInsets.symmetric(vertical: 16),
//                                 ),
//                                 child: const Text('Send', style: TextStyle(color: Colors.white)),
//                               ),
//                             ),
//                             const SizedBox(width: 10),
//                             // Reset Button
//                             Expanded(
//                               child: ElevatedButton(
//                                 onPressed: _resetForm,
//                                 style: ElevatedButton.styleFrom(
//                                   backgroundColor: Colors.teal,
//                                   shape: RoundedRectangleBorder(
//                                     borderRadius: BorderRadius.circular(30),
//                                   ),
//                                   padding: const EdgeInsets.symmetric(vertical: 16),
//                                 ),
//                                 child: const Text('Reset', style: TextStyle(color: Colors.white)),
//                               ),
//                             ),
//                           ],
//                         ),
//                       ],
//                     ),
//                   ),
//                 ),
//                 const SizedBox(height: 30),

//                 // Contact Details Box
//                 Center(
//                   child: Container(
//                     padding: const EdgeInsets.all(16.0),
//                     decoration: BoxDecoration(
//                       color: const Color(0xFFF1F1F1),
//                       borderRadius: BorderRadius.circular(16.0),
//                       boxShadow: const [
//                         BoxShadow(
//                           color: Colors.black12,
//                           blurRadius: 8.0,
//                           offset: Offset(0, 2),
//                         ),
//                       ],
//                     ),
//                     child: const Column(
//                       crossAxisAlignment: CrossAxisAlignment.start,
//                       children: [
//                         Text(
//                           "Contact Details",
//                           style: TextStyle(
//                             fontSize: 18,
//                             color: Color.fromARGB(255, 112, 56, 243),
//                             fontWeight: FontWeight.bold,
//                           ),
//                         ),
//                         SizedBox(height: 10),
//                         Text("Fremont Office:"),
//                         Text("6500 Dublin Blvd #214, Dublin, CA 94568"),
//                         SizedBox(height: 10),
//                         Text("All Enquiries"),
//                         Text("Tel: +1 925-557-1053"),
//                         SizedBox(height: 10),
//                         Text("Email: info@whitebox-learning.com"),
//                       ],
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
import 'package:http/http.dart' as http;
import 'dart:convert';

class ContactUsScreen extends StatefulWidget {
  static const routeName = '/contact-us';

  const ContactUsScreen({super.key});

  @override
  State<ContactUsScreen> createState() => _ContactUsScreenState();
}

class _ContactUsScreenState extends State<ContactUsScreen> {
  static const String apiUrl = "https://whitebox-learning.com/api/contact"; // Your API endpoint
  final formKey = GlobalKey<FormState>();
  final TextEditingController nameController = TextEditingController();
  final TextEditingController emailController = TextEditingController();
  final TextEditingController phoneController = TextEditingController();
  final TextEditingController messageController = TextEditingController();

  void _resetForm() {
    formKey.currentState?.reset();
    nameController.clear();
    emailController.clear();
    phoneController.clear();
    messageController.clear();
  }

  Future<void> _submitForm() async {
    if (formKey.currentState?.validate() ?? false) {
      // Prepare the data
      final data = {
        'name': nameController.text,
        'email': emailController.text,
        'phone': phoneController.text,
        'message': messageController.text,
      };

      try {
        // Send the data to the API
        final response = await http.post(
          Uri.parse(apiUrl),
          headers: {'Content-Type': 'application/json'},
          body: json.encode(data),
        );

        if (response.statusCode == 200) {
          // Handle success
          ScaffoldMessenger.of(context).showSnackBar(
            const SnackBar(content: Text("Message Sent Successfully!")),
          );
          _resetForm();
        } else {
          // Handle server error
          ScaffoldMessenger.of(context).showSnackBar(
            const SnackBar(content: Text("Failed to send message. Please try again.")),
          );
        }
      } catch (error) {
        // Handle error
        ScaffoldMessenger.of(context).showSnackBar(
          const SnackBar(content: Text("An error occurred. Please try again later.")),
        );
      }
    }
  }

  // Email validation regex
  bool _isValidEmail(String email) {
    final regex = RegExp(r'^[^@]+@[^@]+\.[^@]+');
    return regex.hasMatch(email);
  }

  // Phone number validation
  bool _isValidPhone(String phone) {
    final numericRegex = RegExp(r'^\d{10,}$'); // At least 10 digits
    return numericRegex.hasMatch(phone);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Padding(
          padding: const EdgeInsets.all(16.0),
          child: SingleChildScrollView(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                // Back button
                Row(
                  children: [
                    IconButton(
                      icon: const Icon(Icons.arrow_back, color: Colors.black),
                      onPressed: () {
                        Navigator.pop(context); // Go back to the previous screen
                      },
                    ),
                    const SizedBox(width: 10),
                  ],
                ),

                // Contact Us Title
                Padding(
                  padding: const EdgeInsets.only(left: 10.0),
                  child: Text(
                    "Contact Us",
                    style: Theme.of(context).textTheme.headlineLarge!.copyWith(
                          color: const Color.fromARGB(255, 107, 75, 253),
                          fontWeight: FontWeight.bold,
                        ),
                  ),
                ),
                const SizedBox(height: 20),

                // Contact Form
                Form(
                  key: formKey,
                  child: Container(
                    padding: const EdgeInsets.all(16.0),
                    decoration: BoxDecoration(
                      color: Colors.white,
                      borderRadius: BorderRadius.circular(16.0),
                      boxShadow: const [
                        BoxShadow(
                          color: Colors.black12,
                          blurRadius: 8.0,
                          offset: Offset(0, 2),
                        ),
                      ],
                    ),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        const Center(
                          child: Column(
                            children: [
                              Text(
                                "Get in touch!",
                                style: TextStyle(
                                  fontSize: 22,
                                  fontWeight: FontWeight.bold,
                                  color: Colors.teal,
                                ),
                              ),
                              SizedBox(height: 5),
                              Text("We'd love to hear from you."),
                            ],
                          ),
                        ),
                        const SizedBox(height: 20),

                        // Name Field
                        TextFormField(
                          controller: nameController,
                          decoration: InputDecoration(
                            labelText: "Name",
                            hintText: "Enter Your Name",
                            border: OutlineInputBorder(
                              borderRadius: BorderRadius.circular(30),
                            ),
                            filled: true,
                            fillColor: Colors.white,
                            prefixIcon: const Icon(Icons.person),
                          ),
                          validator: (value) {
                            if (value == null || value.isEmpty) {
                              return 'Please enter your name';
                            }
                            return null;
                          },
                        ),
                        const SizedBox(height: 16),

                        // Email Field
                        TextFormField(
                          controller: emailController,
                          decoration: InputDecoration(
                            labelText: "Email",
                            hintText: "Enter Your Email",
                            border: OutlineInputBorder(
                              borderRadius: BorderRadius.circular(30),
                            ),
                            filled: true,
                            fillColor: Colors.white,
                            prefixIcon: const Icon(Icons.email),
                          ),
                          validator: (value) {
                            if (value == null || value.isEmpty) {
                              return 'Please enter your email';
                            } else if (!_isValidEmail(value)) {
                              return 'Please enter a valid email';
                            }
                            return null;
                          },
                        ),
                        const SizedBox(height: 16),

                        // Phone Field
                        TextFormField(
                          controller: phoneController,
                          decoration: InputDecoration(
                            labelText: "Phone",
                            hintText: "Enter Your Phone",
                            border: OutlineInputBorder(
                              borderRadius: BorderRadius.circular(30),
                            ),
                            filled: true,
                            fillColor: Colors.white,
                            prefixIcon: const Icon(Icons.phone),
                          ),
                          validator: (value) {
                            if (value == null || value.isEmpty) {
                              return 'Please enter your phone number';
                            } else if (!_isValidPhone(value)) {
                              return 'Phone number must be at least 10 digits';
                            }
                            return null;
                          },
                        ),
                        const SizedBox(height: 16),

                        // Message Field
                        TextFormField(
                          controller: messageController,
                          maxLines: 4,
                          decoration: InputDecoration(
                            labelText: "Message",
                            hintText: "Enter your message",
                            border: OutlineInputBorder(
                              borderRadius: BorderRadius.circular(30),
                            ),
                            filled: true,
                            fillColor: Colors.white,
                          ),
                          validator: (value) {
                            if (value == null || value.isEmpty) {
                              return 'Please enter a message';
                            }
                            return null;
                          },
                        ),
                        const SizedBox(height: 24),

                        // Buttons (Send and Reset)
                        Row(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            // Send Button
                            Expanded(
                              child: ElevatedButton(
                                onPressed: _submitForm,
                                style: ElevatedButton.styleFrom(
                                  backgroundColor: const Color(0xFF5F2ED1),
                                  shape: RoundedRectangleBorder(
                                    borderRadius: BorderRadius.circular(30),
                                  ),
                                  padding: const EdgeInsets.symmetric(vertical: 16),
                                ),
                                child: const Text('Send', style: TextStyle(color: Colors.white)),
                              ),
                            ),
                            const SizedBox(width: 10),
                            // Reset Button
                            Expanded(
                              child: ElevatedButton(
                                onPressed: _resetForm,
                                style: ElevatedButton.styleFrom(
                                  backgroundColor: Colors.teal,
                                  shape: RoundedRectangleBorder(
                                    borderRadius: BorderRadius.circular(30),
                                  ),
                                  padding: const EdgeInsets.symmetric(vertical: 16),
                                ),
                                child: const Text('Reset', style: TextStyle(color: Colors.white)),
                              ),
                            ),
                          ],
                        ),
                      ],
                    ),
                  ),
                ),
                const SizedBox(height: 30),

                // Contact Details Box
                Center(
                  child: Container(
                    padding: const EdgeInsets.all(16.0),
                    decoration: BoxDecoration(
                      color: const Color(0xFFF1F1F1),
                      borderRadius: BorderRadius.circular(16.0),
                      boxShadow: const [
                        BoxShadow(
                          color: Colors.black12,
                          blurRadius: 8.0,
                          offset: Offset(0, 2),
                        ),
                      ],
                    ),
                    child: const Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(
                          "Contact Details",
                          style: TextStyle(
                            fontSize: 18,
                            color: Color.fromARGB(255, 112, 56, 243),
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                        SizedBox(height: 10),
                        Text("Fremont Office:"),
                        Text("6500 Dublin Blvd #214, Dublin, CA 94568"),
                        SizedBox(height: 10),
                        Text("All Enquiries"),
                        Text("Tel: +1 925-557-1053"),
                        SizedBox(height: 10),
                        Text("Email: info@whitebox-learning.com"),
                      ],
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
