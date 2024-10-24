// import 'package:flutter/material.dart';
// import 'package:wbl_mobile_app/screens/login_screen.dart';
// import 'package:wbl_mobile_app/screens/register_screen.dart';
// import 'package:flutter_svg/flutter_svg.dart';
// import 'package:google_fonts/google_fonts.dart';

// class WelcomeScreen extends StatelessWidget {
//   static const routeName = '/welcome';

//   const WelcomeScreen({super.key});

//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//       body: Stack(
//         children: [
//           // Top background with gradient circles
//           Positioned(
//             top: 0,
//             right: 0,
//             child: Container(
//               width: 450,
//               height: 556,
//               child: CustomPaint(
//                 painter: TopCirclePainter(),
//               ),
//             ),
//           ),          
//           // Main content
//           Container(
//             padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 40),
//             child: Center(
//               child: Column(
//                 mainAxisAlignment: MainAxisAlignment.center,
//                 children: [
//                   SvgPicture.asset(
//                     'assets/wbl_logo.svg', // Replace with your SVG logo path
//                     height: 200,
//                     width: 200,
//                   ),
//                   const SizedBox(height: 20),
//                   Text(
//                     'Welcome to Whitebox Learning',
//                     style: GoogleFonts.poppins(
//                       fontSize: 30,
//                       fontWeight: FontWeight.w700,
//                       color: Colors.black,
//                       shadows: [
//                         Shadow(
//                           color: Colors.grey.withOpacity(0.5),
//                           offset: Offset(2, 2),
//                           blurRadius: 5,
//                         ),
//                       ],
//                     ),
//                     textAlign: TextAlign.center,
//                   ),
//                   const SizedBox(height: 40),
//                   SizedBox(
//                     width: double.infinity,
//                     child: ElevatedButton(
//                       style: ElevatedButton.styleFrom(
//                         backgroundColor: const Color.fromARGB(255, 237, 233, 250),
//                         foregroundColor: const Color.fromARGB(255, 0, 0, 0),
//                         padding: const EdgeInsets.symmetric(vertical: 15),
//                         shape: RoundedRectangleBorder(
//                           borderRadius: BorderRadius.circular(30),
//                           side: const BorderSide(color: Color(0xFF6A11CB), width: 2),
//                         ),
//                         elevation: 10,
//                       ),
//                       onPressed: () {
//                         Navigator.push(
//                           context,
//                           MaterialPageRoute(builder: (context) => const LoginScreen()),
//                         );
//                       },
//                       child: const Text(
//                         'Login',
//                         style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
//                       ),
//                     ),
//                   ),
//                   const SizedBox(height: 10),
//                   SizedBox(
//                     width: double.infinity,
//                     child: ElevatedButton(
//                       style: ElevatedButton.styleFrom(
//                         backgroundColor: const Color.fromARGB(255, 237, 233, 250),
//                         foregroundColor: const Color.fromARGB(255, 21, 20, 20),
//                         padding: const EdgeInsets.symmetric(vertical: 15),
//                         shape: RoundedRectangleBorder(
//                           borderRadius: BorderRadius.circular(30),
//                           side: const BorderSide(color: Color(0xFF6A11CB), width: 2),
//                         ),
//                         elevation: 10,
//                       ),
//                       onPressed: () {
//                         Navigator.push(
//                           context,
//                           MaterialPageRoute(builder: (context) => const RegisterScreen()),
//                         );
//                       },
//                       child: const Text(
//                         'Register',
//                         style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
//                       ),
//                     ),
//                   ),
//                 ],
//               ),
//             ),
//           ),
//         ],
//       ),
//     );
//   }
// }

// // Custom painter for the top gradient circles
// class TopCirclePainter extends CustomPainter {
//   @override
//   void paint(Canvas canvas, Size size) {
//     final paint1 = Paint()
//       ..shader = LinearGradient(
//         colors: [
//           Color(0xFF4A6CF7),
//           Color(0x004A6CF7), // Transparent color for gradient
//         ],
//         begin: Alignment.topCenter,
//         end: Alignment.bottomCenter,
//       ).createShader(Rect.fromLTRB(0, 0, size.width, size.height));

