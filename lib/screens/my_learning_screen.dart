// import 'package:flutter/material.dart';
// import 'package:provider/provider.dart';
// import 'package:wbl_mobile_app/widgets/presentationWidget.dart';
// import 'package:wbl_mobile_app/widgets/recordingsWidget.dart';
// import 'package:wbl_mobile_app/widgets/othersWidget.dart'; // Make sure to import your OthersWidget
// import '../providers/user_provider.dart';

// class MyLearningScreen extends StatefulWidget {
//   static const routeName = '/my-learning';

//   const MyLearningScreen({super.key});

//   @override
//   State<MyLearningScreen> createState() => _MyLearningScreenState();
// }

// class _MyLearningScreenState extends State<MyLearningScreen> {
//   String selectedOption = 'Recordings'; // Default selected option
//   String searchQuery = '';

//   // Mapping for search keys based on selected course
//   final Map<String, String> courseSearchMap = {
//     'ML': 'Python',
//     'UI': 'JavaScript',
//     'QA': 'Java',
//   };

//   @override
//   Widget build(BuildContext context) {
//     final userProvider = Provider.of<UserProvider>(context);
//     final selectedCourse = userProvider.selectedCourse;
//     const String apiUrl = 'https://whitebox-learning.com/api/recording';

//     return Scaffold(
//       body: Column(
//         children: [
//           // Option switching buttons
//           Container(
//             margin: const EdgeInsets.fromLTRB(16.0, 18.0, 16.0, 0),
//             color: Colors.grey.shade200,
//             child: SingleChildScrollView(
//               scrollDirection: Axis.horizontal,
//               child: Row(
//                 mainAxisAlignment: MainAxisAlignment.spaceEvenly,
//                 children: [
//                   ElevatedButton.icon(
//                     onPressed: () {
//                       setState(() {
//                         selectedOption = 'Recordings';
//                       });
//                     },
//                     icon: const Icon(Icons.slideshow),
//                     label: Text(
//                       'Recordings',
//                       style: TextStyle(
//                         color: selectedOption == 'Recordings'
//                             ? Colors.white
//                             : Colors.black,
//                       ),
//                     ),
//                     style: ElevatedButton.styleFrom(
//                       backgroundColor: selectedOption == 'Recordings'
//                           ? Colors.purple
//                           : Colors.grey.shade300,
//                     ),
//                   ),
//                   ElevatedButton.icon(
//                     onPressed: () {
//                       setState(() {
//                         selectedOption = 'Presentation';
//                       });
//                     },
//                     icon: const Icon(Icons.chrome_reader_mode),
//                     label: Text(
//                       'Presentation',
//                       style: TextStyle(
//                         color: selectedOption == 'Presentation'
//                             ? Colors.white
//                             : Colors.black,
//                       ),
//                     ),
//                     style: ElevatedButton.styleFrom(
//                       backgroundColor: selectedOption == 'Presentation'
//                           ? Colors.purple
//                           : Colors.grey.shade300,
//                     ),
//                   ),
//                   ElevatedButton.icon(
//                     onPressed: () {
//                       setState(() {
//                         selectedOption = 'Other';
//                       });
//                     },
//                     icon: const Icon(Icons.miscellaneous_services),
//                     label: Text(
//                       'Other',
//                       style: TextStyle(
//                         color: selectedOption == 'Other'
//                             ? Colors.white
//                             : Colors.black,
//                       ),
//                     ),
//                     style: ElevatedButton.styleFrom(
//                       backgroundColor: selectedOption == 'Other'
//                           ? Colors.purple
//                           : Colors.grey.shade300,
//                     ),
//                   ),
//                 ],
//               ),
//             ),
//           ),

//           // Search bar for Recordings only
//           if (selectedOption == 'Recordings')
//             Padding(
//               padding: const EdgeInsets.all(16.0),
//               child: TextField(
//                 onChanged: (value) {
//                   setState(() {
//                     searchQuery = value; // Set searchQuery based on user input
//                   });
//                 },
//                 decoration: InputDecoration(
//                   labelText: 'Search $selectedOption',
//                   border: OutlineInputBorder(
//                     borderRadius: BorderRadius.circular(30.0),
//                   ),
//                   enabledBorder: OutlineInputBorder(
//                     borderRadius: BorderRadius.circular(30.0),
//                     borderSide: BorderSide(color: Colors.grey.shade400),
//                   ),
//                   focusedBorder: OutlineInputBorder(
//                     borderRadius: BorderRadius.circular(30.0),
//                     borderSide: BorderSide(
//                         color: const Color.fromARGB(255, 184, 29, 211)),
//                   ),
//                   prefixIcon: const Icon(Icons.search),
//                 ),
//               ),
//             ),

