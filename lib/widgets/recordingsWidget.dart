// // // import 'package:flutter/material.dart';
// // // import 'package:http/http.dart' as http;
// // // import 'dart:convert';
// // // import 'package:url_launcher/url_launcher.dart';
// // // import 'package:shimmer/shimmer.dart'; // Add shimmer package for loading effect

// // // class RecordingsWidget extends StatefulWidget {
// // //   final String searchQuery;
// // //   final String apiUrl;
// // //   final String selectedCourse;

// // //   const RecordingsWidget({
// // //     Key? key,
// // //     required this.searchQuery,
// // //     required this.apiUrl,
// // //     required this.selectedCourse,
// // //   }) : super(key: key);

// // //   @override
// // //   _RecordingsWidgetState createState() => _RecordingsWidgetState();
// // // }

// // // class _RecordingsWidgetState extends State<RecordingsWidget> {
// // //   List<Map<String, String>> filteredRecordings = [];
// // //   bool isLoading = true;
// // //   String? errorMessage;

// // //   @override
// // //   void initState() {
// // //     super.initState();
// // //     fetchRecordings(); // Fetch initially when widget loads
// // //   }

// // //   @override
// // //   void didUpdateWidget(covariant RecordingsWidget oldWidget) {
// // //     super.didUpdateWidget(oldWidget);
// // //     // Fetch recordings again when search query changes
// // //     if (widget.searchQuery != oldWidget.searchQuery) {
// // //       fetchRecordings();
// // //     }
// // //   }

// // //   Future<void> fetchRecordings({int limit = 10}) async {
// // //     setState(() {
// // //       isLoading = true;
// // //       errorMessage = null;
// // //     });

// // //     final apiUrlWithParams =
// // //         '${widget.apiUrl}?course=${widget.selectedCourse}&search=${widget.searchQuery}&limit=$limit'; // Use searchQuery

// // //     try {
// // //       print('Fetching recordings from: $apiUrlWithParams');
// // //       final response = await http.get(Uri.parse(apiUrlWithParams));

// // //       print('Response status code: ${response.statusCode}');

// // //       if (response.statusCode == 200) {
// // //         final Map<String, dynamic> decodedResponse = json.decode(response.body);
// // //         final List<dynamic> recordings = decodedResponse['batch_recordings'];

// // //         print('Fetched recordings: ${recordings.length} items');

// // //         setState(() {
// // //           filteredRecordings = recordings.map((item) {
// // //             return {
// // //               'title': item['description'] as String,
// // //               'youtubeId': item['videoid'] as String,
// // //             };
// // //           }).toList();
// // //         });
// // //       } else {
// // //         setState(() {
// // //           errorMessage =
// // //               'Failed to load recordings, status code: ${response.statusCode}';
// // //         });
// // //         print(errorMessage);
// // //       }
// // //     } catch (error) {
// // //       setState(() {
// // //         errorMessage = 'An error occurred while fetching data: $error';
// // //       });
// // //       print('Error fetching recordings: $error');
// // //     } finally {
// // //       setState(() {
// // //         isLoading = false;
// // //       });
// // //     }
// // //   }

// // //   @override
// // //   Widget build(BuildContext context) {
// // //     if (isLoading) {
// // //       return GridView.builder(
// // //         padding: const EdgeInsets.all(16.0),
// // //         itemCount: 6, // Show 6 placeholders while loading
// // //         gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
// // //           crossAxisCount: 2,
// // //           crossAxisSpacing: 16.0,
// // //           mainAxisSpacing: 16.0,
// // //           childAspectRatio: 16 / 9,
// // //         ),
// // //         itemBuilder: (context, index) => _shimmerPlaceholder(),
// // //       );
// // //     }

// // //     if (errorMessage != null) {
// // //       return Padding(
// // //         padding: const EdgeInsets.all(16.0),
// // //         child: Text(
// // //           errorMessage!,
// // //           style: const TextStyle(color: Colors.red, fontSize: 16.0),
// // //         ),
// // //       );
// // //     }

// // //     return Expanded(
// // //       child: LayoutBuilder(
// // //         builder: (context, constraints) {
// // //           // int crossAxisCount = constraints.maxWidth < 600 ? 1 : 2; // Adjust based on screen width
// // //           return GridView.builder(
// // //             padding: const EdgeInsets.all(16.0),
// // //             itemCount: filteredRecordings.length,
// // //             gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
// // //               crossAxisCount: 2,
// // //               crossAxisSpacing: 16.0,
// // //               mainAxisSpacing: 16.0,
// // //               childAspectRatio: 16 / 9,
// // //             ),
// // //             itemBuilder: (context, index) {
// // //               final recording = filteredRecordings[index];
// // //               final youtubeId = recording['youtubeId']!;
// // //               final youtubeUrl = 'https://www.youtube.com/watch?v=$youtubeId';
// // //               final youtubeThumbnail =
// // //                   'https://img.youtube.com/vi/$youtubeId/hqdefault.jpg';

