import 'package:flutter/material.dart';
import 'package:messaging_app/screens/add_contacts_screen.dart';
import 'package:pinput/pinput.dart';

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
        color: Colors.white,
      ),
    );

    return Scaffold(
      backgroundColor: const Color(0xFF4A3F69),
      body: Padding(
        padding: const EdgeInsets.all(20.0),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: <Widget>[
            const Text(
              "What's the code?",
              style: TextStyle(
                color: Colors.white,
                fontSize: 28,
                fontWeight: FontWeight.bold,
              ),
            ),
            const SizedBox(height: 10),
            const Text(
              "Enter the code we've send to +91 708 5432 888",
              style: TextStyle(color: Colors.white70, fontSize: 16),
            ),
            const SizedBox(height: 40),
            Pinput(
              defaultPinTheme: defaultPinTheme,
              length: 6,
              onCompleted: (pin) => print(pin),
            ),
            const SizedBox(height: 20),
            TextButton(
              onPressed: () {
                // TODO: Handle resend code
              },
              child: const Text(
                "Didn't recieve code? Send again",
                style: TextStyle(color: Colors.white),
              ),
            ),
            const Spacer(),
            Align(
              alignment: Alignment.bottomRight,
              child: FloatingActionButton(
                onPressed: () {
                  Navigator.push(
                    context,
                    MaterialPageRoute(
                      builder: (context) => AddContactsScreen(),
                    ),
                  );
                },
                backgroundColor: Colors.white,
                child: const Icon(
                  Icons.arrow_forward,
                  color: Color(0xFF4A3F69),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
