// import 'package:flutter/material.dart';
// import 'package:youtube_player_flutter/youtube_player_flutter.dart';
// import 'package:url_launcher/url_launcher.dart';

// class MyLearningScreen extends StatefulWidget {
//   static const routeName = '/my-learning';

//   const MyLearningScreen({super.key});

//   @override
//   State<MyLearningScreen> createState() => _MyLearningScreenState();
// }

// class _MyLearningScreenState extends State<MyLearningScreen> {
//   String selectedOption = 'Recordings'; // Default selected option
//   String searchQuery = '';

//   // List of sample recordings (You can fetch this data from your DB)
//   final List<Map<String, String>> recordings = [
//     {'title': 'Video 1', 'youtubeId': 'sSVjJup2pnE'},
//     {'title': 'Video 2', 'youtubeId': 'Nrn_OP5FqiQ'},
//     {'title': 'Video 3', 'youtubeId': 'lfVXjDICFb8'},
//     {'title': 'Video 4', 'youtubeId': '2oOymvv5fmE'},
//     {'title': 'Video 5', 'youtubeId': 'cens8rqSuMQ'},
//     {'title': 'Video 6', 'youtubeId': '-evlCfu1SiE'},
//   ];

//   // Custom colors for button states
//   final Color selectedButtonColor = Colors.purple;
//   final Color unselectedButtonColor = Colors.grey.shade300;
//   final Color selectedTextColor = Colors.white;
//   final Color unselectedTextColor = Colors.black;

//   YoutubePlayerController? _controller;

//   @override
//   void dispose() {
//     _controller?.dispose();
//     super.dispose();
//   }

//   @override
//   Widget build(BuildContext context) {
//     // Filter recordings based on the search query
//     final List<Map<String, String>> filteredRecordings = recordings
//         .where((recording) => recording['title']!
//             .toLowerCase()
//             .contains(searchQuery.toLowerCase()))
//         .toList();

//     return Scaffold(
//       body: Column(
//         children: [
//           // Buttons for switching between "Recordings", "Presentation", etc.
//           Container(
//             margin: const EdgeInsets.fromLTRB(16.0, 18.0, 16.0, 18.0),
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
//                             ? selectedTextColor
//                             : unselectedTextColor,
//                       ),
//                     ),
//                     style: ElevatedButton.styleFrom(
//                       backgroundColor: selectedOption == 'Recordings'
//                           ? selectedButtonColor
//                           : unselectedButtonColor,
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
//                             ? selectedTextColor
//                             : unselectedTextColor,
//                       ),
//                     ),
//                     style: ElevatedButton.styleFrom(
//                       backgroundColor: selectedOption == 'Presentation'
//                           ? selectedButtonColor
//                           : unselectedButtonColor,
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
//                             ? selectedTextColor
//                             : unselectedTextColor,
//                       ),
//                     ),
//                     style: ElevatedButton.styleFrom(
//                       backgroundColor: selectedOption == 'Other'
//                           ? selectedButtonColor
//                           : unselectedButtonColor,
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
//                     searchQuery = value;
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

//           // Display top recordings only when 'Recordings' is selected
//           if (selectedOption == 'Recordings')
//             Expanded(
//               child: ListView.builder(
//                 itemCount: filteredRecordings.length,
//                 itemBuilder: (context, index) {
//                   final recording = filteredRecordings[index];
//                   final youtubeId = recording['youtubeId']!;
//                   final youtubeUrl =
//                       'https://www.youtube.com/watch?v=$youtubeId';

//                   return Padding(
//                     padding: const EdgeInsets.symmetric(
//                         vertical: 8.0, horizontal: 16.0),
//                     child: Card(
//                       elevation: 4,
//                       child: Column(
//                         children: [
//                           // YouTube player
//                           YoutubePlayer(
//                             controller: YoutubePlayerController(
//                               initialVideoId: youtubeId,
//                               flags: const YoutubePlayerFlags(
//                                 autoPlay: false,
//                                 mute: false,
//                               ),
//                             ),
//                             showVideoProgressIndicator: true,
//                           ),

//                           ListTile(
//                             title: Text(recording['title']!),
//                             trailing: IconButton(
//                               icon: const Icon(Icons.open_in_new),
//                               onPressed: () async {
//                                 // Open the video in YouTube
//                                 if (await canLaunch(youtubeUrl)) {
//                                   await launch(youtubeUrl);
//                                 } else {
//                                   throw 'Could not launch $youtubeUrl';
//                                 }
//                               },
//                             ),
//                           ),
//                         ],
//                       ),
//                     ),
//                   );
//                 },
//               ),
//             ),       
       
