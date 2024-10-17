// // import 'package:flutter/material.dart';

// // class PresentationWidget extends StatelessWidget {
// //   final String selectedOption;

// //   const PresentationWidget({Key? key, required this.selectedOption})
// //       : super(key: key);

// //   @override
// //   Widget build(BuildContext context) {
// //     return Expanded(
// //       child: Center(
// //         child: Column(
// //           mainAxisAlignment: MainAxisAlignment.center,
// //           crossAxisAlignment: CrossAxisAlignment.center,
// //           children: [
// //             const Icon(
// //               Icons.construction,
// //               size: 80.0,
// //               color: Colors.amber,
// //             ),
// //             const SizedBox(height: 18),
// //             Text(
// //               '$selectedOption page is under construction!',
// //               style: Theme.of(context).textTheme.headlineSmall!.copyWith(
// //                     color: Colors.grey[700],
// //                     fontWeight: FontWeight.bold,
// //                   ),
// //               textAlign: TextAlign.center, // Center the text
// //             ),
// //             const SizedBox(height: 10),
// //             Text(
// //               'We\'re working hard to bring this feature to you.',
// //               style: TextStyle(
// //                 fontSize: 16.0,
// //                 color: Colors.grey[600],
// //               ),
// //               textAlign: TextAlign.center,
// //             ),
// //           ],
// //         ),
// //       ),
// //     );
// //   }
// // }

// import 'dart:convert';

// import 'package:flutter/material.dart';
// import 'package:http/http.dart' as http;
// import 'package:shimmer/shimmer.dart';

// class PresentationWidget extends StatefulWidget {
//   final String selectedCourse;

//   const PresentationWidget({Key? key, required this.selectedCourse})
//       : super(key: key);

//   @override
//   _PresentationWidgetState createState() => _PresentationWidgetState();
// }

// class _PresentationWidgetState extends State<PresentationWidget> {
//   List<Map<String, String>> presentations = [];
//   bool isLoading = true;
//   String? errorMessage;

//   @override
//   void initState() {
//     super.initState();
//     fetchPresentations();
//   }

//   Future<void> fetchPresentations() async {
//     setState(() {
//       isLoading = true;
//       errorMessage = null;
//     });

//     final String apiUrl =
//         'https://www.whitebox-learning.com/api/materials?course=${widget.selectedCourse}';

//     print('Fetching presentations for course: ${widget.selectedCourse}');
//     print('API URL: $apiUrl');

//     try {
//       final response = await http.get(Uri.parse(apiUrl));

//       print('Response status code: ${response.statusCode}');
//       // Log the response body
//       print('Response body: ${response.body}');

//       if (response.statusCode == 200) {
//         final Map<String, dynamic> decodedResponse = json.decode(response.body);
//         final List<dynamic> presentationData = decodedResponse['presentations'];

//         setState(() {
//           presentations = presentationData.map((item) {
//             return {
//               'title': item['title'] as String,
//               'link': item['link'] as String,
//             };
//           }).toList();
//         });

//         print('Fetched ${presentations.length} presentations.');
//       } else {
//         setState(() {
//           errorMessage = 'Failed to load presentations';
//         });
//         print(
//             'Error: Failed to load presentations (status code: ${response.statusCode})');
//       }
//     } catch (error) {
//       setState(() {
//         errorMessage = 'Error fetching data: $error';
//       });
//       print('Error fetching data: $error');
//     } finally {
//       setState(() {
//         isLoading = false;
//       });
//       print('Fetch complete. isLoading: $isLoading');
//     }
//   }

//   @override
//   Widget build(BuildContext context) {
//     if (isLoading) {
//       return _shimmerPlaceholder();
//     }

//     if (errorMessage != null) {
//       return Center(
//         child: Text(
//           errorMessage!,
//           style: const TextStyle(color: Colors.red),
//         ),
//       );
//     }

//     return ListView.builder(
//       padding: const EdgeInsets.all(16.0),
//       itemCount: presentations.length,
//       itemBuilder: (context, index) {
//         final presentation = presentations[index];