// // //               return GestureDetector(
// // //                 onTap: () async {
// // //                   if (await canLaunch(youtubeUrl)) {
// // //                     await launch(youtubeUrl);
// // //                   } else {
// // //                     throw 'Could not launch $youtubeUrl';
// // //                   }
// // //                 },
// // //                 child: Card(
// // //                   elevation: 8,
// // //                   shape: RoundedRectangleBorder(
// // //                     borderRadius: BorderRadius.circular(16.0),
// // //                   ),
// // //                   child: Stack(
// // //                     children: [
// // //                       // Video Thumbnail
// // //                       ClipRRect(
// // //                         borderRadius: BorderRadius.circular(16.0),
// // //                         child: Image.network(
// // //                           youtubeThumbnail,
// // //                           fit: BoxFit.cover,
// // //                           width: double.infinity,
// // //                           height: double.infinity,
// // //                         ),
// // //                       ),

// // //                       // Overlay Gradient for better text visibility
// // //                       Positioned.fill(
// // //                         child: Container(
// // //                           decoration: BoxDecoration(
// // //                             borderRadius: BorderRadius.circular(16.0),
// // //                             gradient: LinearGradient(
// // //                               colors: [
// // //                                 Colors.black.withOpacity(0.6),
// // //                                 Colors.transparent
// // //                               ],
// // //                               begin: Alignment.bottomCenter,
// // //                               end: Alignment.topCenter,
// // //                             ),
// // //                           ),
// // //                         ),
// // //                       ),

// // //                       // Video Title and Action Buttons
// // //                       Positioned(
// // //                         bottom: 10,
// // //                         left: 10,
// // //                         right: 10,
// // //                         child: Column(
// // //                           crossAxisAlignment: CrossAxisAlignment.start,
// // //                           children: [
// // //                             Text(
// // //                               recording['title']!,
// // //                               style: const TextStyle(
// // //                                 color: Colors.white,
// // //                                 fontWeight: FontWeight.bold,
// // //                                 fontSize: 14.0,
// // //                               ),
// // //                               overflow: TextOverflow.ellipsis,
// // //                               maxLines: 2,
// // //                             ),
// // //                             const SizedBox(height: 5),
// // //                             Row(
// // //                               mainAxisAlignment: MainAxisAlignment.spaceBetween,
// // //                               children: [
// // //                                 // Play Button with animation
// // //                                 InkWell(
// // //                                   onTap: () async {
// // //                                     if (await canLaunch(youtubeUrl)) {
// // //                                       await launch(youtubeUrl);
// // //                                     } else {
// // //                                       throw 'Could not launch $youtubeUrl';
// // //                                     }
// // //                                   },
// // //                                   child: Container(
// // //                                     padding: const EdgeInsets.all(6.0),
// // //                                     decoration: BoxDecoration(
// // //                                       shape: BoxShape.circle,
// // //                                       color: Colors.white.withOpacity(0.8),
// // //                                     ),
// // //                                     child: const Icon(
// // //                                       Icons.play_arrow_rounded,
// // //                                       color: Color.fromARGB(255, 69, 10, 79),
// // //                                     ),
// // //                                   ),
// // //                                 ),
// // //                                 // Like Button
// // //                                 // IconButton(
// // //                                 //   icon: const Icon(
// // //                                 //     Icons.favorite_border,
// // //                                 //     color: Colors.white,
// // //                                 //   ),
// // //                                 //   onPressed: () {
// // //                                 //     // Handle like action
// // //                                 //   },
// // //                                 // ),
// // //                                 // // Share Button
// // //                                 // IconButton(
// // //                                 //   icon: const Icon(
// // //                                 //     Icons.share,
// // //                                 //     color: Colors.white,
// // //                                 //   ),
// // //                                 //   onPressed: () {
// // //                                 //     // Handle share action
// // //                                 //   },
// // //                                 // ),
// // //                               ],
// // //                             ),
// // //                           ],
// // //                         ),
// // //                       ),
// // //                     ],
// // //                   ),
// // //                 ),
// // //               );
// // //             },
// // //           );
// // //         },
// // //       ),
// // //     );
// // //   }

// // //   Widget _shimmerPlaceholder() {
// // //     return Shimmer.fromColors(
// // //       baseColor: Colors.grey.shade300,
// // //       highlightColor: Colors.grey.shade100,
// // //       child: Container(
// // //         height: 200,
// // //         width: double.infinity,
// // //         color: Colors.grey.shade200,
// // //       ),
// // //     );
// // //   }
// // // }

// // import 'package:flutter/material.dart';
// // import 'package:http/http.dart' as http;
// // import 'dart:convert';
// // import 'package:url_launcher/url_launcher.dart';
// // import 'package:shimmer/shimmer.dart';

// // class RecordingsWidget extends StatefulWidget {
// //   final String searchQuery;
// //   final String apiUrl;
// //   final String selectedCourse;

// //   const RecordingsWidget({
// //     Key? key,
// //     required this.searchQuery,
// //     required this.apiUrl,
// //     required this.selectedCourse,
// //   }) : super(key: key);

// //   @override
// //   _RecordingsWidgetState createState() => _RecordingsWidgetState();
// // }

// // class _RecordingsWidgetState extends State<RecordingsWidget> {
// //   List<Map<String, String>> recordings = [];
// //   Set<String> loadedYoutubeIds = Set(); // Track unique Youtube IDs
// //   bool isLoading = false;
// //   bool hasMoreData = true;
// //   String? errorMessage;
// //   int currentPage = 0;
// //   final int itemsPerPage = 10; // Fetch 10 items at a time