//     final paint2 = Paint()
//       ..shader = LinearGradient(
//         colors: [
//           Color(0xFF6A11CB),
//           Color(0x00A452C4), // A different gradient color
//         ],
//         begin: Alignment.topCenter,
//         end: Alignment.bottomCenter,
//       ).createShader(Rect.fromLTRB(0, 0, size.width, size.height));

//     // Draw multiple circles with different colors
//     canvas.drawCircle(Offset(size.width * 0.6, 100), 225, paint1);
//     canvas.drawCircle(Offset(40, 182), 18, paint1);
//     canvas.drawCircle(Offset(80, 288), 34, paint1);
//     canvas.drawCircle(Offset(300, 100), 70, paint2); // Additional circle
//     canvas.drawCircle(Offset(370, 220), 50, paint2); // Additional circle
//   }

//   @override
//   bool shouldRepaint(covariant CustomPainter oldDelegate) {
//     return false;
//   }
// }





// import 'package:flutter/material.dart';
// import 'package:wbl_mobile_app/screens/login_screen.dart';
// import 'package:wbl_mobile_app/screens/register_screen.dart';
// import 'package:flutter_svg/flutter_svg.dart';
// import 'package:google_fonts/google_fonts.dart';

// class WelcomeScreen extends StatelessWidget {
//   static const routeName = '/welcome';

//   const WelcomeScreen({super.key});

//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//       body: Stack(
//         children: [
//           // Top background with gradient circles
//           Positioned(
//             top: 0,
//             right: 0,
//             child: Container(
//               width: 450,
//               height: 556,
//               child: CustomPaint(
//                 painter: TopCirclePainter(),
//               ),
//             ),
//           ),          
//           // Main content
//           Container(
//             padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 40),
//             child: Center(
//               child: Column(
//                 mainAxisAlignment: MainAxisAlignment.center,
//                 children: [
//                   SvgPicture.asset(
//                     'assets/wbl_logo.svg', // Replace with your SVG logo path
//                     height: 200,
//                     width: 200,
//                   ),
//                   const SizedBox(height: 20),
//                   Text(
//                     'Welcome to Whitebox Learning',
//                     style: GoogleFonts.poppins(
//                       fontSize: 30,
//                       fontWeight: FontWeight.w700,
//                       color: Colors.black,
//                       shadows: [
//                         Shadow(
//                           color: Colors.grey.withOpacity(0.5),
//                           offset: Offset(2, 2),
//                           blurRadius: 5,
//                         ),
//                       ],
//                     ),
//                     textAlign: TextAlign.center,
//                   ),
//                   const SizedBox(height: 40),
//                   SizedBox(
//                     width: double.infinity,
//                     child: ElevatedButton(
//                       style: ElevatedButton.styleFrom(
//                         backgroundColor: const Color.fromARGB(255, 237, 233, 250),
//                         foregroundColor: const Color.fromARGB(255, 0, 0, 0),
//                         padding: const EdgeInsets.symmetric(vertical: 15),
//                         shape: RoundedRectangleBorder(
//                           borderRadius: BorderRadius.circular(30),
//                           side: const BorderSide(color: Color(0xFF6A11CB), width: 2),
//                         ),
//                         elevation: 10,
//                       ),
//                       onPressed: () {
//                         Navigator.push(
//                           context,
//                           MaterialPageRoute(builder: (context) => const LoginScreen()),
//                         );
//                       },
//                       child: const Text(
//                         'Login',
//                         style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
//                       ),
//                     ),
//                   ),
//                   const SizedBox(height: 10),
//                   SizedBox(
//                     width: double.infinity,
//                     child: ElevatedButton(
//                       style: ElevatedButton.styleFrom(
//                         backgroundColor: const Color.fromARGB(255, 237, 233, 250),
//                         foregroundColor: const Color.fromARGB(255, 21, 20, 20),
//                         padding: const EdgeInsets.symmetric(vertical: 15),
//                         shape: RoundedRectangleBorder(
//                           borderRadius: BorderRadius.circular(30),
//                           side: const BorderSide(color: Color(0xFF6A11CB), width: 2),
//                         ),
//                         elevation: 10,
//                       ),
//                       onPressed: () {
//                         Navigator.push(
//                           context,
//                           MaterialPageRoute(builder: (context) => const RegisterScreen()),
//                         );
//                       },
//                       child: const Text(
//                         'Register',
//                         style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
//                       ),
//                     ),
//                   ),
//                 ],
//               ),
//             ),
//           ),
//         ],
//       ),
//     );
//   }
// }

