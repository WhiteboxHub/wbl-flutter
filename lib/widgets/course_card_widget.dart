import 'package:flutter/material.dart';
import 'package:flutter_educational_app_ui/screens/course_screen.dart';
import 'package:flutter_educational_app_ui/theme/colors.dart';

class CourseCardWidget extends StatelessWidget {
  final String courseCategoryImage;
  final String courseCategoryTitle;
  final String numberOfCourses;
  const CourseCardWidget({
    super.key,
    required this.courseCategoryImage,
    required this.courseCategoryTitle,
    required this.numberOfCourses,
  });

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        Navigator.of(context).pushNamed(CourseScreen.routeName);

      },
      child: Container(
        padding: const EdgeInsets.symmetric(horizontal: 16.0, vertical: 16.0),
        decoration: BoxDecoration(
          color: kGreyWhiteColor,
          boxShadow: [
            BoxShadow(
              color: kLightGreyColor,
              blurRadius: 5,
              offset: const Offset(0, 2),
            )
          ],
          borderRadius: BorderRadius.circular(12),
        ),
        child: Column(
          children: [
            ClipRRect(
              borderRadius: BorderRadius.circular(6.0),
              child: Image.asset(
                courseCategoryImage,
                width: double.infinity,
                // height: 100,
                fit: BoxFit.contain,
              ),
            ),
            const SizedBox(height: 16.0),
            Align(
              alignment: Alignment.centerLeft,
              child: Text(
                courseCategoryTitle,
                style: Theme.of(context).textTheme.titleMedium!.copyWith(
                      color: kTextColor,
                    ),
                overflow: TextOverflow.ellipsis,
                maxLines: 1,
              ),
            ),
            Align(
              alignment: Alignment.centerLeft,
              child: Text(
                numberOfCourses,
                style: Theme.of(context).textTheme.bodySmall!.copyWith(
                      color: kTextColor.withOpacity(0.6),
                      fontWeight: FontWeight.bold,
                    ),
                overflow: TextOverflow.ellipsis,
                maxLines: 1,
              ),
            ),
          ],
        ),
      ),
    );
  }
}