// //   @override
// //   void initState() {
// //     super.initState();
// //     fetchRecordings(); // Fetch the initial 10 recordings when the widget loads
// //   }

// //   @override
// //   void didUpdateWidget(covariant RecordingsWidget oldWidget) {
// //     super.didUpdateWidget(oldWidget);
// //     // Refetch recordings when the search query changes
// //     if (widget.searchQuery != oldWidget.searchQuery) {
// //       resetAndFetch();
// //     }
// //   }

// //   void resetAndFetch() {
// //     setState(() {
// //       recordings.clear();
// //       loadedYoutubeIds.clear(); // Reset the Set when search or course changes
// //       currentPage = 0;
// //       hasMoreData = true;
// //     });
// //     fetchRecordings();
// //   }

// //   Future<void> fetchRecordings() async {
// //     if (isLoading || !hasMoreData) return; // Prevent multiple requests

// //     setState(() {
// //       isLoading = true;
// //       errorMessage = null;
// //     });

// //     final apiUrlWithParams =
// //         '${widget.apiUrl}?course=${widget.selectedCourse}&search=${widget.searchQuery}&offset=${currentPage * itemsPerPage}&limit=$itemsPerPage';

// //     try {
// //       print('Fetching recordings from: $apiUrlWithParams');
// //       final response = await http.get(Uri.parse(apiUrlWithParams));

// //       if (response.statusCode == 200) {
// //         final Map<String, dynamic> decodedResponse = json.decode(response.body);
// //         final List<dynamic> newRecordings = decodedResponse['batch_recordings'];

// //         if (newRecordings.isNotEmpty) {
// //           List<Map<String, String>> uniqueRecordings = newRecordings
// //               .where((item) => !loadedYoutubeIds.contains(item['videoid']))
// //               .map((item) {
// //             return {
// //               'title': item['description'] as String,
// //               'youtubeId': item['videoid'] as String,
// //             };
// //           }).toList();

// //           setState(() {
// //             loadedYoutubeIds.addAll(
// //                 uniqueRecordings.map((r) => r['youtubeId']!)); // Track IDs
// //             recordings.addAll(uniqueRecordings); // Add only unique items
// //             currentPage++; // Increment the page for the next batch
// //           });
// //         } else {
// //           setState(() {
// //             hasMoreData = false; // No more recordings to load
// //           });
// //         }
// //       } else {
// //         setState(() {
// //           errorMessage =
// //               'Failed to load recordings, status code: ${response.statusCode}';
// //         });
// //       }
// //     } catch (error) {
// //       setState(() {
// //         errorMessage = 'An error occurred while fetching data: $error';
// //       });
// //     } finally {
// //       setState(() {
// //         isLoading = false;
// //       });
// //     }
// //   }

// //   @override
// //   Widget build(BuildContext context) {
// //     if (errorMessage != null) {
// //       return Padding(
// //         padding: const EdgeInsets.all(16.0),
// //         child: Text(
// //           errorMessage!,
// //           style: const TextStyle(color: Colors.red, fontSize: 16.0),
// //         ),
// //       );
// //     }

// //     return NotificationListener<ScrollNotification>(
// //       onNotification: (ScrollNotification scrollInfo) {
// //         if (!isLoading &&
// //             hasMoreData &&
// //             scrollInfo.metrics.pixels == scrollInfo.metrics.maxScrollExtent) {
// //           // If the user has scrolled to the bottom, fetch more data
// //           fetchRecordings();
// //         }
// //         return false;
// //       },
// //       child: GridView.builder(
// //         padding: const EdgeInsets.all(16.0),
// //         itemCount: recordings.length + (isLoading ? 1 : 0), // Show loading spinner at the end
// //         gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
// //           crossAxisCount: 2,
// //           crossAxisSpacing: 16.0,
// //           mainAxisSpacing: 16.0,
// //           childAspectRatio: 16 / 9,
// //         ),
// //         itemBuilder: (context, index) {
// //           if (index == recordings.length) {
// //             return _shimmerPlaceholder(); // Show shimmer while loading new recordings
// //           }

// //           final recording = recordings[index];
// //           final youtubeId = recording['youtubeId']!;
// //           final youtubeUrl = 'https://www.youtube.com/watch?v=$youtubeId';
// //           final youtubeThumbnail =
// //               'https://img.youtube.com/vi/$youtubeId/hqdefault.jpg';