// if (selectedOption == 'Presentation' || selectedOption == 'Other')
//   Expanded(
//     child: Center(
//       child: Column(
//         mainAxisAlignment: MainAxisAlignment.center,
//         crossAxisAlignment: CrossAxisAlignment.center, // Ensure center alignment
//         children: [
//           const Icon(
//             Icons.construction,
//             size: 80.0,
//             color: Colors.amber,
//           ),
//           const SizedBox(height: 20),
//           Text(
//             'Page under construction!',
//             style: Theme.of(context).textTheme.headlineSmall!.copyWith(
//                   color: Colors.grey[700],
//                   fontWeight: FontWeight.bold,
//                 ),
//           ),
//           const SizedBox(height: 10),
//           Text(
//             'We\'re working hard to bring this feature to you.',
//             style: TextStyle(
//               fontSize: 16.0,
//               color: Colors.grey[600],
//             ),
//             textAlign: TextAlign.center, // Ensure text alignment
//           ),
//         ],
//       ),
//     ),
//   ),
//         ],
//       ),
//     );
//   }
// }




// import 'package:flutter/material.dart';
// import 'package:provider/provider.dart';  // Add this import
// import 'package:url_launcher/url_launcher.dart';
// import '../providers/user_provider.dart'; // Make sure this import is also there

// class MyLearningScreen extends StatefulWidget {
//   static const routeName = '/my-learning';

//   const MyLearningScreen({super.key});

//   @override
//   State<MyLearningScreen> createState() => _MyLearningScreenState();
// }

// class _MyLearningScreenState extends State<MyLearningScreen> {
//   String selectedOption = 'Recordings'; // Default selected option
//   String searchQuery = '';

//   // Sample recordings for different courses
//   final Map<String, List<Map<String, String>>> recordings = {
//     'Machine Learning - ML': [
//       {'title': 'ML Video 1', 'youtubeId': 'sSVjJup2pnE'},
//       // Add more ML videos here...
//     ],
//     'Fullstack - UI': [
//       {'title': 'UI Video 1', 'youtubeId': 'Nrn_OP5FqiQ'},
//       // Add more Fullstack videos here...
//     ],
//     'Quality Engineering - QE': [
//       {'title': 'QE Video 1', 'youtubeId': 'lfVXjDICFb8'},
//       // Add more QE videos here...
//     ],
//   };

//   @override
//   Widget build(BuildContext context) {
//     final userProvider = Provider.of<UserProvider>(context);
//     final selectedCourse = userProvider.selectedCourse;

//     // Filter recordings based on the selected course and search query
//     final List<Map<String, String>> filteredRecordings = recordings[selectedCourse]!
//         .where((recording) => recording['title']!
//             .toLowerCase()
//             .contains(searchQuery.toLowerCase()))
//         .toList();

//     return Scaffold(
//       body: Column(
//         children: [
//           // Buttons for switching between "Recordings", "Presentation", etc.
//           // ... (same as before)

//           // Search bar for Recordings only
//           if (selectedOption == 'Recordings')
//             Padding(
//               padding: const EdgeInsets.all(16.0),
//               child: TextField(
//                 onChanged: (value) {
//                   setState(() {
//                     searchQuery = value;
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

//           // Display filtered recordings based on selected course
//           if (selectedOption == 'Recordings')
//             Expanded(
//               child: ListView.builder(
//                 itemCount: filteredRecordings.length,
//                 itemBuilder: (context, index) {
//                   final recording = filteredRecordings[index];
//                   final youtubeId = recording['youtubeId']!;
//                   final youtubeUrl = 'https://www.youtube.com/watch?v=$youtubeId';

//                   return Padding(
//                     padding: const EdgeInsets.symmetric(vertical: 8.0, horizontal: 16.0),
//                     child: Card(
//                       elevation: 4,
//                       child: Column(
//                         children: [
//                           // YouTube player
//                           // ... (same as before)

//                           ListTile(
//                             title: Text(recording['title']!),
//                             trailing: IconButton(
//                               icon: const Icon(Icons.open_in_new),
//                               onPressed: () async {
//                                 if (await canLaunch(youtubeUrl)) {
//                                   await launch(youtubeUrl);
//                                 } else {
//                                   throw 'Could not launch $youtubeUrl';
//                                 }
//                               },
//                             ),
//                           ),
//                         ],
//                       ),
//                     ),
//                   );
//                 },
//               ),
//             ),
//         ],
//       ),
//     );
//   }
// }


