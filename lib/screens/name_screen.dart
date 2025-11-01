import 'package:flutter/material.dart';
import 'package:messaging_app/utils/app_routes.dart';
import 'package:messaging_app/utils/app_constants.dart';

class NameScreen extends StatelessWidget {
  const NameScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppConstants.primaryPurple,
      body: SafeArea(
        child: Padding(
          padding: const EdgeInsets.all(AppConstants.paddingLarge),
          child: SingleChildScrollView(
            child: ConstrainedBox(
              constraints: BoxConstraints(
                minHeight:
                    MediaQuery.of(context).size.height -
                    kToolbarHeight -
                    MediaQuery.of(context).padding.top,
              ),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: <Widget>[
                  const Text(
                    AppConstants.whatsYourName,
                    style: TextStyle(
                      color: AppConstants.white,
                      fontSize: 28,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                  const SizedBox(height: AppConstants.spacingMedium),
                  const Text(
                    AppConstants.verifyNumber,
                    style: TextStyle(color: AppConstants.white70, fontSize: 16),
                  ),
                  const SizedBox(height: AppConstants.spacingExtraLarge),
                  const TextField(
                    style: TextStyle(color: AppConstants.white),
                    decoration: InputDecoration(
                      labelText: AppConstants.johnDoe,
                      labelStyle: TextStyle(color: AppConstants.white54),
                      enabledBorder: UnderlineInputBorder(
                        borderSide: BorderSide(color: AppConstants.white54),
                      ),
                      focusedBorder: UnderlineInputBorder(
                        borderSide: BorderSide(color: AppConstants.white),
                      ),
                    ),
                  ),
                  const SizedBox(
                    height: AppConstants.spacingExtraLarge,
                  ), // Added space before the button
                  Align(
                    alignment: Alignment.bottomRight,
                    child: FloatingActionButton(
                      onPressed: () {
                        Navigator.pushNamed(context, AppRoutes.phone);
                      },
                      backgroundColor: AppConstants.white,
                      child: const Icon(
                        Icons.arrow_forward,
                        color: AppConstants.primaryPurple,
                      ),
                    ),
                  ),
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}