// // Custom painter for the top gradient circles
// class TopCirclePainter extends CustomPainter {
//   @override
//   void paint(Canvas canvas, Size size) {
//     final paint1 = Paint()
//       ..shader = LinearGradient(
//         colors: [
//           Color(0xFF4A6CF7),
//           Color(0x004A6CF7), // Transparent color for gradient
//         ],
//         begin: Alignment.topCenter,
//         end: Alignment.bottomCenter,
//       ).createShader(Rect.fromLTRB(0, 0, size.width, size.height));

//     final paint2 = Paint()
//       ..shader = LinearGradient(
//         colors: [
//           Color(0xFF6A11CB),
//           Color(0x00A452C4), // A different gradient color
//         ],
//         begin: Alignment.topCenter,
//         end: Alignment.bottomCenter,
//       ).createShader(Rect.fromLTRB(0, 0, size.width, size.height));

//     // Draw multiple circles with different colors
//     canvas.drawCircle(Offset(size.width * 0.6, 100), 225, paint1);
//     canvas.drawCircle(Offset(40, 182), 18, paint1);
//     canvas.drawCircle(Offset(80, 300), 34, paint1);
//     canvas.drawCircle(Offset(80, 300), 44, paint1);
//     canvas.drawCircle(Offset(300, 450), 70, paint2); // Additional circle
//     canvas.drawCircle(Offset(300, 450), 80, paint2); // Additional circle
//     canvas.drawCircle(Offset(400, 250), 50, paint2); // Additional circle
//     canvas.drawCircle(Offset(400, 250), 60, paint2); // Additional circle
//   }

//   @override
//   bool shouldRepaint(covariant CustomPainter oldDelegate) {
//     return false;
//   }
// }


// import 'package:flutter/material.dart';
// import 'package:wbl_mobile_app/screens/login_screen.dart';
// import 'package:wbl_mobile_app/screens/register_screen.dart';
// import 'package:flutter_svg/flutter_svg.dart';
// import 'package:google_fonts/google_fonts.dart';

// class WelcomeScreen extends StatelessWidget {
//   static const routeName = '/welcome';

//   const WelcomeScreen({super.key});

