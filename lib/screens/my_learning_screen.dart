// import 'package:flutter/material.dart';

// class MyLearningScreen extends StatelessWidget {
//   static const routeName = '/my-learning';  // Add this routeName property

//   const MyLearningScreen({super.key});

//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//       appBar: AppBar(
//         title: const Text('My Learning'),
//       ),
//       body: const Center(
//         child: Text('My Learning Content'),
//       ),
//     );
//   }
// }

import 'package:flutter/material.dart';

class MyLearningScreen extends StatefulWidget {
  static const routeName = '/my-learning';

  const MyLearningScreen({super.key});

  @override
  State<MyLearningScreen> createState() => _MyLearningScreenState();
}

class _MyLearningScreenState extends State<MyLearningScreen> {
  String selectedOption = 'Recordings'; // Default selected option

  // Custom colors for button states
  final Color selectedButtonColor = Colors.purple;
  final Color unselectedButtonColor = Colors.grey.shade300;
  final Color selectedTextColor = Colors.white;
  final Color unselectedTextColor = Colors.black;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
        children: [
          // Space from the top

          // SizedBox(height: 30.0), // Adjust height as needed
          // Wrap buttons in SingleChildScrollView and Row to prevent overflow
          Container(
            margin: const EdgeInsets.fromLTRB(
                16.0, 18.0, 16.0, 18.0), // left, top, right, bottom
            color: Colors
                .grey.shade200, // Set background color for the button area
            child: SingleChildScrollView(
              scrollDirection: Axis.horizontal,
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: [
                  ElevatedButton.icon(
                    onPressed: () {
                      setState(() {
                        selectedOption = 'Recordings';
                      });
                    },
                    icon: const Icon(Icons.slideshow), // Icon for recordings
                    label: Text(
                      'Recordings',
                      style: TextStyle(
                        color: selectedOption == 'Recordings'
                            ? selectedTextColor
                            : unselectedTextColor,
                      ),
                    ),
                    style: ElevatedButton.styleFrom(
                      backgroundColor: selectedOption == 'Recordings'
                          ? selectedButtonColor
                          : unselectedButtonColor,
                    ),
                  ),
                  ElevatedButton.icon(
                    onPressed: () {
                      setState(() {
                        selectedOption = 'Presentation';
                      });
                    },
                    icon: const Icon(
                        Icons.chrome_reader_mode), // Icon for presentation
                    label: Text(
                      'Presentation',
                      style: TextStyle(
                        color: selectedOption == 'Presentation'
                            ? selectedTextColor
                            : unselectedTextColor,
                      ),
                    ),
                    style: ElevatedButton.styleFrom(
                      backgroundColor: selectedOption == 'Presentation'
                          ? selectedButtonColor
                          : unselectedButtonColor,
                    ),
                  ),
                  ElevatedButton.icon(
                    onPressed: () {
                      setState(() {
                        selectedOption = 'Other';
                      });
                    },
                    icon: const Icon(
                        Icons.miscellaneous_services), // Icon for miscellaneous
                    label: Text(
                      'Other',
                      style: TextStyle(
                        color: selectedOption == 'Other'
                            ? selectedTextColor
                            : unselectedTextColor,
                      ),
                    ),
                    style: ElevatedButton.styleFrom(
                      backgroundColor: selectedOption == 'Other'
                          ? selectedButtonColor
                          : unselectedButtonColor,
                    ),
                  ),
                ],
              ),
            ),
          ),
          // Show search bar if any option is selected
          Padding(
            padding: const EdgeInsets.all(16.0),
            child: TextField(
              decoration: InputDecoration(
                labelText: 'Search $selectedOption',
                border: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(
                      30.0), // Adjust the radius as needed
                ),
                enabledBorder: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(
                      30.0), // Consistent with the border radius
                  borderSide: BorderSide(
                      color: Colors
                          .grey.shade400), // Border color when not focused
                ),
                focusedBorder: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(
                      30.0), // Consistent with the border radius
                  borderSide: BorderSide(
                      color: const Color.fromARGB(255, 184, 29, 211)), // Border color when focused
                ),
                prefixIcon: const Icon(Icons.search),
              ),
            ),
          ),

          // Content below the search bar
          Expanded(
            child: Center(
              child: Text(
                  '$selectedOption Content'), // Display the selected option's content
            ),
          ),
        ],
      ),
    );
  }
}
