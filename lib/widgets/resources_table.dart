import 'dart:convert';
import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'package:shared_preferences/shared_preferences.dart';
import 'package:url_launcher/url_launcher.dart';

enum ComponentType {
  Presentations,
  Cheatsheets,
  Installations,
  Miscellaneous,
  Books,
  Softwares,
}

Future<List<dynamic>?> fetchPresentationData(
    String course, ComponentType type) async {
  try {
    var apiUrl = 'https://www.whitebox-learning.com/api/materials';
    final uri = Uri.parse('$apiUrl?course=$course&search=${type.name}');

    print('Requesting data from: $uri');

    final response = await http.get(uri);

    print('Response status: ${response.statusCode}');
    print('Response body: ${response.body}');

    if (response.statusCode != 200) {
      throw Exception('Network response was not ok');
    }

    final data = json.decode(response.body);
    return data;
  } catch (error) {
    print("Failed to fetch data: $error");
    return null;
  }
}

class ResourcesTable extends StatefulWidget {
  final String course;
  final ComponentType type;

  const ResourcesTable({super.key, required this.course, required this.type});

  @override
  _ResourcesTableState createState() => _ResourcesTableState();
}

class _ResourcesTableState extends State<ResourcesTable> {
  late Future<List<dynamic>?> dataFuture;

  @override
  void initState() {
    super.initState();
    dataFuture = fetchAndCacheData();
  }

  @override
  void didUpdateWidget(ResourcesTable oldWidget) {
    super.didUpdateWidget(oldWidget);
    // Check if the type has changed
    if (widget.type != oldWidget.type) {
      dataFuture = fetchAndCacheData(); // Fetch new data for the new type
    }
  }

  Future<List<dynamic>?> fetchAndCacheData() async {
    final prefs = await SharedPreferences.getInstance();
    final sessionData = prefs.getString('data_${widget.course}_${widget.type}');
    final sessionDataTimestamp =
        prefs.getInt('data_${widget.course}_${widget.type}_timestamp');
    final dataAge =
        DateTime.now().millisecondsSinceEpoch - (sessionDataTimestamp ?? 0);

    if (sessionData != null && dataAge < 86400000) {
      return json.decode(sessionData);
    } else {
      final fetchedData =
          await fetchPresentationData(widget.course, widget.type);
      if (fetchedData != null) {
        prefs.setString(
            'data_${widget.course}_${widget.type}', json.encode(fetchedData));
        prefs.setInt('data_${widget.course}_${widget.type}_timestamp',
            DateTime.now().millisecondsSinceEpoch);
      }
      return fetchedData;
    }
  }

  @override
  Widget build(BuildContext context) {
    return FutureBuilder<List<dynamic>?>(
      future: dataFuture,
      builder: (context, snapshot) {
        if (snapshot.connectionState == ConnectionState.waiting) {
          return const Center(child: CircularProgressIndicator());
        }

        if (snapshot.hasError) {
          return Center(
              child: Text('Error: ${snapshot.error}',
                  style: const TextStyle(color: Colors.red)));
        }

        if (!snapshot.hasData || snapshot.data!.isEmpty) {
          return const Center(child: Text("No data to display"));
        }

        final data = snapshot.data!;

        return Padding(
          padding: const EdgeInsets.symmetric(horizontal: 16.0),
          child: Container(
            decoration: BoxDecoration(
              border: Border(
                left: BorderSide(color: Colors.grey.shade300, width: 1.0),
                right: BorderSide(color: Colors.grey.shade300, width: 1.0),
              ),
            ),
            child: SingleChildScrollView(
              scrollDirection: Axis.vertical,
              child: SingleChildScrollView(
                scrollDirection: Axis.horizontal,
                child: DataTable(
                  decoration: BoxDecoration(
                    border: Border.all(color: Colors.grey.shade300),
                    borderRadius: BorderRadius.circular(8),
                  ),
                  columns: [
                    DataColumn(
                      label: Container(
                        padding: const EdgeInsets.all(8),
                        color: Colors.blue.shade700,
                        child: const Text(
                          "Serial No.",
                          style: TextStyle(
                            color: Colors.white,
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                      ),
                    ),
                    DataColumn(
                      label: Container(
                        padding: const EdgeInsets.all(8),
                        color: Colors.blue.shade700,
                        child: const Text(
                          "Subject Name",
                          style: TextStyle(
                            color: Colors.white,
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                      ),
                    ),
                  ],
                  rows: List<DataRow>.generate(data.length, (index) {
                    final subject = data[index];

                    return DataRow(
                      color: WidgetStateProperty.resolveWith<Color?>(
                        (Set<WidgetState> states) {
                          if (states.contains(WidgetState.hovered)) {
                            return Colors.blue.shade50;
                          }
                          return index.isEven
                              ? Colors.grey.shade100
                              : Colors.white;
                        },
                      ),
                      cells: [
                        DataCell(
                          Padding(
                            padding: const EdgeInsets.all(8.0),
                            child: Text('${index + 1}'),
                          ),
                        ),
                        DataCell(
                          GestureDetector(
                            onTap: () {
                              launchUrl(Uri.parse(subject['link']));
                            },
                            child: Padding(
                              padding: const EdgeInsets.all(8.0),
                              child: Text(
                                subject['name'],
                                style: const TextStyle(
                                  color: Colors.blue,
                                  decoration: TextDecoration.underline,
                                ),
                              ),
                            ),
                          ),
                        ),
                      ],
                    );
                  }),
                ),
              ),
            ),
          ),
        );
      },
    );
  }
}
