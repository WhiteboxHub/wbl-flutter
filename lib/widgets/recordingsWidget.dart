import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'dart:convert';
import 'package:url_launcher/url_launcher.dart';
import 'package:shimmer/shimmer.dart'; // Add shimmer package for loading effect

class RecordingsWidget extends StatefulWidget {
  final String searchQuery;
  final String apiUrl;
  final String selectedCourse;

  const RecordingsWidget({
    super.key,
    required this.searchQuery,
    required this.apiUrl,
    required this.selectedCourse,
  });

  @override
  _RecordingsWidgetState createState() => _RecordingsWidgetState();
}
class _RecordingsWidgetState extends State<RecordingsWidget> {
  List<Map<String, String>> filteredRecordings = [];
  bool isLoading = true;
  String? errorMessage;

  @override
  void initState() {
    super.initState();
    fetchRecordings(); // Fetch initially when widget loads
  }

  @override
  void didUpdateWidget(covariant RecordingsWidget oldWidget) {
    super.didUpdateWidget(oldWidget);
    // Fetch recordings again when search query changes
    if (widget.searchQuery != oldWidget.searchQuery) {
      fetchRecordings();
    }
  }

  Future<void> fetchRecordings({int limit = 10}) async {
    setState(() {
      isLoading = true;
      errorMessage = null;
    });

    final apiUrlWithParams =
        '${widget.apiUrl}?course=${widget.selectedCourse}&search=${widget.searchQuery}&limit=$limit'; // Use searchQuery

    try {
      print('Fetching recordings from: $apiUrlWithParams');
      final response = await http.get(Uri.parse(apiUrlWithParams));

      print('Response status code: ${response.statusCode}');

      if (response.statusCode == 200) {
        final Map<String, dynamic> decodedResponse = json.decode(response.body);
        final List<dynamic> recordings = decodedResponse['batch_recordings'];

        print('Fetched recordings: ${recordings.length} items');

        setState(() {
          filteredRecordings = recordings.map((item) {
            return {
              'title': item['description'] as String,
              'youtubeId': item['videoid'] as String,
            };
          }).toList();
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

  @override
  Widget build(BuildContext context) {
    if (isLoading) {
      return GridView.builder(
        padding: const EdgeInsets.all(16.0),
        itemCount: 6, // Show 6 placeholders while loading
        gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
          crossAxisCount: 1,
          crossAxisSpacing: 16.0,
          mainAxisSpacing: 16.0,
          childAspectRatio: 16 / 9,
        ),
        itemBuilder: (context, index) => _shimmerPlaceholder(),
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

    return Expanded(
      child: GridView.builder(
        padding: const EdgeInsets.all(16.0),
        itemCount: filteredRecordings.length,
        gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
          crossAxisCount: 2,
          crossAxisSpacing: 10,
          mainAxisSpacing: 10,
          childAspectRatio: 8 / 5,
        ),
        itemBuilder: (context, index) {
          final recording = filteredRecordings[index];
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
                  // Video Thumbnail
                  ClipRRect(
                    borderRadius: BorderRadius.circular(16.0),
                    child: Image.network(
                      youtubeThumbnail,
                      fit: BoxFit.cover,
                      width: double.infinity,
                      height: double.infinity,
                    ),
                  ),

                  // Overlay Gradient for better text visibility
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

                  // Video Title and Action Buttons
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
                            // Play Button with animation
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
                            // Like Button
                            IconButton(
                              icon: const Icon(
                                Icons.favorite_border,
                                color: Colors.white,
                              ),
                              onPressed: () {
                                // Handle like action
                              },
                            ),
                            // Share Button
                            IconButton(
                              icon: const Icon(
                                Icons.share,
                                color: Colors.white,
                              ),
                              onPressed: () {
                                // Handle share action
                              },
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
