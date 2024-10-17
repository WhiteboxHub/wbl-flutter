import 'package:flutter/material.dart';

class ContactUsScreen extends StatefulWidget {
  static const routeName = '/contact-us';

  const ContactUsScreen({super.key});

  @override
  State<ContactUsScreen> createState() => _ContactUsScreenState();
}

class _ContactUsScreenState extends State<ContactUsScreen> {
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

  void _submitForm() {
    if (formKey.currentState?.validate() ?? false) {
      // Form submission logic here
      ScaffoldMessenger.of(context).showSnackBar(
        const SnackBar(content: Text("Message Sent Successfully!")),
      );
      _resetForm();
    }
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
                    style: TextStyle(
                      fontSize: 28,
                      fontWeight: FontWeight.bold,
                      color: const Color(0xFF6B4BFD),
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
                      boxShadow: [
                        BoxShadow(
                          color: Colors.black12,
                          blurRadius: 8.0,
                          offset: const Offset(0, 2),
                        ),
                      ],
                    ),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                      // Form Title
        Center( // Wrap the title in Center to align it in the middle
          child: Column(
            children: const [
              Text(
                "Get in touch!",
                style: TextStyle(
                  fontSize: 22,
                  fontWeight: FontWeight.bold,
                  color: Colors.teal,
                ),
              ),
              SizedBox(height: 5), // Space between the title and subtitle
              Text("We'd love to hear from you."),
            ],
          ),
        ),
                const SizedBox(height: 20), // Space after the centered text

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
                      boxShadow: [
                        BoxShadow(
                          color: Colors.black12,
                          blurRadius: 8.0,
                          offset: const Offset(0, 2),
                        ),
                      ],
                    ),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: const [
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
