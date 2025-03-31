import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:latexpert/core/constant/extension.dart';


class HomeScreenCard extends StatelessWidget {
 final String title;
 final String description;
 final Color color;
 final String image;
 final VoidCallback onTap;

  const HomeScreenCard({super.key,
    required this.onTap,
    required  this.title,
    required  this.description,
    required  this.color,
  required this.image});

  @override
  Widget build(BuildContext context) {
    return Expanded(
      child: GestureDetector(
        onTap: onTap,
        child: Container(
          height: 240,
          margin: const EdgeInsets.symmetric(horizontal: 8),
          decoration: BoxDecoration(
            color:  color,
            border: Border.all(color: Colors.black26,width: 2),
            borderRadius: BorderRadius.circular(20).copyWith(topRight: const Radius.circular(30),topLeft: const Radius.circular(30)),
          ),
          child: Padding(
            padding: const EdgeInsets.all(12.0),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Expanded(
                  child: SizedBox(
                    height: context.height(context) * 0.12,
                    width: double.infinity,
                    child: SvgPicture.asset(image),
                  ),
                ),
                // SvgPicture.asset(AssetsSvgImage.skillset),
                const SizedBox(height: 10,),
                Text(
                  title,
                  style: Theme.of(context)
                      .textTheme
                      . titleMedium
                      ?.copyWith(fontWeight: FontWeight.w500,fontSize: 18)
                ),
                const SizedBox(height: 10,),
                Text(
                  description,
                  style:Theme.of(context)
                      .textTheme
                      . labelMedium

                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}

