import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:latexpert/core/constant/extension.dart';
import '../../core/constant/theme_colors.dart';

class HomeScreenCard2 extends StatelessWidget {
  final String title;
  final String description;
  final Color color;
  final String image;
  final VoidCallback onTap;
  const HomeScreenCard2(
      {super.key,
      required this.title,
      required this.description,
      required this.color,
      required this.image,
      required this.onTap});

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onTap,
      child: Padding(
        padding: const EdgeInsets.only(left: 8, right: 8),
        child: Container(
          height: context.height(context) * 0.17,
          padding: const EdgeInsets.all(16),
          decoration: BoxDecoration(
            border: Border.all(color: Colors.black26, width: 2),
            color: Colors.lightBlue[200],
            borderRadius: BorderRadius.circular(16),
          ),
          child: Row(
            children: [
              Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    title,
                    style: Theme.of(context)
                        .textTheme
                        .bodyLarge
                        ?.copyWith(fontWeight: FontWeight.w600, fontSize: 18),
                  ),
                  const SizedBox(height: 8),
                  Text(description,
                      style: Theme.of(context).textTheme.bodyMedium
                      // TextStyle(fontSize: 16, color: Colors.grey[800]),
                      ),
                  const SizedBox(height: 16),
                  Align(
                    alignment: Alignment.centerLeft,
                    child: ElevatedButton(
                      onPressed: () {},
                      style: ElevatedButton.styleFrom(
                        backgroundColor: Colors.black,
                        shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(8),
                        ),
                      ),
                      child: Text('Read More',
                          style: Theme.of(context).textTheme.bodyLarge?.copyWith(
                              fontWeight: FontWeight.w600,

                              color: ThemeColors.white)),
                    ),
                  ),
                ],
              ),
              Expanded(
                child: SizedBox(
                  height: context.height(context) * 0.15,
                  child: SvgPicture.asset(image),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
