import 'package:flutter/material.dart';
import 'package:latexpert/domain/achievement_info_model/achievement_info_model.dart';

class AchievementControllers {
  final TextEditingController title;
  final TextEditingController link;
  final TextEditingController issuer;

  AchievementControllers({
    required this.title,
    required this.link,
    required this.issuer,
  });

  void dispose() {
    title.dispose();
    link.dispose();
    issuer.dispose();
  }

}

extension AchievementControllerExtension on AchievementControllers {
  AchievementInfoModel toModel() {
    return AchievementInfoModel(
      link: link.text,
      title: title.text,
      issuer: issuer.text,
    );
  }
}
