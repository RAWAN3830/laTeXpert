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

  @override
  void initState() {
    super.initState();
    Future.delayed(const Duration(seconds: 3), () {
      setState(() => _isLoading = false);
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

  // Determine device type based on width
  String getDeviceType(double width) {
    if (width <= 450) return 'mobile'; // Mobile
    if (width <= 850) return 'tablet'; // Tablet
    return 'desktop'; // Desktop
  }

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
              radius: 20,
              backgroundImage: NetworkImage(
                'https://iconscout.com/3d-illustration/man-avatar-6299539',
              ),
            ),
            Text(
              appBarTitle,
              style: Theme.of(context)
                  .textTheme
                  .titleLarge
                  ?.copyWith(color: Colors.white),
            ),
            Icon(menuIcon, color: Colors.white),
          ],
        ),
      ),
      body: LayoutBuilder(
        builder: (context, constraints) {
          final deviceType = getDeviceType(constraints.maxWidth);
          final screenHeight = MediaQuery.of(context).size.height;

          return SingleChildScrollView(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Padding(
                  padding: const EdgeInsets.all(16.0),
                  child: _buildHeader(context, constraints),
                ),
                Container(
                  width: double.infinity,
                  decoration: const BoxDecoration(
                    color: Colors.white,
                    borderRadius: BorderRadius.vertical(top: Radius.circular(50)),
                  ),
                  child: Padding(
                    padding: const EdgeInsets.all(16.0),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        _buildTopCards(context, constraints, deviceType, screenHeight),
                        const SizedBox(height: 20),
                        _buildMiddleCard(context, constraints, deviceType, screenHeight),
                        const SizedBox(height: 20),
                        _buildBottomCard(context, constraints, deviceType, screenHeight),
                      ],
                    ),
                  ),
                ),
              ],
            ),
          );
        },
      ),
    );
  }

  Widget _buildHeader(BuildContext context, BoxConstraints constraints) {
    return _isLoading
        ? Shimmer.fromColors(
      baseColor: Colors.grey[300]!,
      highlightColor: Colors.grey[100]!,
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Container(
            width: constraints.maxWidth * 0.5,
            height: 30,
            color: Colors.white,
          ),
          const SizedBox(height: 8),
          Container(
            width: constraints.maxWidth * 0.7,
            height: 10,
            color: Colors.white,
          ),
        ],
      ),
    )
        : Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          welcomeText,
          style: Theme.of(context).textTheme.headlineMedium?.copyWith(
            fontWeight: FontWeight.w500,
            color: ThemeColors.white,
          ),
        ),
        const SizedBox(height: 8),
        Text(
          createResumePrompt,
          style: Theme.of(context)
              .textTheme
              .bodyLarge
              ?.copyWith(color: ThemeColors.white),
        ),
      ],
    );
  }

  Widget _buildTopCards(BuildContext context, BoxConstraints constraints, String deviceType, double screenHeight) {
    final cardHeight = deviceType == 'mobile'
        ? screenHeight * 0.25 // 25% for mobile
        : deviceType == 'tablet'
        ? screenHeight * 0.35 // 35% for tablet
        : screenHeight * 0.45; // 45% for desktop

    return _isLoading
        ? Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        shimmerCardPlaceholder(width: constraints.maxWidth * 0.45, height: cardHeight),
        shimmerCardPlaceholder(width: constraints.maxWidth * 0.45, height: cardHeight),
      ],
    )
        : Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        HomeScreenCard(
          title: createResumeTitle,
          description: createResumeDescription,
          color: Colors.amber.shade300,
          image: AssetsSvgImage.createResume,
          onTap: () => context.push(context, target: const ResumeBuilderScreen()),
          height: cardHeight,
        ),
        HomeScreenCard(
          title: yourTemplateTitle,
          description: yourTemplateDescription,
          color: Colors.green.shade300,
          image: AssetsSvgImage.yourTemplate,
          onTap: () => context.push(context, target: const ProfileScreen()),
          height: cardHeight,
        ),
      ],
    );
  }

  Widget _buildMiddleCard(BuildContext context, BoxConstraints constraints, String deviceType, double screenHeight) {
    final cardHeight = deviceType == 'mobile'
        ? screenHeight * 0.20 // 20% for mobile
        : deviceType == 'tablet'
        ? screenHeight * 0.30 // 30% for tablet
        : screenHeight * 0.40; // 40% for desktop

    return _isLoading
        ? shimmerCardPlaceholder(width: constraints.maxWidth, height: cardHeight)
        : HomeScreenCard2(
      title: chooseTemplateTitle,
      description: chooseTemplateDescription,
      color: Colors.lightBlue.shade200,
      image: AssetsSvgImage.resumeFolder,
      onTap: () {},
      height: cardHeight,
    );
  }

  Widget _buildBottomCard(BuildContext context, BoxConstraints constraints, String deviceType, double screenHeight) {
    final cardHeight = deviceType == 'mobile'
        ? screenHeight * 0.15 // 15% for mobile
        : deviceType == 'tablet'
        ? screenHeight * 0.20 // 20% for tablet
        : screenHeight * 0.25; // 25% for desktop

    return _isLoading
        ? shimmerCardPlaceholder(width: constraints.maxWidth, height: cardHeight)
        : Container(
      width: constraints.maxWidth,
      height: cardHeight,
      padding: const EdgeInsets.all(12),
      decoration: BoxDecoration(
        border: Border.all(color: Colors.black26, width: 2),
        color: Colors.red.shade300,
        borderRadius: BorderRadius.circular(16),
      ),
      child: Row(
        children: [
          SizedBox(
            width: constraints.maxWidth * 0.25,
            child: SvgPicture.asset(AssetsSvgImage.completeSteps),
          ),
          const SizedBox(width: 16),
          Expanded(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Text(
                  yourDraftTitle,
                  style: Theme.of(context)
                      .textTheme
                      .titleLarge
                      ?.copyWith(fontWeight: FontWeight.bold),
                ),
                Text(
                  yourDraftLastUpdated,
                  style: Theme.of(context).textTheme.bodyMedium,
                ),
              ],
            ),
          ),
          Icon(forwardIcon),
        ],
      ),
    );
  }

  Widget shimmerCardPlaceholder({required double width, required double height}) {
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