// //           return GestureDetector(
// //             onTap: () async {
// //               if (await canLaunch(youtubeUrl)) {
// //                 await launch(youtubeUrl);
// //               } else {
// //                 throw 'Could not launch $youtubeUrl';
// //               }
// //             },
// //             child: Card(
// //               elevation: 8,
// //               shape: RoundedRectangleBorder(
// //                 borderRadius: BorderRadius.circular(16.0),
// //               ),
// //               child: Stack(
// //                 children: [
// //                   ClipRRect(
// //                     borderRadius: BorderRadius.circular(16.0),
// //                     child: Image.network(
// //                       youtubeThumbnail,
// //                       fit: BoxFit.cover,
// //                       width: double.infinity,
// //                       height: double.infinity,
// //                     ),
// //                   ),
// //                   Positioned.fill(
// //                     child: Container(
// //                       decoration: BoxDecoration(
// //                         borderRadius: BorderRadius.circular(16.0),
// //                         gradient: LinearGradient(
// //                           colors: [
// //                             Colors.black.withOpacity(0.6),
// //                             Colors.transparent
// //                           ],
// //                           begin: Alignment.bottomCenter,
// //                           end: Alignment.topCenter,
// //                         ),
// //                       ),
// //                     ),
// //                   ),
// //                   Positioned(
// //                     bottom: 10,
// //                     left: 10,
// //                     right: 10,
// //                     child: Column(
// //                       crossAxisAlignment: CrossAxisAlignment.start,
// //                       children: [
// //                         Text(
// //                           recording['title']!,
// //                           style: const TextStyle(
// //                             color: Colors.white,
// //                             fontWeight: FontWeight.bold,
// //                             fontSize: 14.0,
// //                           ),
// //                           overflow: TextOverflow.ellipsis,
// //                           maxLines: 2,
// //                         ),
// //                         const SizedBox(height: 5),
// //                         Row(
// //                           mainAxisAlignment: MainAxisAlignment.spaceBetween,
// //                           children: [
// //                             InkWell(
// //                               onTap: () async {
// //                                 if (await canLaunch(youtubeUrl)) {
// //                                   await launch(youtubeUrl);
// //                                 } else {
// //                                   throw 'Could not launch $youtubeUrl';
// //                                 }
// //                               },
// //                               child: Container(
// //                                 padding: const EdgeInsets.all(6.0),
// //                                 decoration: BoxDecoration(
// //                                   shape: BoxShape.circle,
// //                                   color: Colors.white.withOpacity(0.8),
// //                                 ),
// //                                 child: const Icon(
// //                                   Icons.play_arrow_rounded,
// //                                   color: Color.fromARGB(255, 69, 10, 79),
// //                                 ),
// //                               ),
// //                             ),
// //                           ],
// //                         ),
// //                       ],
// //                     ),
// //                   ),
// //                 ],
// //               ),
// //             ),
// //           );
// //         },
// //       ),
// //     );
// //   }

// //   Widget _shimmerPlaceholder() {
// //     return Shimmer.fromColors(
// //       baseColor: Colors.grey.shade300,
// //       highlightColor: Colors.grey.shade100,
// //       child: Container(
// //         height: 200,
// //         width: double.infinity,
// //         color: Colors.grey.shade200,
// //       ),
// //     );
// //   }
// // }

