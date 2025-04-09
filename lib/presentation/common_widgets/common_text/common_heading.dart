import 'package:flutter/material.dart';
import 'package:latexpert/core/constant/strings.dart';

import '../../../core/constant/theme_colors.dart';

class CommonHeading extends StatelessWidget {
  final String title;

  const CommonHeading({super.key, required this.title});

  @override
  Widget build(BuildContext context) {
    return Align(
      alignment: Alignment.centerLeft,
      child: RichText(
        text: TextSpan(
          style: Theme.of(context)
              .textTheme
              .titleLarge
              ?.copyWith(fontWeight: FontWeight.w500),
          children: <TextSpan>[
            TextSpan(text: title),
            TextSpan(
              text: Strings.dot,
              style: Theme.of(context).textTheme.displayLarge?.copyWith(
                  fontWeight: FontWeight.w400,
                  color: ThemeColors.mainGreenColor),
            ),
          ],
        ),
      ),
    );
  }
}
