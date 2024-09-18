import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:wbl_mobile_app/theme/colors.dart';
import 'package:wbl_mobile_app/widgets/single_course_list_tile_widget.dart';

class CourseScreen extends StatefulWidget {
  static const routeName = '/course-screen';
  const CourseScreen({super.key});

  @override
  State<CourseScreen> createState() => _CourseScreenState();
}

class _CourseScreenState extends State<CourseScreen> {
  final List<Map<String, String>> courses = [
    {
      'courseImage': 'assets/images/flutter.svg',
      'courseTitle': 'Flutter Development',
      'courseSubtitle': 'Complete Flutter Development Course',
    },
        {
      'courseImage': 'assets/images/next.svg',
      'courseTitle': 'Next.JS Development',
      'courseSubtitle': 'Learn Next.JS from Beginner to Advanced',
    },
    {
      'courseImage': 'assets/images/python.svg',
      'courseTitle': 'Python Programming',
      'courseSubtitle': 'Learn Python from Beginner to Advanced',
    },
    {
      'courseImage': 'assets/images/java.svg',
      'courseTitle': 'Java Development',
      'courseSubtitle': 'Become a Java Developer Expert',
    },
    {
      'courseImage': 'assets/images/react.svg',
      'courseTitle': 'React.JS Development',
      'courseSubtitle': 'Learn React from Beginner to Advanced',
    },
    {
      'courseImage': 'assets/images/node.svg',
      'courseTitle': 'Node.JS Development',
      'courseSubtitle': 'Learn Node.JS from Beginner to Advanced',
    },
  ];

  @override
  Widget build(BuildContext context) {
    return AnnotatedRegion<SystemUiOverlayStyle>(
      value: SystemUiOverlayStyle.light,
      child: Scaffold(
        appBar: AppBar(
          backgroundColor: kTransparentColor,
          elevation: 0,
          systemOverlayStyle: SystemUiOverlayStyle(
            statusBarColor: kTransparentColor,
            statusBarIconBrightness: Brightness.dark,
          ),
          leading: IconButton(
            onPressed: () {
              Navigator.of(context).pop();
            },
            icon: const Icon(
              Icons.arrow_back_ios,
              color: Colors.black,
            ),
          ),
          title: Text(
            'Development',
            style: Theme.of(context).textTheme.titleLarge!.copyWith(
                  color: kTextColor,
                  fontWeight: FontWeight.bold,
                ),
          ),
          centerTitle: true,
        ),
        body: SafeArea(
          child: Padding(
            padding: const EdgeInsets.symmetric(horizontal: 16.0, vertical: 8.0),
            child: ListView.builder(
              itemCount: courses.length,
              itemBuilder: (context, index) {
                return Column(
                  children: [
                    SingleCourseListTileWidget(
                      courseImage: courses[index]['courseImage']!,
                      courseTitle: courses[index]['courseTitle']!,
                      courseSubtitle: courses[index]['courseSubtitle']!,
                    ),
                    Divider(
                      color: kTextColor.withOpacity(0.3),
                    ),
                  ],
                );
                
              },
            ),
          ),
        ),
      ),
    );
  }
}
