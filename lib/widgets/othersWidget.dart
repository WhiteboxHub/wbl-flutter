// import 'package:flutter/material.dart';
// import 'package:http/http.dart' as http;
// import 'dart:convert';

// class OthersWidget extends StatefulWidget {
//   final String selectedCourse;

//   const OthersWidget({Key? key, required this.selectedCourse}) : super(key: key);

//   @override
//   _OthersWidgetState createState() => _OthersWidgetState();
// }

// class _OthersWidgetState extends State<OthersWidget> {
//   List<Map<String, String>> othersData = [];
//   bool isLoading = true;
//   String? errorMessage;

//   @override
//   void initState() {
//     super.initState();
//     fetchOthersData();
//   }

//   Future<void> fetchOthersData() async {
//     setState(() {
//       isLoading = true;
//       errorMessage = null;
//     });

//     final String apiUrl = 'https://www.whitebox-learning.com/api/others?course=${widget.selectedCourse}';

//     try {
//       final response = await http.get(Uri.parse(apiUrl));

//       if (response.statusCode == 200) {
//         final Map<String, dynamic> decodedResponse = json.decode(response.body);
//         final List<dynamic> others = decodedResponse['others'];

//         setState(() {
//           othersData = others.map((item) {
//             return {
//               'title': item['title'] as String,
//               'description': item['description'] as String,
//             };
//           }).toList();
//         });
//       } else {
//         setState(() {
//           errorMessage = 'Failed to load others data';
//         });
//       }
//     } catch (error) {
//       setState(() {
//         errorMessage = 'Error fetching data: $error';
//       });
//     } finally {
//       setState(() {
//         isLoading = false;
//       });
//     }
//   }

//   @override
//   Widget build(BuildContext context) {
//     if (isLoading) {
//       return Center(
//         child: CircularProgressIndicator(),
//       );
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
//       itemCount: othersData.length,
//       itemBuilder: (context, index) {
//         final otherItem = othersData[index];

//         return ListTile(
//           title: Text(otherItem['title']!),
//           subtitle: Text(otherItem['description']!),
//         );
//       },
//     );
//   }
// }
