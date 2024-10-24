// import 'package:flutter/material.dart';
// import 'package:flutter/services.dart';
// import 'package:wbl_mobile_app/theme/colors.dart';
// import 'package:wbl_mobile_app/widgets/course_card_widget.dart';

// class FeaturedScreen extends StatefulWidget {
//   static const routeName = '/featured-screen';
//   const FeaturedScreen({super.key});

//   @override
//   State<FeaturedScreen> createState() => _FeaturedScreenState();
// }

// class _FeaturedScreenState extends State<FeaturedScreen> {
//   @override
//   Widget build(BuildContext context) {
//     return const AnnotatedRegion<SystemUiOverlayStyle>(
//       value: SystemUiOverlayStyle.light,
//       child: Scaffold(
//         body: Column(
//           children: [
//             // AppBarWidget(),
//             HomeBodyWidget(),
//           ],
//         ),
//       ),
//     );
//   }
// }

// class HomeBodyWidget extends StatelessWidget {
//   const HomeBodyWidget({super.key});

//   final List<Map<String, String>> courses = const [
//     {
//       'courseCategoryImage': 'assets/images/machine_learning.jpeg',
//       'courseCategoryTitle': 'Machine Learning',
//       'numberOfCourses': 'Enroll Now',
//     },
//     {
//       'courseCategoryImage': 'assets/images/data_engineer.jpg',
//       'courseCategoryTitle': 'Data Engineering',
//       'numberOfCourses': 'Enroll Now',
//     },
//     {
//       'courseCategoryImage': 'assets/images/fullstack_development.jpeg',
//       'courseCategoryTitle': 'Fullstack Development',
//       'numberOfCourses': 'Enroll Now',
//     },
//     // {
//     //   'courseCategoryImage': 'assets/images/content-strategy.png',
//     //   'courseCategoryTitle': 'Quality Engineering',
//       // 'numberOfCourses': '10+ Courses',
//     // },
//   ];

//   @override
//   Widget build(BuildContext context) {
//     return Expanded(
//       child: Padding(
//         padding: const EdgeInsets.symmetric(horizontal: 16.0, vertical: 8.0),
//         child: Column(
//           crossAxisAlignment: CrossAxisAlignment.start,
//           children: [
//             Padding(
//               padding: const EdgeInsets.symmetric(horizontal: 16.0, vertical: 8.0),
//               child: Row(
//                 mainAxisAlignment: MainAxisAlignment.spaceBetween,
//                 children: [
//                   Text(
//                     'Explore Courses',
//                     style: Theme.of(context).textTheme.titleLarge!.copyWith(
//                           color: kTextColor,
//                           fontWeight: FontWeight.bold,
//                         ),
//                     overflow: TextOverflow.ellipsis,
//                     maxLines: 1,
//                   ),
//                   MaterialButton(
//                     onPressed: () {},
//                     child: Text(
//                       'View More',
//                       style: Theme.of(context).textTheme.bodySmall!.copyWith(
//                             color: kTextColor,
//                             fontWeight: FontWeight.bold,
//                           ),
//                       overflow: TextOverflow.ellipsis,
//                       maxLines: 1,
//                     ),
//                   ),
//                 ],
//               ),
//             ),
//             Expanded(
//               child: GridView.builder(
//                 padding: const EdgeInsets.symmetric(horizontal: 16.0, vertical: 8.0),
//                 itemCount: courses.length,
//                 physics: const BouncingScrollPhysics(),
//                 shrinkWrap: true,
//                 gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
//                   crossAxisCount: 2,
//                   mainAxisSpacing: 10.0,
//                   crossAxisSpacing: 10.0,
//                   childAspectRatio: 0.7,
//                 ),
//                 itemBuilder: (context, index) {
//                   final course = courses[index];
//                   return CourseCardWidget(
//                     courseCategoryImage: course['courseCategoryImage']!,
//                     courseCategoryTitle: course['courseCategoryTitle']!,
//                     numberOfCourses: course['numberOfCourses']!,
//                   );
//                 },
//               ),
//             ),
//           ],
//         ),
//       ),
//     );
//   }
// }



import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:google_fonts/google_fonts.dart'; // Import Google Fonts
import 'package:wbl_mobile_app/theme/colors.dart';
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
    return AnnotatedRegion<SystemUiOverlayStyle>(
      value: SystemUiOverlayStyle.light,
      child: Scaffold(
        body: Stack(
          children: [
            // Add background shapes using Positioned widgets
            Positioned(
              top: -100,
              left: -50,
              child: Container(
                height: 200,
                width: 200,
                decoration: BoxDecoration(
                  shape: BoxShape.circle,
                  // color: kPurpleColor.withOpacity(0.2),
                  color: const Color.fromARGB(255, 80, 141, 255).withOpacity(0.4),
                ),
              ),
            ),
            Positioned(
              bottom: -120,
              right: -40,
              child: Container(
                height: 250,
                width: 250,
                decoration: BoxDecoration(
                  shape: BoxShape.circle,
                  // color: kPrimarySwatchColor.withOpacity(0.2),
                  color: const Color.fromARGB(255, 124, 80, 255).withOpacity(0.4),
                ),
              ),
            ),
            Column(
              children: const [
                Expanded(child: HomeBodyWidget()),
              ],
            ),
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
  ];

  @override
  Widget build(BuildContext context) {
    return Padding(
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
                  style: GoogleFonts.poppins(
                    textStyle: Theme.of(context).textTheme.titleLarge!.copyWith(
                          color: kTextColor,
                          fontWeight: FontWeight.bold,
                          fontSize: 22,
                        ),
                  ),
                  overflow: TextOverflow.ellipsis,
                  maxLines: 1,
                ),
                MaterialButton(
                  onPressed: () {},
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(30),
                  ),
                  color: kPurpleColor.withOpacity(0.15),
                  child: Text(
                    'View More',
                    style: GoogleFonts.poppins(
                      textStyle: Theme.of(context).textTheme.bodySmall!.copyWith(
                            color: kPurpleColor,
                            fontWeight: FontWeight.w600,
                          ),
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
                mainAxisSpacing: 16.0,
                crossAxisSpacing: 16.0,
                childAspectRatio: 0.75,
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
    );
  }
}