//           // Expanded widget to maintain the fixed position of search bar and tabs
//           Expanded(
//             child: selectedOption == 'Recordings'
//                 ? RecordingsWidget(
//                     searchQuery: searchQuery.isNotEmpty
//                         ? searchQuery
//                         : courseSearchMap[selectedCourse] ?? '', // Use mapping
//                     apiUrl: apiUrl,
//                     selectedCourse: selectedCourse,
//                   )
//                 : selectedOption == 'Presentation'
//                     ? PresentationWidget() // Use PresentationWidget
//                     : OthersWidget(), // Ensure OthersWidget is defined and implemented
//           ),
//         ],
//       ),
//     );
//   }
// }
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:wbl_mobile_app/widgets/presentationWidget.dart';
import 'package:wbl_mobile_app/widgets/recordingsWidget.dart';
import 'package:wbl_mobile_app/widgets/othersWidget.dart';
import '../providers/user_provider.dart';

class MyLearningScreen extends StatefulWidget {
  static const routeName = '/my-learning';

  const MyLearningScreen({super.key});

  @override
  State<MyLearningScreen> createState() => _MyLearningScreenState();
}

class _MyLearningScreenState extends State<MyLearningScreen> {
  String selectedOption = 'Recordings'; // Default selected option
  String searchQuery = '';

  // Mapping for search keys based on selected course
  final Map<String, String> courseSearchMap = {
    'ML': 'Python',
    'UI': 'JavaScript',
    'QA': 'Java',
  };

  @override
  Widget build(BuildContext context) {
    final userProvider = Provider.of<UserProvider>(context);
    final selectedCourse = userProvider.selectedCourse;
    const String apiUrl = 'https://whitebox-learning.com/api/recording';

    return Scaffold(
      body: Column(
        children: [
          // Option switching buttons
          Container(
            margin: const EdgeInsets.fromLTRB(16.0, 18.0, 16.0, 5.0),
            color: Colors.grey.shade200,
            child: SingleChildScrollView(
              scrollDirection: Axis.horizontal,
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: [
                  Padding(
                    padding: const EdgeInsets.symmetric(
                        horizontal: 8.0), // Add padding between buttons
                    child: ElevatedButton.icon(
                      onPressed: () {
                        setState(() {
                          selectedOption = 'Recordings';
                        });
                      },
                      icon: const Icon(Icons.slideshow),
                      label: Text(
                        'Recordings',
                        style: TextStyle(
                          color: selectedOption == 'Recordings'
                              ? Colors.white
                              : Colors.black,
                        ),
                      ),
                      style: ElevatedButton.styleFrom(
                        backgroundColor: selectedOption == 'Recordings'
                            ? Colors.purple
                            : Colors.grey.shade300,
                      ),
                    ),
                  ),
                  Padding(
                    padding: const EdgeInsets.symmetric(
                        horizontal: 8.0), // Add padding between buttons
                    child: ElevatedButton.icon(
                      onPressed: () {
                        setState(() {
                          selectedOption = 'Presentation';
                        });
                      },
                      icon: const Icon(Icons.chrome_reader_mode),
                      label: Text(
                        'Presentation',
                        style: TextStyle(
                          color: selectedOption == 'Presentation'
                              ? Colors.white
                              : Colors.black,
                        ),
                      ),
                      style: ElevatedButton.styleFrom(
                        backgroundColor: selectedOption == 'Presentation'
                            ? Colors.purple
                            : Colors.grey.shade300,
                      ),
                    ),
                  ),
                ],
              ),
            ),
          ),

          // Expanded widget to maintain the fixed position of search bar and tabs
          Expanded(
            child: selectedOption == 'Recordings'
                ? RecordingsWidget(
                    searchQuery: searchQuery.isNotEmpty
                        ? searchQuery
                        : courseSearchMap[selectedCourse] ?? '', // Use mapping
                    apiUrl: apiUrl,
                    selectedCourse: selectedCourse,
                  )
                : PresentationWidget(course: selectedCourse),
          )
        ],
      ),
    );
  }
}
