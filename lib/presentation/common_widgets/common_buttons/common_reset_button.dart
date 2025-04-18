import 'package:flutter/cupertino.dart';
import 'package:latexpert/core/constant/extension.dart';

import '../../../core/constant/theme_colors.dart';

class CommonResetButton extends StatelessWidget {
  final GlobalKey<FormState> formKey;
  final Function onTap;
  const CommonResetButton({super.key, required this.formKey, required this.onTap,});

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        onTap();
        // formKey.currentState!.reset(); // Ensure form is reset
      },
      child: Container(
        height: context.height(context) * 0.067,
        width: context.width(context) * 0.15,
        decoration: BoxDecoration(
          color: ThemeColors.black,
          borderRadius: BorderRadius.circular(10),
        ),
        child: Center(
          child: Icon(
            CupertinoIcons.delete,
            color: ThemeColors.white,
            size: context.height(context) * 0.03,
          ),
        ),
      ),
    );
  }
}