//         return ListTile(
//           title: Text(presentation['title']!),
//           trailing: const Icon(Icons.open_in_new),
//           onTap: () {
//             // Handle navigation to presentation link
//           },
//         );
//       },
//     );
//   }

//   Widget _shimmerPlaceholder() {
//     return Shimmer.fromColors(
//       baseColor: Colors.grey.shade300,
//       highlightColor: Colors.grey.shade100,
//       child: ListView.builder(
//         itemCount: 6,
//         itemBuilder: (context, index) => Container(
//           margin: const EdgeInsets.symmetric(vertical: 8.0),
//           height: 50.0,
//           color: Colors.grey.shade200,
//         ),
//       ),
//     );
//   }
// }

// ----------------------------------------------------------------
// ----------------------------------------------------------------

// // presentation_widget.dart
// import 'package:flutter/material.dart';
// import 'resources_table.dart'; // Import your ResourcesTable widget

// class PresentationWidget extends StatefulWidget {
//   final String selectedCourse;

//   const PresentationWidget({Key? key, required this.selectedCourse})
//       : super(key: key);

//   @override
//   _PresentationWidgetState createState() => _PresentationWidgetState();
// }

// class _PresentationWidgetState extends State<PresentationWidget> {
//   ComponentType selectedType = ComponentType.presentations;

//   void onTypeChanged(ComponentType type) {
//     setState(() {
//       selectedType = type;
//     });
//   }

//   @override
//   Widget build(BuildContext context) {
//     return Column(
//       crossAxisAlignment: CrossAxisAlignment.start,
//       children: [
//         // Type selection (could use dropdown or segmented control)
//         Padding(
//           padding: const EdgeInsets.symmetric(vertical: 16.0),
//           child: Row(
//             mainAxisAlignment: MainAxisAlignment.start,
//             children: ComponentType.values.map((type) {
//               return ChoiceChip(
//                 label: Text(type.toString().split('.').last), // Display enum value as string
//                 selected: selectedType == type,
//                 onSelected: (selected) {
//                   if (selected) onTypeChanged(type);
//                 },
//               );
//             }).toList(),
//           ),
//         ),
//         // Display the ResourcesTable based on selectedType
//         Expanded(
//           child: ResourcesTable(
//             course: widget.selectedCourse,
//             type: selectedType,
//           ),
//         ),
//       ],
//     );
//   }
// }

import 'package:flutter/material.dart';
import 'resources_table.dart';

class PresentationWidget extends StatefulWidget {
  final String course;

  const PresentationWidget({Key? key, required this.course}) : super(key: key);

  @override
  _PresentationWidgetState createState() => _PresentationWidgetState();
}

class _PresentationWidgetState extends State<PresentationWidget> {
  // Default to Presentations tab
  ComponentType selectedType = ComponentType.Presentations;

  // Handle when a type is changed
  void onTypeChanged(ComponentType type) {
    setState(() {
      selectedType = type;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        // Type selection with ChoiceChips
        Padding(
          padding: const EdgeInsets.symmetric(vertical: 16.0, horizontal: 8.0),
          child: Center(
            child: Wrap(
              spacing: 20.0, // Space between chips
              alignment: WrapAlignment.center, // Align chips in the center
              children: ComponentType.values.map((type) {
                return SizedBox(
                  width: 130, // Set uniform width
                  height: 50, // Set uniform height
                  child: ChoiceChip(
                    label: Text(
                      type
                          .toString()
                          .split('.')
                          .last
                          .toUpperCase(), // Display enum value as string
                      style: TextStyle(
                        color:
                            selectedType == type ? Colors.white : Colors.black,
                      ),
                      textAlign: TextAlign.center, // Center text
                    ),
                    selected: selectedType == type,
                    selectedColor: const Color.fromARGB(
                        255, 40, 118, 236), // Highlight selected chip
                    onSelected: (selected) {
                      if (selected) onTypeChanged(type);
                    },
                  ),
                );
              }).toList(),
            ),
          ),
        ),
        // Display the ResourcesTable based on selectedType
        Expanded(
          child: ResourcesTable(
            course: widget.course,
            type: selectedType,
          ),
        ),
      ],
    );
  }
}
