import 'package:flutter/material.dart';
import 'package:country_code_picker/country_code_picker.dart';
import 'package:messaging_app/utils/app_routes.dart';
import 'package:messaging_app/utils/app_constants.dart';

class PhoneScreen extends StatelessWidget {
  const PhoneScreen({super.key});

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
                    AppConstants.whatsYourNumber,
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
                  Container(
                    decoration: const BoxDecoration(
                      border: Border(
                        bottom: BorderSide(color: AppConstants.white54),
                      ),
                    ),
                    child: Row(
                      children: [
                        CountryCodePicker(
                          onChanged: print,
                          initialSelection: 'IN',
                          favorite: const ['+91', 'IN'],
                          showCountryOnly: false,
                          showOnlyCountryWhenClosed: false,
                          alignLeft: false,
                          textStyle: const TextStyle(color: AppConstants.white),
                          dialogTextStyle: const TextStyle(
                            color: AppConstants.black,
                          ),
                        ),
                        const Expanded(
                          child: TextField(
                            style: TextStyle(color: AppConstants.white),
                            keyboardType: TextInputType.phone,
                            decoration: InputDecoration(
                              hintText: '809 5555 321',
                              hintStyle: TextStyle(color: AppConstants.white54),
                              border: InputBorder.none,
                            ),
                          ),
                        ),
                      ],
                    ),
                  ),
                  const SizedBox(
                    height: AppConstants.spacingExtraLarge,
                  ), // Added space before the button
                  Align(
                    alignment: Alignment.bottomRight,
                    child: FloatingActionButton(
                      onPressed: () {
                        Navigator.pushNamed(context, AppRoutes.verification);
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