// import 'package:flutter/material.dart';
// import 'package:http/http.dart' as http;
// import 'dart:convert';
// import 'package:url_launcher/url_launcher.dart';
// import 'package:shimmer/shimmer.dart'; // Add shimmer package for loading effect
// class RecordingsWidget extends StatefulWidget {
//   final String searchQuery;
//   final String apiUrl;
//   final String selectedCourse;
//   const RecordingsWidget({
//     Key? key,
//     required this.searchQuery,
//     required this.apiUrl,
//     required this.selectedCourse,
//   }) : super(key: key);
//   @override
//   _RecordingsWidgetState createState() => _RecordingsWidgetState();
// }
// class _RecordingsWidgetState extends State<RecordingsWidget> {
//   List<Map<String, String>> filteredRecordings = [];
//   bool isLoading = true;
//   String? errorMessage;
//   @override
//   void initState() {
//     super.initState();
//     fetchRecordings(); // Fetch initially when widget loads
//   }
//   @override
//   void didUpdateWidget(covariant RecordingsWidget oldWidget) {
//     super.didUpdateWidget(oldWidget);
//     // Fetch recordings again when search query changes
//     if (widget.searchQuery != oldWidget.searchQuery) {
//       fetchRecordings();
//     }
//   }
//   Future<void> fetchRecordings({int limit = 10}) async {
//     setState(() {
//       isLoading = true;
//       errorMessage = null;
//     });
//     final apiUrlWithParams =
//         '${widget.apiUrl}?course=${widget.selectedCourse}&search=${widget.searchQuery}&limit=$limit'; // Use searchQuery
//     try {
//       print('Fetching recordings from: $apiUrlWithParams');
//       final response = await http.get(Uri.parse(apiUrlWithParams));
//       print('Response status code: ${response.statusCode}');
//       if (response.statusCode == 200) {
//         final Map<String, dynamic> decodedResponse = json.decode(response.body);
//         final List<dynamic> recordings = decodedResponse['batch_recordings'];
//         print('Fetched recordings: ${recordings.length} items');
//         setState(() {
//           filteredRecordings = recordings.map((item) {
//             return {
//               'title': item['description'] as String,
//               'youtubeId': item['videoid'] as String,
//             };
//           }).toList();
//         });
//       } else {
//         setState(() {
//           errorMessage =
//               'Failed to load recordings, status code: ${response.statusCode}';
//         });
//         print(errorMessage);
//       }
//     } catch (error) {
//       setState(() {
//         errorMessage = 'An error occurred while fetching data: $error';
//       });
//       print('Error fetching recordings: $error');
//     } finally {
//       setState(() {
//         isLoading = false;
//       });
//     }
//   }
//   @override
//   Widget build(BuildContext context) {
//     if (isLoading) {
//       return GridView.builder(
//         padding: const EdgeInsets.all(16.0),
//         itemCount: 6, // Show 6 placeholders while loading
//         gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
//           crossAxisCount: 2,
//           crossAxisSpacing: 16.0,
//           mainAxisSpacing: 16.0,
//           childAspectRatio: 16 / 9,
//         ),
//         itemBuilder: (context, index) => _shimmerPlaceholder(),
//       );
//     }
//     if (errorMessage != null) {
//       return Padding(
//         padding: const EdgeInsets.all(16.0),
//         child: Text(
//           errorMessage!,
//           style: const TextStyle(color: Colors.red, fontSize: 16.0),
//         ),
//       );
//     }
//     return Expanded(
//       child: GridView.builder(
//         padding: const EdgeInsets.all(16.0),
//         itemCount: filteredRecordings.length,
//         gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
//           crossAxisCount: 2,
//           crossAxisSpacing: 16.0,
//           mainAxisSpacing: 16.0,
//           childAspectRatio: 16 / 9,
//         ),
//         itemBuilder: (context, index) {
//           final recording = filteredRecordings[index];
//           final youtubeId = recording['youtubeId']!;
//           final youtubeUrl = 'https://www.youtube.com/watch?v=$youtubeId';
//           final youtubeThumbnail =
//               'https://img.youtube.com/vi/$youtubeId/hqdefault.jpg';
//           return GestureDetector(
//             onTap: () async {
//               if (await canLaunch(youtubeUrl)) {
//                 await launch(youtubeUrl);
//               } else {
//                 throw 'Could not launch $youtubeUrl';
//               }
//             },
//             child: Card(
//               elevation: 8,
//               shape: RoundedRectangleBorder(
//                 borderRadius: BorderRadius.circular(16.0),
//               ),
//               child: Stack(
//                 children: [
//                   // Video Thumbnail
//                   ClipRRect(
//                     borderRadius: BorderRadius.circular(16.0),
//                     child: Image.network(
//                       youtubeThumbnail,
//                       fit: BoxFit.cover,
//                       width: double.infinity,
//                       height: double.infinity,
//                     ),
//                   ),
//                   // Overlay Gradient for better text visibility
//                   Positioned.fill(
//                     child: Container(
//                       decoration: BoxDecoration(
//                         borderRadius: BorderRadius.circular(16.0),
//                         gradient: LinearGradient(
//                           colors: [
//                             Colors.black.withOpacity(0.6),
//                             Colors.transparent
//                           ],
//                           begin: Alignment.bottomCenter,
//                           end: Alignment.topCenter,
//                         ),
//                       ),
//                     ),
//                   ),
//                   // Video Title and Action Buttons
//                   Positioned(
//                     bottom: 10,
//                     left: 10,
//                     right: 10,
//                     child: Column(
//                       crossAxisAlignment: CrossAxisAlignment.start,
//                       children: [
//                         Text(
//                           recording['title']!,
//                           style: const TextStyle(
//                             color: Colors.white,
//                             fontWeight: FontWeight.bold,
//                             fontSize: 14.0,
//                           ),
//                           overflow: TextOverflow.ellipsis,
//                           maxLines: 2,
//                         ),
//                         const SizedBox(height: 5),
//                         Row(
//                           mainAxisAlignment: MainAxisAlignment.spaceBetween,
//                           children: [
//                             // Play Button with animation
//                             InkWell(
//                               onTap: () async {
//                                 if (await canLaunch(youtubeUrl)) {
//                                   await launch(youtubeUrl);
//                                 } else {
//                                   throw 'Could not launch $youtubeUrl';
//                                 }
//                               },
//                               child: Container(
//                                 padding: const EdgeInsets.all(8.0),
//                                 decoration: BoxDecoration(
//                                   shape: BoxShape.circle,
//                                   color: Colors.white.withOpacity(0.8),
//                                 ),
//                                 child: const Icon(
//                                   Icons.play_arrow,
//                                   color: Colors.purple,
//                                 ),
//                               ),
//                             ),
//                             // Like Button
//                             IconButton(
//                               icon: const Icon(
//                                 Icons.favorite_border,
//                                 color: Colors.white,
//                               ),
//                               onPressed: () {
//                                 // Handle like action
//                               },
//                             ),
//                             // Share Button
//                             IconButton(
//                               icon: const Icon(
//                                 Icons.share,
//                                 color: Colors.white,
//                               ),
//                               onPressed: () {
//                                 // Handle share action
//                               },
//                             ),
//                           ],
//                         ),
//                       ],
//                     ),
//                   ),
//                 ],
//               ),
//             ),
//           );
//         },
//       ),
//     );
//   }
//   Widget _shimmerPlaceholder() {
//     return Shimmer.fromColors(
//       baseColor: Colors.grey.shade300,
//       highlightColor: Colors.grey.shade100,
//       child: Container(
//         height: 200,
//         width: double.infinity,
//         color: Colors.grey.shade200,
//       ),
//     );
//   }
// }

// // ----------------------------------------------------------------
// // ----------------------------------------------------------------
// // ----------------------------------------------------------------
// // ----------------------------------------------------------------

// import 'package:flutter/material.dart';
// import 'package:http/http.dart' as http;
// import 'dart:convert';
// import 'package:url_launcher/url_launcher.dart';
// import 'package:shimmer/shimmer.dart'; // Add shimmer package for loading effect