//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//       body: Stack(
//         children: [
//           // Top background with gradient circles
//           Positioned(
//             top: 0,
//             right: 0,
//             child: Container(
//               width: 450,
//               height: 556,
//               child: CustomPaint(
//                 painter: TopCirclePainter(),
//               ),
//             ),
//           ),
//           // Main content
//           Container(
//             padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 40),
//             child: Center(
//               child: Column(
//                 mainAxisAlignment: MainAxisAlignment.center,
//                 children: [
//                   SvgPicture.asset(
//                     'assets/wbl_logo.svg', // Replace with your SVG logo path
//                     height: 200,
//                     width: 200,
//                   ),
//                   const SizedBox(height: 20),
//                   Text(
//                     'Welcome to Whitebox Learning',
//                     style: GoogleFonts.poppins(
//                       fontSize: 30,
//                       fontWeight: FontWeight.w700,
//                       color: Colors.black,
//                       shadows: [
//                         Shadow(
//                           color: Colors.grey.withOpacity(0.5),
//                           offset: Offset(2, 2),
//                           blurRadius: 5,
//                         ),
//                       ],
//                     ),
//                     textAlign: TextAlign.center,
//                   ),
//                   const SizedBox(height: 40),
//                   // Ensure buttons are inside a GestureDetector to handle taps properly
//                   SizedBox(
//                     width: double.infinity,
//                     child: ElevatedButton(
//                       style: ElevatedButton.styleFrom(
//                         backgroundColor: const Color.fromARGB(255, 237, 233, 250),
//                         foregroundColor: const Color.fromARGB(255, 0, 0, 0),
//                         padding: const EdgeInsets.symmetric(vertical: 15),
//                         shape: RoundedRectangleBorder(
//                           borderRadius: BorderRadius.circular(30),
//                           side: const BorderSide(color: Color(0xFF6A11CB), width: 2),
//                         ),
//                         elevation: 10,
//                       ),
//                       onPressed: () {
//                         Navigator.push(
//                           context,
//                           MaterialPageRoute(builder: (context) => const LoginScreen()),
//                         );
//                       },
//                       child: const Text(
//                         'Login',
//                         style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
//                       ),
//                     ),
//                   ),
//                   const SizedBox(height: 10),
//                   SizedBox(
//                     width: double.infinity,
//                     child: ElevatedButton(
//                       style: ElevatedButton.styleFrom(
//                         backgroundColor: const Color.fromARGB(255, 237, 233, 250),
//                         foregroundColor: const Color.fromARGB(255, 21, 20, 20),
//                         padding: const EdgeInsets.symmetric(vertical: 15),
//                         shape: RoundedRectangleBorder(
//                           borderRadius: BorderRadius.circular(30),
//                           side: const BorderSide(color: Color(0xFF6A11CB), width: 2),
//                         ),
//                         elevation: 10,
//                       ),
//                       onPressed: () {
//                         Navigator.push(
//                           context,
//                           MaterialPageRoute(builder: (context) => const RegisterScreen()),
//                         );
//                       },
//                       child: const Text(
//                         'Register',
//                         style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
//                       ),
//                     ),
//                   ),
//                 ],
//               ),
//             ),
//           ),
//           // Bottom background with circles
//           Positioned(
//             bottom: 0,
//             left: 0,
//             right: 0,
//             child: Container(
//               height: 300, // Adjust height as needed
//               child: CustomPaint(
//                 painter: BottomCirclePainter(),
//               ),
//             ),
//           ),
//         ],
//       ),
//     );
//   }
// }

// // Custom painter for the top gradient circles
// class TopCirclePainter extends CustomPainter {
//   @override
//   void paint(Canvas canvas, Size size) {
//     final paint1 = Paint()
//       ..shader = const LinearGradient(
//         colors: [
//           Color(0xFF4A6CF7),
//           Color(0x004A6CF7), // Transparent color for gradient
//         ],
//         begin: Alignment.topCenter,
//         end: Alignment.bottomCenter,
//       ).createShader(Rect.fromLTRB(0, 0, size.width, size.height));

//     final paint2 = Paint()
//       ..shader = const LinearGradient(
//         colors: [
//           Color(0xFF6A11CB),
//           Color(0x00A452C4), // A different gradient color
//         ],
//         begin: Alignment.topCenter,
//         end: Alignment.bottomCenter,
//       ).createShader(Rect.fromLTRB(0, 0, size.width, size.height));

//     // Draw multiple circles with different colors
//     canvas.drawCircle(Offset(size.width * 0.6, 100), 225, paint1);
//     canvas.drawCircle(const Offset(40, 182), 18, paint1);
//     canvas.drawCircle(const Offset(80, 300), 34, paint2);
//     canvas.drawCircle(const Offset(80, 300), 44, paint2);
//     canvas.drawCircle(const Offset(300, 450), 70, paint2); // Additional circle
//     canvas.drawCircle(const Offset(300, 450), 80, paint2); // Additional circle
//   }

