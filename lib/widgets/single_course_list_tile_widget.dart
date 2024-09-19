import 'package:flutter/material.dart';
import 'package:wbl_mobile_app/theme/colors.dart';
import 'package:flutter_svg/svg.dart';

class SingleCourseListTileWidget extends StatelessWidget {
  final String courseImage;
  final String courseTitle;
  final String courseSubtitle;
  const SingleCourseListTileWidget({
    super.key,
    required this.courseImage,
    required this.courseTitle,
    required this.courseSubtitle,
  });

  @override
  Widget build(BuildContext context) {
    return ListTile(
      leading: Container(
        padding: const EdgeInsets.all(8.0),
        decoration: BoxDecoration(
          border: Border.all(
            color: kTextColor,
            width: 1.5,
          ),
          borderRadius: BorderRadius.circular(8.0),
        ),
        child: SvgPicture.asset(
          courseImage,
          width: 40,
        ),
      ),
      title: Text(
        courseTitle,
        style: Theme.of(context).textTheme.bodyLarge!.copyWith(
              color: kTextColor,
              fontWeight: FontWeight.bold,
            ),
        overflow: TextOverflow.ellipsis,
        maxLines: 1,
      ),
      subtitle: Text(
        courseSubtitle,
        style: Theme.of(context)
            .textTheme
            .bodySmall!
            .copyWith(color: kTextColor.withOpacity(0.8)),
        overflow: TextOverflow.ellipsis,
        maxLines: 1,
      ),
    );
  }
}
