import 'package:flutter/material.dart';
import 'package:country_code_picker/country_code_picker.dart';

class PhoneScreen extends StatelessWidget {
  const PhoneScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color(0xFF4A3F69),
      body: Padding(
        padding: const EdgeInsets.all(20.0),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: <Widget>[
            const Text(
              "What's your number?",
              style: TextStyle(
                color: Colors.white,
                fontSize: 28,
                fontWeight: FontWeight.bold,
              ),
            ),
            const SizedBox(height: 10),
            const Text(
              "We'll send you a code to verify your number.",
              style: TextStyle(color: Colors.white70, fontSize: 16),
            ),
            const SizedBox(height: 40),
            Container(
              decoration: BoxDecoration(
                border: Border(bottom: BorderSide(color: Colors.white54)),
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
                    textStyle: const TextStyle(color: Colors.white),
                    dialogTextStyle: const TextStyle(color: Colors.black),
                  ),
                  const Expanded(
                    child: TextField(
                      style: TextStyle(color: Colors.white),
                      keyboardType: TextInputType.phone,
                      decoration: InputDecoration(
                        hintText: '809 5555 321',
                        hintStyle: TextStyle(color: Colors.white54),
                        border: InputBorder.none,
                      ),
                    ),
                  ),
                ],
              ),
            ),
            const Spacer(),
            Align(
              alignment: Alignment.bottomRight,
              child: FloatingActionButton(
                onPressed: () {
                  // TODO: Handle next step
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
