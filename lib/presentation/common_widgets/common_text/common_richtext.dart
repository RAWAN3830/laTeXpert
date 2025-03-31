import 'package:flutter/material.dart';
import 'package:latexpert/core/constant/strings.dart';

class CommonRichText extends StatelessWidget {
  final String title;

  const CommonRichText({super.key, required this.title});

  @override
  Widget build(BuildContext context) {
    return RichText(
      text: TextSpan(
        style: Theme.of(context)
            .textTheme
            .headlineSmall
            ?.copyWith(fontWeight: FontWeight.bold),
        children: <TextSpan>[
          TextSpan(text: title),
          const TextSpan(
              text: '.',
              style: TextStyle(
                  fontFamily: Strings.uberFont,
                  fontSize: 5,
                  color: Colors.lightGreen,
                  fontWeight: FontWeight.w500)),
        ],
      ),
    );
  }
}