//   @override
//   bool shouldRepaint(covariant CustomPainter oldDelegate) {
//     return false;
//   }
// }

// // Custom painter for the bottom gradient circles
// class BottomCirclePainter extends CustomPainter {
//   @override
//   void paint(Canvas canvas, Size size) {
//     // Create gradient paints similar to TopCirclePainter
//     final paint1 = Paint()
//       ..shader = LinearGradient(
//         colors: [
//           Color(0xFF6A11CB),
//           Color(0x00A452C4), // Transparent color for gradient
//         ],
//         begin: Alignment.topCenter,
//         end: Alignment.bottomCenter,
//       ).createShader(Rect.fromLTRB(0, 0, size.width, size.height));

//     final paint2 = Paint()
//       ..shader = LinearGradient(
//         colors: [
//           Color(0xFF4A6CF7),
//           Color(0x004A6CF7), // Transparent color for gradient
//         ],
//         begin: Alignment.topCenter,
//         end: Alignment.bottomCenter,
//       ).createShader(Rect.fromLTRB(0, 0, size.width, size.height));

//     // Draw circles at the bottom
//     canvas.drawCircle(Offset(size.width * 0.8, size.height - 90), 60, paint2);
//     canvas.drawCircle(Offset(size.width * 0.8, size.height - 90), 70, paint2);
//     canvas.drawCircle(Offset(size.width * 0.2, size.height - 30), 50, paint1);
//     canvas.drawCircle(Offset(size.width * 0.2, size.height - 30), 40, paint1);
//   }

//   @override
//   bool shouldRepaint(covariant CustomPainter oldDelegate) {
//     return false;
//   }
// }




import 'package:flutter/material.dart';
import 'package:wbl_mobile_app/screens/login_screen.dart';
import 'package:wbl_mobile_app/screens/register_screen.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:google_fonts/google_fonts.dart';

class WelcomeScreen extends StatelessWidget {
  static const routeName = '/welcome';

  const WelcomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Stack(
        children: [
          // Top background with gradient circles
          Positioned(
            top: 0,
            right: 0,
            child: Container(
              width: 450,
              height: 556,
              child: CustomPaint(
                painter: TopCirclePainter(),
              ),
            ),
          ),
          // Bottom background with circles
          Positioned(
            bottom: 0,
            left: 0,
            right: 0,
            child: Container(
              height: 300, // Adjust height as needed
              child: CustomPaint(
                painter: BottomCirclePainter(),
              ),
            ),
          ),
          // Main content (make sure it's above the painters)
          Container(
            padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 40),
            child: Center(
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  SvgPicture.asset( 
                    'assets/wbl_logo.svg', // Replace with your SVG logo path
                    height: 200,
                    width: 200,
                  ),
                  const SizedBox(height: 20),
                  Text(
                    'Welcome to Whitebox Learning',
                    style: GoogleFonts.poppins(
                      fontSize: 30,
                      fontWeight: FontWeight.w700,
                      color: Colors.black,
                      shadows: [
                        Shadow(
                          color: Colors.grey.withOpacity(0.5),
                          offset: Offset(2, 2),
                          blurRadius: 5,
                        ),
                      ],
                    ),
                    textAlign: TextAlign.center,
                  ),
                  const SizedBox(height: 40),
                  SizedBox(
                    width: double.infinity,
                    child: ElevatedButton(
                      style: ElevatedButton.styleFrom(
                        backgroundColor: const Color.fromARGB(255, 237, 233, 250),
                        foregroundColor: const Color.fromARGB(255, 0, 0, 0),
                        padding: const EdgeInsets.symmetric(vertical: 15),
                        shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(30),
                          side: const BorderSide(color: Color(0xFF6A11CB), width: 2),
                        ),
                        elevation: 10,
                      ),
                      onPressed: () {
                        Navigator.push(
                          context,
                          MaterialPageRoute(builder: (context) => const LoginScreen()),
                        );
                      },
                      child: const Text(
                        'Login',
                        style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
                      ),
                    ),
                  ),
                  const SizedBox(height: 10),
                  SizedBox(
                    width: double.infinity,
                    child: ElevatedButton(
                      style: ElevatedButton.styleFrom(
                        backgroundColor: const Color.fromARGB(255, 237, 233, 250),
                        foregroundColor: const Color.fromARGB(255, 21, 20, 20),
                        padding: const EdgeInsets.symmetric(vertical: 15),
                        shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(30),
                          side: const BorderSide(color: Color(0xFF6A11CB), width: 2),
                        ),
                        elevation: 10,
                      ),
                      onPressed: () {
                        Navigator.push(
                          context,
                          MaterialPageRoute(builder: (context) => const RegisterScreen()),
                        );
                      },
                      child: const Text(
                        'Register',
                        style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
                      ),
                    ),
                  ),
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }
}