// class RecordingsWidget extends StatefulWidget {
//   final String searchQuery;
//   final String apiUrl;
//   final String selectedCourse;

//   const RecordingsWidget({
//     Key? key,
//     required this.searchQuery,
//     required this.apiUrl,
//     required this.selectedCourse,
//   }) : super(key: key);

//   @override
//   _RecordingsWidgetState createState() => _RecordingsWidgetState();
// }

// class _RecordingsWidgetState extends State<RecordingsWidget> {
//   List<Map<String, String>> filteredRecordings = [];
//   bool isLoading = true;
//   String? errorMessage;
//   int limit = 10; // Default limit of 10

//   @override
//   void initState() {
//     super.initState();
//     fetchRecordings(); // Fetch initially when widget loads
//   }

//   @override
//   void didUpdateWidget(covariant RecordingsWidget oldWidget) {
//     super.didUpdateWidget(oldWidget);
//     // Fetch recordings again when search query changes
//     if (widget.searchQuery != oldWidget.searchQuery) {
//       fetchRecordings();
//     }
//   }

//   Future<void> fetchRecordings() async {
//     setState(() {
//       isLoading = true;
//       errorMessage = null;
//     });

//     final apiUrlWithParams =
//         '${widget.apiUrl}?course=${widget.selectedCourse}&search=${widget.searchQuery}'; // Include limit

//     try {
//       print('Fetching recordings from: $apiUrlWithParams');
//       final response = await http.get(Uri.parse(apiUrlWithParams));
//       print('Response status code: ${response.statusCode}');

//       if (response.statusCode == 200) {
//         final Map<String, dynamic> decodedResponse = json.decode(response.body);
//         final List<dynamic> recordings = decodedResponse['batch_recordings'];

//         print('Fetched recordings: ${recordings.length} items');

//         setState(() {
//           filteredRecordings = recordings.map((item) {
//             return {
//               'title': item['description'] as String,
//               'youtubeId': item['videoid'] as String,
//             };
//           }).toList();
//         });
//       } else {
//         setState(() {
//           errorMessage =
//               'Failed to load recordings, status code: ${response.statusCode}';
//         });
//         print(errorMessage);
//       }
//     } catch (error) {
//       setState(() {
//         errorMessage = 'An error occurred while fetching data: $error';
//       });
//       print('Error fetching recordings: $error');
//     } finally {
//       setState(() {
//         isLoading = false;
//       });
//     }
//   }

//   @override
//   Widget build(BuildContext context) {
//     if (isLoading) {
//       return GridView.builder(
//         padding: const EdgeInsets.all(16.0),
//         itemCount: 10, // Show 6 placeholders while loading
//         gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
//           crossAxisCount: 2,
//           crossAxisSpacing: 16.0,
//           mainAxisSpacing: 16.0,
//           childAspectRatio: 16 / 9,
//         ),
//         itemBuilder: (context, index) {
//           return ClipRRect(
//             borderRadius: BorderRadius.circular(16.0), // Add border radius here
//             child: _shimmerPlaceholder(),
//           );
//         },
//       );
//     }

//     if (errorMessage != null) {
//       return Padding(
//         padding: const EdgeInsets.all(16.0),
//         child: Text(
//           errorMessage!,
//           style: const TextStyle(color: Colors.red, fontSize: 16.0),
//         ),
//       );
//     }

//     return GridView.builder(
//       padding: const EdgeInsets.all(16.0),
//       itemCount: filteredRecordings.length,
//       gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
//         crossAxisCount: 2,
//         crossAxisSpacing: 16.0,
//         mainAxisSpacing: 16.0,
//         childAspectRatio: 16 / 9,
//       ),
//       itemBuilder: (context, index) {
//         final recording = filteredRecordings[index];
//         final youtubeId = recording['youtubeId']!;
//         final youtubeUrl = 'https://www.youtube.com/watch?v=$youtubeId';
//         final youtubeThumbnail =
//             'https://img.youtube.com/vi/$youtubeId/hqdefault.jpg';