// import 'package:flutter/material.dart';
// import 'package:provider/provider.dart';
// import '../providers/user_provider.dart'; // Ensure this is the correct path to your UserProvider

// class MyLearningScreen extends StatelessWidget {
//   static const routeName = '/my-learning';

//   const MyLearningScreen({super.key});

//   @override
//   Widget build(BuildContext context) {
//     final userProvider = Provider.of<UserProvider>(context);
//     final selectedCourse = userProvider.selectedCourse;

//     return Scaffold(
//       appBar: AppBar(
//         title: Text('My Learning'),
//       ),
//       body: Padding(
//         padding: const EdgeInsets.all(16.0),
//         child: Column(
//           crossAxisAlignment: CrossAxisAlignment.start,
//           children: [
//             Text(
//               'Courses You Are Learning:',
//               style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
//             ),
//             SizedBox(height: 10),
//             Expanded(
//               child: GridView.builder(
//                 gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
//                   crossAxisCount: 2,
//                   childAspectRatio: 1.5, // Adjust the aspect ratio for the video frame
//                   crossAxisSpacing: 10,
//                   mainAxisSpacing: 10,
//                 ),
//                 itemCount: _getCourseVideos(selectedCourse).length,
//                 itemBuilder: (context, index) {
//                   return Card(
//                     elevation: 2,
//                     child: Column(
//                       children: [
//                         // Placeholder for video thumbnail
//                         Container(
//                           height: 100, // Adjust the height as needed
//                           decoration: BoxDecoration(
//                             image: DecorationImage(
//                               image: NetworkImage(_getCourseVideos(selectedCourse)[index].thumbnailUrl),
//                               fit: BoxFit.cover,
//                             ),
//                           ),
//                         ),
//                         Padding(
//                           padding: const EdgeInsets.all(8.0),
//                           child: Text(
//                             _getCourseVideos(selectedCourse)[index].title,
//                             style: TextStyle(fontWeight: FontWeight.bold),
//                           ),
//                         ),
//                       ],
//                     ),
//                   );
//                 },
//               ),
//             ),
//           ],
//         ),
//       ),
//     );
//   }

//   List<Video> _getCourseVideos(String? course) {
//     // Sample data for videos based on courses
//     List<Video> videos = [];
//     switch (course) {
//       case 'Machine Learning - ML':
//         videos = [
//           Video('Intro to Machine Learning', 'https://path_to_thumbnail_1.com'),
//           Video('Supervised Learning', 'https://path_to_thumbnail_2.com'),
//           Video('Unsupervised Learning', 'https://path_to_thumbnail_3.com'),
//         ];
//         break;
//       case 'Fullstack - UI':
//         videos = [
//           Video('HTML & CSS', 'https://path_to_thumbnail_4.com'),
//           Video('JavaScript Basics', 'https://path_to_thumbnail_5.com'),
//           Video('React Basics', 'https://path_to_thumbnail_6.com'),
//         ];
//         break;
//       case 'Quality Engineering - QE':
//         videos = [
//           Video('Testing Fundamentals', 'https://path_to_thumbnail_7.com'),
//           Video('Automation Testing', 'https://path_to_thumbnail_8.com'),
//           Video('Performance Testing', 'https://path_to_thumbnail_9.com'),
//         ];
//         break;
//       default:
//         videos = [];
//     }
//     return videos;
//   }
// }

// // Video class to hold video information
// class Video {
//   final String title;
//   final String thumbnailUrl;

//   Video(this.title, this.thumbnailUrl);
// }


import 'package:flutter/material.dart';
import 'package:youtube_player_flutter/youtube_player_flutter.dart';
import 'package:url_launcher/url_launcher.dart';
import 'package:provider/provider.dart';
import '../providers/user_provider.dart'; // Adjust import as necessary

class MyLearningScreen extends StatefulWidget {
  static const routeName = '/my-learning';

  const MyLearningScreen({super.key});

  @override
  State<MyLearningScreen> createState() => _MyLearningScreenState();
}

class _MyLearningScreenState extends State<MyLearningScreen> {
  String selectedOption = 'Recordings'; // Default selected option
  String searchQuery = '';

  // List of sample recordings for different courses
  final Map<String, List<Map<String, String>>> courseVideos = {
    'Machine Learning - ML': [
      {'title': 'ML Video 1', 'youtubeId': 'sSVjJup2pnE'},
      {'title': 'ML Video 2', 'youtubeId': 'Nrn_OP5FqiQ'},
    ],
    'Fullstack - UI': [
      {'title': 'UI Video 1', 'youtubeId': 'lfVXjDICFb8'},
      {'title': 'UI Video 2', 'youtubeId': '2oOymvv5fmE'},
    ],
    'Quality Engineering - QE': [
      {'title': 'QE Video 1', 'youtubeId': 'cens8rqSuMQ'},
      {'title': 'QE Video 2', 'youtubeId': '-evlCfu1SiE'},
    ],
  };

