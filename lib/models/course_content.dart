class CourseContent {
  final String fundamentals;
  final String dsml;
  final String ui;
  final String qe;

  CourseContent({
    required this.fundamentals,
    required this.dsml,
    required this.ui,
    required this.qe,
  });

  factory CourseContent.fromJson(Map<String, dynamic> json) {
    return CourseContent(
      fundamentals: json['Fundamentals'] ?? '',
      dsml: json['DSML'] ?? '',
      ui: json['UI'] ?? '',
      qe: json['QE'] ?? '',
    );
  }
}