//         return GestureDetector(
//           onTap: () async {
//             if (await canLaunch(youtubeUrl)) {
//               await launch(youtubeUrl);
//             } else {
//               throw 'Could not launch $youtubeUrl';
//             }
//           },
//           child: Card(
//             elevation: 8,
//             shape: RoundedRectangleBorder(
//               borderRadius: BorderRadius.circular(16.0),
//             ),
//             child: Stack(
//               children: [
//                 // Video Thumbnail
//                 ClipRRect(
//                   borderRadius: BorderRadius.circular(16.0),
//                   child: Image.network(
//                     youtubeThumbnail,
//                     fit: BoxFit.cover,
//                     width: double.infinity,
//                     height: double.infinity,
//                   ),
//                 ),
//                 // Overlay Gradient for better text visibility
//                 Positioned.fill(
//                   child: Container(
//                     decoration: BoxDecoration(
//                       borderRadius: BorderRadius.circular(16.0),
//                       gradient: LinearGradient(
//                         colors: [
//                           Colors.black.withOpacity(0.6),
//                           Colors.transparent
//                         ],
//                         begin: Alignment.bottomCenter,
//                         end: Alignment.topCenter,
//                       ),
//                     ),
//                   ),
//                 ),
//                 // Video Title and Action Buttons
//                 Positioned(
//                   bottom: 10,
//                   left: 10,
//                   right: 10,
//                   child: Column(
//                     crossAxisAlignment: CrossAxisAlignment.start,
//                     children: [
//                       Text(
//                         recording['title']!,
//                         style: const TextStyle(
//                           color: Colors.white,
//                           fontWeight: FontWeight.bold,
//                           fontSize: 14.0,
//                         ),
//                         overflow: TextOverflow.ellipsis,
//                         maxLines: 2,
//                       ),
//                       const SizedBox(height: 5),
//                       Row(
//                         mainAxisAlignment: MainAxisAlignment.spaceBetween,
//                         children: [
//                           // Play Button with animation
//                           InkWell(
//                             onTap: () async {
//                               if (await canLaunch(youtubeUrl)) {
//                                 await launch(youtubeUrl);
//                               } else {
//                                 throw 'Could not launch $youtubeUrl';
//                               }
//                             },
//                             child: Container(
//                               padding: const EdgeInsets.all(8.0),
//                               decoration: BoxDecoration(
//                                 shape: BoxShape.circle,
//                                 color: Colors.white.withOpacity(0.8),
//                               ),
//                               child: const Icon(
//                                 Icons.play_arrow,
//                                 color: Colors.purple,
//                               ),
//                             ),
//                           ),
//                           // Like Button
//                           // IconButton(
//                           //   icon: const Icon(
//                           //     Icons.favorite_border,
//                           //     color: Colors.white,
//                           //   ),
//                           //   onPressed: () {
//                           //     // Handle like action
//                           //   },
//                           // ),
//                           // // Share Button
//                           // IconButton(
//                           //   icon: const Icon(
//                           //     Icons.share,
//                           //     color: Colors.white,
//                           //   ),
//                           //   onPressed: () {
//                           //     // Handle share action
//                           //   },
//                           // ),
//                         ],
//                       ),
//                     ],
//                   ),
//                 ),
//               ],
//             ),
//           ),
//         );
//       },
//     );
//   }

//   Widget _shimmerPlaceholder() {
//     return Shimmer.fromColors(
//       baseColor: Colors.grey.shade300,
//       highlightColor: Colors.grey.shade100,
//       child: Container(
//         height: 200,
//         width: double.infinity,
//         color: Colors.grey.shade200,
//       ),
//     );
//   }
// }

// // ----------------------------------------------------------------
// // ----------------------------------------------------------------
// // ----------------------------------------------------------------

import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'dart:convert';
import 'package:url_launcher/url_launcher.dart';
import 'package:shimmer/shimmer.dart';

class RecordingsWidget extends StatefulWidget {
  final String searchQuery;
  final String apiUrl;
  final String selectedCourse;

  const RecordingsWidget({
    Key? key,
    required this.searchQuery,
    required this.apiUrl,
    required this.selectedCourse,
  }) : super(key: key);

  @override
  _RecordingsWidgetState createState() => _RecordingsWidgetState();
}

class _RecordingsWidgetState extends State<RecordingsWidget> {
  List<Map<String, String>> allRecordings = [];
  List<Map<String, String>> renderedRecordings = [];
  bool isLoading = true;
  bool isLoadingMore = false;
  String? errorMessage;

  int itemsPerPage = 10; // Number of items to render per batch
  int currentMaxIndex = 0; // Index of the last rendered item

  @override
  void initState() {
    super.initState();
    fetchRecordings(); // Fetch all recordings initially
  }

  @override
  void didUpdateWidget(covariant RecordingsWidget oldWidget) {
    super.didUpdateWidget(oldWidget);
    // Fetch recordings again when search query changes
    if (widget.searchQuery != oldWidget.searchQuery) {
      resetAndFetchRecordings();
    }
  }

  Future<void> fetchRecordings() async {
    setState(() {
      isLoading = true;
      errorMessage = null;
    });

    final apiUrlWithParams =
        '${widget.apiUrl}?course=${widget.selectedCourse}&search=${widget.searchQuery}';

    try {
      print('Fetching recordings from: $apiUrlWithParams');
      final response = await http.get(Uri.parse(apiUrlWithParams));
      print('Response status code: ${response.statusCode}');

      if (response.statusCode == 200) {
        final Map<String, dynamic> decodedResponse = json.decode(response.body);
        final List<dynamic> recordings = decodedResponse['batch_recordings'];

        setState(() {
          allRecordings = recordings.map((item) {
            return {
              'title': item['description'] as String,
              'youtubeId': item['videoid'] as String,
            };
          }).toList();

          // Render the first batch of recordings
          renderMoreRecordings();
        });
      } else {
        setState(() {
          errorMessage =
              'Failed to load recordings, status code: ${response.statusCode}';
        });
        print(errorMessage);
      }
    } catch (error) {
      setState(() {
        errorMessage = 'An error occurred while fetching data: $error';
      });
      print('Error fetching recordings: $error');
    } finally {
      setState(() {
        isLoading = false;
      });
    }
  }

  void resetAndFetchRecordings() {
    setState(() {
      allRecordings.clear();
      renderedRecordings.clear();
      currentMaxIndex = 0;
    });
    fetchRecordings();
  }

