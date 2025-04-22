import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:latexpert/core/constant/strings.dart';
import 'package:latexpert/infra/bloc/profile_bloc/profile_bloc.dart';
import 'package:latexpert/infra/bloc/profile_bloc/profile_event.dart';
import 'package:latexpert/infra/services/auth_service/login_service.dart';
import 'package:latexpert/presentation/profile_screen/profile_screen_list_tile.dart';

import '../auth_screen/registration_screen.dart';


class ProfileScreen extends StatefulWidget {
  const ProfileScreen({super.key});

  @override
  _ProfileScreenState createState() => _ProfileScreenState();
}

class _ProfileScreenState extends State<ProfileScreen>
    with SingleTickerProviderStateMixin {
  late AnimationController _controller;
  late Animation<double> _fadeAnimation;

  @override
  void initState() {
    super.initState();
    _controller = AnimationController(
      vsync: this,
      duration: const Duration(seconds: 1),
    );
    _fadeAnimation = CurvedAnimation(
      parent: _controller,
      curve: Curves.easeIn,
    );
    _controller.forward();
  }

  @override
  void dispose() {
    _controller.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text(Strings.myProfile),
        centerTitle: true,
        actions: [
          IconButton(
            icon: const Icon(Icons.brightness_6),
            onPressed: () {
              context.read<ProfileBloc>().add(ToggleThemeEvent());
            },
          ),
        ],
      ),
      body: SingleChildScrollView(
        child: FadeTransition(
          opacity: _fadeAnimation,
          child: Padding(
            padding: const EdgeInsets.symmetric(horizontal: 16.0),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                const SizedBox(height: 20),
                const Hero(
                  tag: Strings.profilePictureTag,
                  child: CircleAvatar(
                    radius: 50,
                    backgroundImage: AssetImage(Strings.profilePicture),
                  ),
                ),
                const SizedBox(height: 16),
                const Text(
                  Strings.name,
                  style: TextStyle(fontSize: 22, fontWeight: FontWeight.bold),
                ),
                const SizedBox(height: 4),
                const Text(
                  Strings.jobTitle,
                  style: TextStyle(fontSize: 16, color: Colors.grey),
                ),
                const SizedBox(height: 16),
                AnimatedContainer(
                  duration: const Duration(milliseconds: 500),
                  curve: Curves.easeInOut,
                  decoration: BoxDecoration(
                    color: Theme.of(context).cardColor,
                    borderRadius: BorderRadius.circular(12),
                    boxShadow: const [
                      BoxShadow(
                        color: Colors.black26,
                        blurRadius: 4,
                        offset: Offset(0, 2),
                      )
                    ],
                  ),
                  child: Padding(
                    padding: const EdgeInsets.all(16.0),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                      children: [
                        buildStatColumn(Strings.resumesCreated, Strings.resumesCreatedText),
                        Container(
                          height: 50,
                          width: 1,
                          color: Colors.grey[300],
                        ),
                        buildStatColumn(Strings.lastUpdated, Strings.lastUpdatedText),
                      ],
                    ),
                  ),
                ),
                const SizedBox(height: 20),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                  children: [
                    ElevatedButton(
                      onPressed: () {
                        // Create Resume Action
                      },
                      style: ElevatedButton.styleFrom(
                        shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(8),
                        ),
                        padding: const EdgeInsets.symmetric(horizontal: 24, vertical: 12),
                      ),
                      child: const Text(Strings.createResume),
                    ),
                    OutlinedButton(
                      onPressed: () {
                        // Edit Profile Action
                      },
                      style: OutlinedButton.styleFrom(
                        side: const BorderSide(color: Colors.blueAccent),
                        shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(8),
                        ),
                        padding: const EdgeInsets.symmetric(horizontal: 24, vertical: 12),
                      ),
                      child: const Text(Strings.editProfile),
                    ),
                  ],
                ),
                const Divider(),
                buildListTile(Icons.account_circle, Strings.accountSettings, () {}),
                buildListTile(Icons.language, Strings.languageSettings, () {}),
                buildListTile(Icons.privacy_tip, Strings.privacyPolicy, () {}),
                buildListTile(Icons.info_outline, Strings.aboutUs, () {}),
                buildListTile(Icons.settings, Strings.settings, () {}),
                buildListTile(Icons.logout, Strings.logout,  () async {
                  try {
                    await LoginService().logout(); // Call your logout method
                    Navigator.pushAndRemoveUntil(
                      context,
                      MaterialPageRoute(builder: (context) => RegistrationScreen()),
                          (route) => false, // Remove all previous routes
                    );
                  } catch (e) {
                    ScaffoldMessenger.of(context).showSnackBar(
                      SnackBar(content: Text('Logout failed: ${e.toString()}')),
                    );
                  }
                }
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}