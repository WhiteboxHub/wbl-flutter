import 'package:flutter/material.dart';
import 'package:youtube_player_flutter/youtube_player_flutter.dart';
import 'package:url_launcher/url_launcher.dart';

class MyLearningScreen extends StatefulWidget {
  static const routeName = '/my-learning';

  const MyLearningScreen({super.key});

  @override
  State<MyLearningScreen> createState() => _MyLearningScreenState();
}

class _MyLearningScreenState extends State<MyLearningScreen> {
  String selectedOption = 'Recordings'; // Default selected option
  String searchQuery = '';

  // List of sample recordings (You can fetch this data from your DB)
  final List<Map<String, String>> recordings = [
    {'title': 'Video 1', 'youtubeId': 'dQw4w9WgXcQ'},
    {'title': 'Video 2', 'youtubeId': 'xvFZjo5PgG0'},
    {'title': 'Video 3', 'youtubeId': '3JZ_D3ELwOQ'},
    {'title': 'Video 4', 'youtubeId': 'eVTXPUF4Oz4'},
    {'title': 'Video 5', 'youtubeId': 'hY7m5jjJ9mM'},
    {'title': 'Video 6', 'youtubeId': '6_b7RDuLwcI'},
  ];

  // Custom colors for button states
  final Color selectedButtonColor = Colors.purple;
  final Color unselectedButtonColor = Colors.grey.shade300;
  final Color selectedTextColor = Colors.white;
  final Color unselectedTextColor = Colors.black;

  YoutubePlayerController? _controller;

  @override
  void dispose() {
    _controller?.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    // Filter recordings based on the search query
    final List<Map<String, String>> filteredRecordings = recordings
        .where((recording) => recording['title']!
            .toLowerCase()
            .contains(searchQuery.toLowerCase()))
        .toList();

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
                    icon: const Icon(Icons.chrome_reader_mode),
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
                    icon: const Icon(Icons.miscellaneous_services),
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
                    borderSide: BorderSide(
                        color: const Color.fromARGB(255, 184, 29, 211)),
                  ),
                  prefixIcon: const Icon(Icons.search),
                ),
              ),
            ),

          // Display top recordings only when 'Recordings' is selected
          if (selectedOption == 'Recordings')
            Expanded(
              child: ListView.builder(
                itemCount: filteredRecordings.length,
                itemBuilder: (context, index) {
                  final recording = filteredRecordings[index];
                  final youtubeId = recording['youtubeId']!;
                  final youtubeUrl =
                      'https://www.youtube.com/watch?v=$youtubeId';

                  return Padding(
                    padding: const EdgeInsets.symmetric(
                        vertical: 8.0, horizontal: 16.0),
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
       
if (selectedOption == 'Presentation' || selectedOption == 'Other')
  Expanded(
    child: Center(
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        crossAxisAlignment: CrossAxisAlignment.center, // Ensure center alignment
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
            textAlign: TextAlign.center, // Ensure text alignment
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
