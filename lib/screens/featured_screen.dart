import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:wbl_mobile_app/theme/colors.dart';
import 'package:wbl_mobile_app/widgets/app_bar_widget.dart';
import 'package:wbl_mobile_app/widgets/course_card_widget.dart';

class FeaturedScreen extends StatefulWidget {
  static const routeName = '/featured-screen';
  const FeaturedScreen({super.key});

  @override
  State<FeaturedScreen> createState() => _FeaturedScreenState();
}

class _FeaturedScreenState extends State<FeaturedScreen> {
  @override
  Widget build(BuildContext context) {
    return const AnnotatedRegion<SystemUiOverlayStyle>(
      value: SystemUiOverlayStyle.light,
      child: Scaffold(
        body: Column(
          children: [
            AppBarWidget(),
            HomeBodyWidget(),
          ],
        ),
      ),
    );
  }
}

class HomeBodyWidget extends StatelessWidget {
  const HomeBodyWidget({super.key});

  final List<Map<String, String>> courses = const [
    {
      'courseCategoryImage': 'assets/images/machine_learning.jpeg',
      'courseCategoryTitle': 'Machine Learning',
      'numberOfCourses': 'Enroll Now',
    },
    {
      'courseCategoryImage': 'assets/images/data_engineer.jpg',
      'courseCategoryTitle': 'Data Engineering',
      'numberOfCourses': 'Enroll Now',
    },
    {
      'courseCategoryImage': 'assets/images/fullstack_development.jpeg',
      'courseCategoryTitle': 'Fullstack Development',
      'numberOfCourses': 'Enroll Now',
    },
    // {
    //   'courseCategoryImage': 'assets/images/content-strategy.png',
    //   'courseCategoryTitle': 'Quality Engineering',
      // 'numberOfCourses': '10+ Courses',
    // },
  ];

  @override
  Widget build(BuildContext context) {
    return Expanded(
      child: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 16.0, vertical: 8.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 16.0, vertical: 8.0),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Text(
                    'Explore Courses',
                    style: Theme.of(context).textTheme.titleLarge!.copyWith(
                          color: kTextColor,
                          fontWeight: FontWeight.bold,
                        ),
                    overflow: TextOverflow.ellipsis,
                    maxLines: 1,
                  ),
                  MaterialButton(
                    onPressed: () {},
                    child: Text(
                      'View More',
                      style: Theme.of(context).textTheme.bodySmall!.copyWith(
                            color: kTextColor,
                            fontWeight: FontWeight.bold,
                          ),
                      overflow: TextOverflow.ellipsis,
                      maxLines: 1,
                    ),
                  ),
                ],
              ),
            ),
            Expanded(
              child: GridView.builder(
                padding: const EdgeInsets.symmetric(horizontal: 16.0, vertical: 8.0),
                itemCount: courses.length,
                physics: const BouncingScrollPhysics(),
                shrinkWrap: true,
                gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                  crossAxisCount: 2,
                  mainAxisSpacing: 10.0,
                  crossAxisSpacing: 10.0,
                  childAspectRatio: 0.7,
                ),
                itemBuilder: (context, index) {
                  final course = courses[index];
                  return CourseCardWidget(
                    courseCategoryImage: course['courseCategoryImage']!,
                    courseCategoryTitle: course['courseCategoryTitle']!,
                    numberOfCourses: course['numberOfCourses']!,
                  );
                },
              ),
            ),
          ],
        ),
      ),
    );
  }
}