  YoutubePlayerController? _controller;

  @override
  void dispose() {
    _controller?.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    final userProvider = Provider.of<UserProvider>(context);
    final selectedCourse = userProvider.selectedCourse;

    // Filter recordings based on the search query and selected course
    final List<Map<String, String>> filteredRecordings =
        courseVideos[selectedCourse]!.where((recording) => recording['title']!
            .toLowerCase()
            .contains(searchQuery.toLowerCase())).toList();

    return Scaffold(
      body: Column(
        children: [
          // Buttons for switching between "Recordings", "Presentation", etc.
          Container(
            margin: const EdgeInsets.fromLTRB(16.0, 18.0, 16.0, 18.0),
            color: Colors.grey.shade200,
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
                  ElevatedButton.icon(
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
                  ElevatedButton.icon(
                    onPressed: () {
                      setState(() {
                        selectedOption = 'Other';
                      });
                    },
                    icon: const Icon(Icons.miscellaneous_services),
                    label: Text(
                      'Other',
                      style: TextStyle(
                        color: selectedOption == 'Other'
                            ? Colors.white
                            : Colors.black,
                      ),
                    ),
                    style: ElevatedButton.styleFrom(
                      backgroundColor: selectedOption == 'Other'
                          ? Colors.purple
                          : Colors.grey.shade300,
                    ),
                  ),
                ],
              ),
            ),
          ),

          // Search bar for Recordings only
          if (selectedOption == 'Recordings')
            Padding(
              padding: const EdgeInsets.all(16.0),
              child: TextField(
                onChanged: (value) {
                  setState(() {
                    searchQuery = value;
                  });
                },
                decoration: InputDecoration(
                  labelText: 'Search $selectedOption',
                  border: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(30.0),
                  ),
                  enabledBorder: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(30.0),
                    borderSide: BorderSide(color: Colors.grey.shade400),
                  ),
                  focusedBorder: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(30.0),
                    borderSide: BorderSide(color: const Color.fromARGB(255, 184, 29, 211)),
                  ),
                  prefixIcon: const Icon(Icons.search),
                ),
              ),
            ),

          // Display videos based on selected course and option
          if (selectedOption == 'Recordings')
            Expanded(
              child: ListView.builder(
                itemCount: filteredRecordings.length,
                itemBuilder: (context, index) {
                  final recording = filteredRecordings[index];
                  final youtubeId = recording['youtubeId']!;
                  final youtubeUrl = 'https://www.youtube.com/watch?v=$youtubeId';

                  return Padding(
                    padding: const EdgeInsets.symmetric(vertical: 8.0, horizontal: 16.0),
                    child: Card(
                      elevation: 4,
                      child: Column(
                        children: [
                          // YouTube player
                          YoutubePlayer(
                            controller: YoutubePlayerController(
                              initialVideoId: youtubeId,
                              flags: const YoutubePlayerFlags(
                                autoPlay: false,
                                mute: false,
                              ),
                            ),
                            showVideoProgressIndicator: true,
                          ),

                          ListTile(
                            title: Text(recording['title']!),
                            trailing: IconButton(
                              icon: const Icon(Icons.open_in_new),
                              onPressed: () async {
                                // Open the video in YouTube
                                if (await canLaunch(youtubeUrl)) {
                                  await launch(youtubeUrl);
                                } else {
                                  throw 'Could not launch $youtubeUrl';
                                }
                              },
                            ),
                          ),
                        ],
                      ),
                    ),
                  );
                },
              ),
            ),

          // For Presentation and Other options
          if (selectedOption == 'Presentation' || selectedOption == 'Other')
            Expanded(
              child: Center(
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: [
                    const Icon(
                      Icons.construction,
                      size: 80.0,
                      color: Colors.amber,
                    ),
                    const SizedBox(height: 20),
                    Text(
                      'Page under construction!',
                      style: Theme.of(context).textTheme.headlineSmall!.copyWith(
                            color: Colors.grey[700],
                            fontWeight: FontWeight.bold,
                          ),
                    ),
                    const SizedBox(height: 10),
                    Text(
                      'We\'re working hard to bring this feature to you.',
                      style: TextStyle(
                        fontSize: 16.0,
                        color: Colors.grey[600],
                      ),
                      textAlign: TextAlign.center,
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
