import 'package:flutter/material.dart';
import 'package:wbl_mobile_app/screens/login_screen.dart';

class RegisterScreen extends StatefulWidget {
  static const routeName = '/register';

  const RegisterScreen({super.key});

  @override
  State<RegisterScreen> createState() => _RegisterScreenState();
}

class _RegisterScreenState extends State<RegisterScreen> {
  bool _acceptPrivacyPolicy = false;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.blueGrey[50],
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: SingleChildScrollView(
          physics: const ClampingScrollPhysics(),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.center,
            mainAxisAlignment: MainAxisAlignment.center, // Center the content
            children: [
  SizedBox(height: 50),
            CircleAvatar(
              radius: 50,
              child: Image.asset(
                  'assets/signup_image.png'), // Replace with your asset
            ),
              Text(
                'Create your account',
                style: TextStyle(
                  fontSize: 32,
                  fontWeight: FontWeight.bold,
                   color: const Color.fromARGB(255, 126, 22, 245),                   
                ),
              ),
              const SizedBox(height: 8),
              Text(
                'Welcome. We exist to make learning easier.',
                style: TextStyle(
                  fontSize: 18,
                   color: const Color.fromARGB(255, 107, 75, 253),
                ),
              ),
              const SizedBox(height: 32),
              TextField(
                decoration: InputDecoration(
                  labelText: 'Full Name *',
                  border: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(30),
                  ),
                  filled: true,
                  fillColor: Colors.white,
                  prefixIcon: Icon(Icons.person, color: Colors.teal),
                ),
              ),
              const SizedBox(height: 16),
              Row(
                children: [
                  Expanded(
                    child: TextField(
                      decoration: InputDecoration(
                        labelText: 'Country Code *',
                        border: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(30),
                        ),
                        filled: true,
                        fillColor: Colors.white,
                        prefixIcon: Icon(Icons.flag, color: Colors.teal),
                      ),
                    ),
                  ),
                  const SizedBox(width: 16),
                  Expanded(
                    child: TextField(
                      decoration: InputDecoration(
                        labelText: 'Phone *',
                        border: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(30),
                        ),
                        filled: true,
                        fillColor: Colors.white,
                        prefixIcon: Icon(Icons.phone, color: Colors.teal),
                      ),
                    ),
                  ),
                ],
              ),
              const SizedBox(height: 16),
              TextField(
                decoration: InputDecoration(
                  labelText: 'Email Address *',
                  border: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(30),
                  ),
                  filled: true,
                  fillColor: Colors.white,
                  prefixIcon: Icon(Icons.email, color: Colors.teal),
                ),
              ),
              const SizedBox(height: 16),
              TextField(
                decoration: InputDecoration(
                  labelText: 'Password *',
                  border: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(30),
                  ),
                  filled: true,
                  fillColor: Colors.white,
                  prefixIcon: Icon(Icons.lock, color: Colors.teal),
                ),
                obscureText: true,
              ),
              const SizedBox(height: 16),
              TextField(
                decoration: InputDecoration(
                  labelText: 'Address *',
                  border: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(30),
                  ),
                  filled: true,
                  fillColor: Colors.white,
                  prefixIcon: Icon(Icons.home, color: Colors.teal),
                ),
              ),
              const SizedBox(height: 16),
              TextField(
                decoration: InputDecoration(
                  labelText: 'Zip *',
                  border: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(30),
                  ),
                  filled: true,
                  fillColor: Colors.white,
                  prefixIcon: Icon(Icons.pin_drop, color: Colors.teal),
                ),
              ),
              const SizedBox(height: 16),
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
                  onPressed: () {
                    // Handle registration
                  },
                  style: ElevatedButton.styleFrom(
                    backgroundColor: const Color.fromARGB(255, 95, 46, 209),
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(30),
                    ),
                    padding: const EdgeInsets.symmetric(vertical: 16),
                  ),
                  child: Text('Register', style: TextStyle(color: Colors.white)),
                ),
              ),
              const SizedBox(height: 16),
              Center(
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Text("Already have an account?"),
                    TextButton(
                      onPressed: () {
                        Navigator.pushNamed(context, LoginScreen.routeName);
                      },
                      style: TextButton.styleFrom(
                        backgroundColor: Colors.transparent,
                      ),
                      child: Text('Login', style: TextStyle(color: Colors.teal)),
                    ),
                  ],
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}



// import 'package:flutter/material.dart';

// class RegisterScreen extends StatelessWidget {
//   static const routeName = '/signup-screen';
//   const RegisterScreen({super.key});

//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//       body: Padding(
//         padding: const EdgeInsets.all(16.0),
//         child: Column(
//           crossAxisAlignment: CrossAxisAlignment.center,
//           children: [
//             SizedBox(height: 50),
//             CircleAvatar(
//               radius: 50,
//               child: Image.asset(
//                   'assets/signup_image.png'), // Replace with your asset
//             ),
//             SizedBox(height: 20),
//             Text('Sign Up',
//                 style: TextStyle(fontSize: 24, fontWeight: FontWeight.bold)),
//             SizedBox(height: 20),
//             TextFormField(
//               decoration: InputDecoration(
//                 prefixIcon: Icon(Icons.person),
//                 labelText: 'First Name',
//                 border: OutlineInputBorder(),
//               ),
//             ),
//             SizedBox(height: 10),
//             TextFormField(
//               decoration: InputDecoration(
//                 prefixIcon: Icon(Icons.person),
//                 labelText: 'Last Name',
//                 border: OutlineInputBorder(),
//               ),
//             ),
//             SizedBox(height: 10),
//             TextFormField(
//               decoration: InputDecoration(
//                 prefixIcon: Icon(Icons.email),
//                 labelText: 'Email',
//                 border: OutlineInputBorder(),
//               ),
//             ),
//             SizedBox(height: 10),
//             TextFormField(
//               obscureText: true,
//               decoration: InputDecoration(
//                 prefixIcon: Icon(Icons.lock),
//                 labelText: 'Password',
//                 border: OutlineInputBorder(),
//               ),
//             ),
//             SizedBox(height: 20),
//             ElevatedButton(
//               onPressed: () {},
//               style: ElevatedButton.styleFrom(
//                 backgroundColor: Colors.red,
//                 minimumSize: Size(double.infinity, 50),
//               ),
//               child: Text('Sign Up'),
//             ),
//             SizedBox(height: 20),
//             GestureDetector(
//               onTap: () {
//                 // Navigate to Sign In Screen
//               },
//               child: RichText(
//                 text: TextSpan(
//                   text: 'Already have an account? ',
//                   style: TextStyle(color: Colors.black),
//                   children: [
//                     TextSpan(
//                       text: 'Sign In',
//                       style: TextStyle(
//                           color: Colors.red, fontWeight: FontWeight.bold),
//                     ),
//                   ],
//                 ),
//               ),
//             ),
//           ],
//         ),
//       ),
//     );
//   }
// }
