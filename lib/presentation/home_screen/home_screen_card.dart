import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';

class HomeScreenCard extends StatelessWidget {
  final String title;
  final String description;
  final Color color;
  final String image;
  final VoidCallback onTap;
  final double? height;

  const HomeScreenCard({
    super.key,
    required this.onTap,
    required this.title,
    required this.description,
    required this.color,
    required this.image,
    this.height,
  });

  @override
  Widget build(BuildContext context) {
    return Expanded(
      child: GestureDetector(
        onTap: onTap,
        child: Container(
          height: height,
          margin: const EdgeInsets.symmetric(horizontal: 8),
          decoration: BoxDecoration(
            color: color,
            border: Border.all(color: Colors.black26, width: 2),
            borderRadius: BorderRadius.circular(20).copyWith(
              topRight: const Radius.circular(30),
              topLeft: const Radius.circular(30),
            ),
          ),
          child: Padding(
            padding: const EdgeInsets.all(12.0),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Expanded(
                  child: SizedBox(
                    width: double.infinity,
                    child: SvgPicture.asset(
                      image,
                      fit: BoxFit.contain,
                    ),
                  ),
                ),
                const SizedBox(height: 10),
                Text(
                  title,
                  style: Theme.of(context).textTheme.titleMedium?.copyWith(
                    fontWeight: FontWeight.w500,
                    fontSize: 18,
                  ),
                  maxLines: 1,
                  overflow: TextOverflow.ellipsis,
                ),
                const SizedBox(height: 10),
                Text(
                  description,
                  style: Theme.of(context).textTheme.bodyMedium,
                  maxLines: 2,
                  overflow: TextOverflow.ellipsis,
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}