  // Load more items to the rendered list
  void renderMoreRecordings() {
    setState(() {
      int nextMaxIndex = currentMaxIndex + itemsPerPage;
      if (nextMaxIndex > allRecordings.length) {
        nextMaxIndex = allRecordings.length;
      }

      renderedRecordings
          .addAll(allRecordings.getRange(currentMaxIndex, nextMaxIndex));
      currentMaxIndex = nextMaxIndex;
      isLoadingMore =
          false; // Stop loading indicator after more items are rendered
    });
  }

  // Detect when user scrolls to the bottom and load more recordings
  void _onScrollEnd(ScrollController scrollController) {
    if (scrollController.position.pixels ==
            scrollController.position.maxScrollExtent &&
        currentMaxIndex < allRecordings.length) {
      setState(() {
        isLoadingMore = true;
      });
      renderMoreRecordings(); // Load more recordings when scrolled to the bottom
    }
  }

  @override
  Widget build(BuildContext context) {
    final ScrollController scrollController = ScrollController();
    scrollController.addListener(() => _onScrollEnd(scrollController));

    if (isLoading) {
      return GridView.builder(
        padding: const EdgeInsets.all(16.0),
        itemCount: 10, // Show 10 placeholders while loading
        gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
          crossAxisCount: 2,
          crossAxisSpacing: 16.0,
          mainAxisSpacing: 16.0,
          childAspectRatio: 16 / 9,
        ),
        itemBuilder: (context, index) {
          return ClipRRect(
            borderRadius: BorderRadius.circular(16.0),
            child: _shimmerPlaceholder(),
          );
        },
      );
    }

    if (errorMessage != null) {
      return Padding(
        padding: const EdgeInsets.all(16.0),
        child: Text(
          errorMessage!,
          style: const TextStyle(color: Colors.red, fontSize: 16.0),
        ),
      );
    }

    return Column(
      children: [
        Expanded(
          child: GridView.builder(
            controller: scrollController,
            padding: const EdgeInsets.all(16.0),
            itemCount: renderedRecordings.length,
            gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
              crossAxisCount: 2,
              crossAxisSpacing: 16.0,
              mainAxisSpacing: 16.0,
              childAspectRatio: 16 / 9,
            ),
            itemBuilder: (context, index) {
              final recording = renderedRecordings[index];
              final youtubeId = recording['youtubeId']!;
              final youtubeUrl = 'https://www.youtube.com/watch?v=$youtubeId';
              final youtubeThumbnail =
                  'https://img.youtube.com/vi/$youtubeId/hqdefault.jpg';

              return GestureDetector(
                onTap: () async {
                  if (await canLaunch(youtubeUrl)) {
                    await launch(youtubeUrl);
                  } else {
                    throw 'Could not launch $youtubeUrl';
                  }
                },
                child: Card(
                  elevation: 8,
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(16.0),
                  ),
                  child: Stack(
                    children: [
                      ClipRRect(
                        borderRadius: BorderRadius.circular(16.0),
                        child: Image.network(
                          youtubeThumbnail,
                          fit: BoxFit.cover,
                          width: double.infinity,
                          height: double.infinity,
                        ),
                      ),
                      Positioned.fill(
                        child: Container(
                          decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(16.0),
                            gradient: LinearGradient(
                              colors: [
                                Colors.black.withOpacity(0.6),
                                Colors.transparent
                              ],
                              begin: Alignment.bottomCenter,
                              end: Alignment.topCenter,
                            ),
                          ),
                        ),
                      ),
                      Positioned(
                        bottom: 10,
                        left: 10,
                        right: 10,
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Text(
                              recording['title']!,
                              style: const TextStyle(
                                color: Colors.white,
                                fontWeight: FontWeight.bold,
                                fontSize: 14.0,
                              ),
                              overflow: TextOverflow.ellipsis,
                              maxLines: 2,
                            ),
                            const SizedBox(height: 5),
                            Row(
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              children: [
                                InkWell(
                                  onTap: () async {
                                    if (await canLaunch(youtubeUrl)) {
                                      await launch(youtubeUrl);
                                    } else {
                                      throw 'Could not launch $youtubeUrl';
                                    }
                                  },
                                  child: Container(
                                    padding: const EdgeInsets.all(8.0),
                                    decoration: BoxDecoration(
                                      shape: BoxShape.circle,
                                      color: Colors.white.withOpacity(0.8),
                                    ),
                                    child: const Icon(
                                      Icons.play_arrow,
                                      color: Colors.purple,
                                    ),
                                  ),
                                ),
                              ],
                            ),
                          ],
                        ),
                      ),
                    ],
                  ),
                ),
              );
            },
          ),
        ),
        if (isLoadingMore) // Show loading indicator at the bottom while fetching more data
          const Padding(
            padding: EdgeInsets.all(16.0),
            child: CircularProgressIndicator(),
          ),
      ],
    );
  }

  Widget _shimmerPlaceholder() {
    return Shimmer.fromColors(
      baseColor: Colors.grey.shade300,
      highlightColor: Colors.grey.shade100,
      child: Container(
        height: 200,
        width: double.infinity,
        color: Colors.grey.shade200,
      ),
    );
  }
}