// Custom painter for the top gradient circles
class TopCirclePainter extends CustomPainter {
  @override
  void paint(Canvas canvas, Size size) {
    final paint1 = Paint()
      ..shader = const LinearGradient(
        colors: [
          Color(0xFF4A6CF7),
          Color(0x004A6CF7), // Transparent color for gradient
        ],
        begin: Alignment.topCenter,
        end: Alignment.bottomCenter,
      ).createShader(Rect.fromLTRB(0, 0, size.width, size.height));

    final paint2 = Paint()
      ..shader = const LinearGradient(
        colors: [
          Color(0xFF6A11CB),
          Color(0x00A452C4), // A different gradient color
        ],
        begin: Alignment.topCenter,
        end: Alignment.bottomCenter,
      ).createShader(Rect.fromLTRB(0, 0, size.width, size.height));

    // Draw multiple circles with different colors
    canvas.drawCircle(Offset(size.width * 0.6, 100), 225, paint1);
    canvas.drawCircle(const Offset(40, 182), 18, paint1);
    canvas.drawCircle(const Offset(80, 300), 34, paint2);
    canvas.drawCircle(const Offset(80, 300), 44, paint2);
    canvas.drawCircle(const Offset(300, 450), 70, paint2); // Additional circle
    canvas.drawCircle(const Offset(300, 450), 80, paint2); // Additional circle
  }

  @override
  bool shouldRepaint(covariant CustomPainter oldDelegate) {
    return false;
  }
}

// Custom painter for the bottom gradient circles
class BottomCirclePainter extends CustomPainter {
  @override
  void paint(Canvas canvas, Size size) {
    // Create gradient paints similar to TopCirclePainter
    final paint1 = Paint()
      ..shader = LinearGradient(
        colors: [
          Color(0xFF6A11CB),
          Color(0x00A452C4), // Transparent color for gradient
        ],
        begin: Alignment.topCenter,
        end: Alignment.bottomCenter,
      ).createShader(Rect.fromLTRB(0, 0, size.width, size.height));

    final paint2 = Paint()
      ..shader = LinearGradient(
        colors: [
          Color(0xFF4A6CF7),
          Color(0x004A6CF7), // Transparent color for gradient
        ],
        begin: Alignment.topCenter,
        end: Alignment.bottomCenter,
      ).createShader(Rect.fromLTRB(0, 0, size.width, size.height));

    // Draw circles at the bottom
    canvas.drawCircle(Offset(size.width * 0.8, size.height - 90), 60, paint2);
    canvas.drawCircle(Offset(size.width * 0.8, size.height - 90), 70, paint2);
    canvas.drawCircle(Offset(size.width * 0.2, size.height - 30), 50, paint1);
    canvas.drawCircle(Offset(size.width * 0.2, size.height - 30), 40, paint1);
  }

  @override
  bool shouldRepaint(covariant CustomPainter oldDelegate) {
    return false;
  }
}
