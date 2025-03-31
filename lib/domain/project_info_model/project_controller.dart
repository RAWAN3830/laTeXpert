import 'package:flutter/cupertino.dart';

class ProjectControllers {
  final TextEditingController project_title;
  final TextEditingController technologies;
  final TextEditingController link;
  final TextEditingController description;

  ProjectControllers(
      {required this.project_title,
        required this. technologies,
        required this.link,
        required this.description});
}
