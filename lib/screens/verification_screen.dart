import 'package:flutter/material.dart';
import 'package:messaging_app/utils/app_routes.dart';
import 'package:pinput/pinput.dart';
import 'package:messaging_app/utils/app_constants.dart';

class VerificationScreen extends StatelessWidget {
  const VerificationScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final defaultPinTheme = PinTheme(
      width: 56,
      height: 56,
      textStyle: const TextStyle(
        fontSize: 20,
        color: Color.fromRGBO(30, 60, 87, 1),
        fontWeight: FontWeight.w600,
      ),
      decoration: BoxDecoration(
        border: Border.all(color: const Color.fromRGBO(234, 239, 243, 1)),
        borderRadius: BorderRadius.circular(20),
        color: AppConstants.white,
      ),
    );

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
                    AppConstants.whatsTheCode,
                    style: TextStyle(
                      color: AppConstants.white,
                      fontSize: 28,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                  const SizedBox(height: AppConstants.spacingMedium),
                  const Text(
                    AppConstants.enterCode,
                    style: TextStyle(color: AppConstants.white70, fontSize: 16),
                  ),
                  const SizedBox(height: AppConstants.spacingExtraLarge),
                  Pinput(
                    defaultPinTheme: defaultPinTheme,
                    length: 6,
                    onCompleted: (pin) {},
                  ),
                  const SizedBox(height: AppConstants.spacingLarge),
                  TextButton(
                    onPressed: () {
                      // TODO: Handle resend code
                    },
                    child: const Text(
                      AppConstants.didntReceiveCode,
                      style: TextStyle(color: AppConstants.white),
                    ),
                  ),
                  const SizedBox(
                    height: AppConstants.spacingExtraLarge,
                  ), // Added space before the button
                  Align(
                    alignment: Alignment.bottomRight,
                    child: FloatingActionButton(
                      onPressed: () {
                        Navigator.pushNamed(context, AppRoutes.addContacts);
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
