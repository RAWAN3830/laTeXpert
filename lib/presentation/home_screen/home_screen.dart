import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:shimmer/shimmer.dart';
import 'package:latexpert/core/constant/assets_svg_image.dart';
import 'package:latexpert/core/constant/extension.dart';
import 'package:latexpert/core/constant/strings.dart';
import 'package:latexpert/core/constant/theme_colors.dart';
import 'package:latexpert/presentation/home_screen/home_screen_card.dart';
import 'package:latexpert/presentation/home_screen/home_screen_card2.dart';
import 'package:latexpert/presentation/profile_screen/profile_screen.dart';

import '../Resume_builder_screen/resume_builder_screen.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  bool _isLoading = true;

  // Simulate a delay for loading
  @override
  void initState() {
    super.initState();
    Future.delayed(const Duration(seconds: 3), () {
      setState(() {
        _isLoading = false;
      });
    });
  }

  // Strings
  final String appBarTitle = Strings.resumeBuilder;
  final String welcomeText = Strings.welcomeUser("");
  final String createResumePrompt = Strings.createResumePrompt;
  final String createResumeTitle = Strings.createResume;
  final String createResumeDescription = Strings.createResumeDescription;
  final String yourTemplateTitle = Strings.yourTemplate;
  final String yourTemplateDescription = Strings.yourTemplateDescription;
  final String chooseTemplateTitle = Strings.chooseTemplate;
  final String chooseTemplateDescription = Strings.chooseTemplateDescription;
  final String yourDraftTitle = Strings.yourDraft;
  final String yourDraftLastUpdated = Strings.lastUpdatedDate("date time");

  // Icons
  final IconData menuIcon = Icons.menu;
  final IconData forwardIcon = Icons.arrow_forward_ios;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.black,
      appBar: AppBar(
        backgroundColor: Colors.black,
        elevation: 0,
        title: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            const CircleAvatar(
              backgroundImage: NetworkImage(
                'https://iconscout.com/3d-illustration/man-avatar-6299539',
              ),
            ),
            Text(
              appBarTitle,
              style: const TextStyle(fontSize: 18, color: Colors.white),
            ),
            Icon(
              menuIcon,
              color: Colors.white,
            ),
          ],
        ),
      ),
      body: Column(
        mainAxisAlignment: MainAxisAlignment.start,
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          const SizedBox(height: 20),
          if (_isLoading)
            Shimmer.fromColors(
              baseColor: Colors.grey[300]!,
              highlightColor: Colors.grey[100]!,
              child: Container(
                height: 30,
                margin: const EdgeInsets.symmetric(horizontal: 16),
                color: Colors.white,
              ),
            )
          else
            Text(
              welcomeText,
              style: Theme.of(context).textTheme.headlineMedium?.copyWith(
                    fontWeight: FontWeight.w500,
                    color: ThemeColors.white,
                  ),
            ),
          const SizedBox(height: 8),
          if (_isLoading)
            Shimmer.fromColors(
              baseColor: Colors.grey[300]!,
              highlightColor: Colors.grey[100]!,
              child: Container(
                height: 10,
                margin: const EdgeInsets.symmetric(horizontal: 16),
                color: Colors.white,
              ),
            )
          else
            Text(
              createResumePrompt,
              style: Theme.of(context)
                  .textTheme
                  .bodyLarge
                  ?.copyWith(color: ThemeColors.white),
            ),
          const SizedBox(height: 20),
          Expanded(
            child: Container(
              width: double.infinity,
              decoration: const BoxDecoration(
                color: Colors.white,
                borderRadius: BorderRadius.only(
                  topLeft: Radius.circular(50),
                  topRight: Radius.circular(50),
                ),
              ),
              child: Padding(
                padding: const EdgeInsets.all(16.0),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    const SizedBox(height: 10),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: _isLoading
                          ? [
                              shimmerCardPlaceholder(
                                  width: context.width(context) * 0.4),
                              shimmerCardPlaceholder(
                                  width: context.width(context) * 0.4),
                            ]
                          : [
                              HomeScreenCard(
                                title: createResumeTitle,
                                description: createResumeDescription,
                                color: Colors.amber.shade300,
                                image: AssetsSvgImage.createResume,
                                onTap: () {
                                  context.push(context,
                                      target: const ResumeBuilderScreen());
                                },
                              ),
                              HomeScreenCard(
                                title: yourTemplateTitle,
                                description: yourTemplateDescription,
                                color: Colors.green.shade300,
                                image: AssetsSvgImage.yourTemplate,
                                onTap: () {
                                  context.push(context,
                                      target: const ProfileScreen());
                                },
                              ),
                            ],
                    ),
                    const SizedBox(height: 20),
                    Expanded(
                      child: _isLoading
                          ? Row(
                              mainAxisAlignment: MainAxisAlignment.center,
                              crossAxisAlignment: CrossAxisAlignment.center,
                              children: [
                                shimmerCardPlaceholder(width: 410, height: 200),
                              ],
                            )
                          : HomeScreenCard2(
                              title: chooseTemplateTitle,
                              description: chooseTemplateDescription,
                              color: Colors.lightBlue.shade200,
                              image: AssetsSvgImage.resumeFolder,
                              onTap: () {},
                            ),
                    ),
                    _isLoading
                        ? shimmerCardPlaceholder(width: double.infinity)
                        : Expanded(
                            child: Padding(
                              padding:
                                  const EdgeInsets.all(8).copyWith(top: 20),
                              child: Container(
                                height: context.height(context) * 0.12,
                                padding: const EdgeInsets.all(12),
                                decoration: BoxDecoration(
                                  border: Border.all(
                                      color: Colors.black26, width: 2),
                                  color: Colors.red.shade300,
                                  borderRadius: BorderRadius.circular(16),
                                ),
                                child: Row(
                                  children: [
                                    SizedBox(
                                      width: 100,
                                      height: 100,
                                      child: SvgPicture.asset(
                                          AssetsSvgImage.completeSteps),
                                    ),
                                    const SizedBox(width: 16),
                                    Expanded(
                                      child: Column(
                                        crossAxisAlignment:
                                            CrossAxisAlignment.start,
                                        mainAxisAlignment:
                                            MainAxisAlignment.center,
                                        children: [
                                          Text(
                                            yourDraftTitle,
                                            style: const TextStyle(
                                              fontSize: 18,
                                              fontWeight: FontWeight.bold,
                                            ),
                                          ),
                                          Text(
                                            yourDraftLastUpdated,
                                            style: const TextStyle(
                                              fontSize: 16,
                                            ),
                                          ),
                                        ],
                                      ),
                                    ),
                                    Icon(forwardIcon),
                                  ],
                                ),
                              ),
                            ),
                          ),
                  ],
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }

  // Shimmer card placeholder widget
  Widget shimmerCardPlaceholder({double width = 200, double height = 200}) {
    return Shimmer.fromColors(
      baseColor: Colors.grey[300]!,
      highlightColor: Colors.grey[100]!,
      child: Container(
        width: width,
        height: height,
        decoration: BoxDecoration(
          color: Colors.white,
          borderRadius: BorderRadius.circular(16),
        ),
      ),
    );
  }
}
