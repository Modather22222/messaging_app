import 'package:flutter/material.dart';
import 'package:messaging_app/utils/app_routes.dart';
import 'package:messaging_app/utils/app_constants.dart';

class SplashScreen extends StatelessWidget {
  const SplashScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppConstants.primaryPurple,
      body: SafeArea(
        child: Center(
          child: Padding(
            padding: const EdgeInsets.symmetric(
              horizontal: AppConstants.paddingLarge,
            ),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: <Widget>[
                const Icon(
                  Icons.chat_bubble,
                  size: 100,
                  color: AppConstants.white,
                ),
                const SizedBox(height: AppConstants.spacingLarge),
                const Text(
                  AppConstants.splashTitle,
                  textAlign: TextAlign.center,
                  style: TextStyle(
                    color: AppConstants.white,
                    fontSize: 24,
                    fontFamily: 'Sans-serif',
                  ),
                ),
                const SizedBox(height: AppConstants.spacingExtraLarge),
                ElevatedButton(
                  style: ElevatedButton.styleFrom(
                    backgroundColor: AppConstants.white,
                    padding: const EdgeInsets.symmetric(
                      horizontal: 40,
                      vertical: 15,
                    ),
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(8.0),
                    ),
                  ),
                  onPressed: () {
                    Navigator.pushNamed(context, AppRoutes.name);
                  },
                  child: const Text(
                    AppConstants.getStarted,
                    style: TextStyle(color: AppConstants.black, fontSize: 18),
                  ),
                ),
                const SizedBox(height: AppConstants.spacingLarge),
                TextButton(
                  onPressed: () {
                    // TODO: Handle 'Sign in' button press
                  },
                  child: const Text(
                    AppConstants.alreadyMember,
                    style: TextStyle(color: AppConstants.white, fontSize: 16),
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
