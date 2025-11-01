import 'package:flutter/material.dart';
import 'package:messaging_app/models/contact_model.dart';
import 'package:messaging_app/utils/app_routes.dart';
import 'package:messaging_app/utils/app_constants.dart';

class AddContactsScreen extends StatelessWidget {
  AddContactsScreen({super.key});

  // Placeholder data
  final List<Contact> contacts = [
    Contact(name: 'Darrell Steward', imageUrl: '', isUser: true),
    Contact(name: 'Bessie Cooper', imageUrl: ''),
    Contact(name: 'Albert Flores', imageUrl: '', isUser: true),
    Contact(name: 'Kathryn Murphy', imageUrl: ''),
    Contact(name: 'Ronald Richards', imageUrl: ''),
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppConstants.primaryPurple,
      appBar: AppBar(
        backgroundColor: Colors.transparent,
        elevation: 0,
        leading: IconButton(
          icon: const Icon(Icons.arrow_back, color: AppConstants.white),
          onPressed: () => Navigator.of(context).pop(),
        ),
        title: const Text(
          AppConstants.addContacts,
          style: TextStyle(
            color: AppConstants.white,
            fontWeight: FontWeight.bold,
          ),
        ),
      ),
      body: SafeArea(
        child: Padding(
          padding: const EdgeInsets.symmetric(
            horizontal: AppConstants.paddingLarge,
          ),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              const Text(
                AppConstants.addOrInvitePeople,
                style: TextStyle(color: AppConstants.white70, fontSize: 16),
              ),
              const SizedBox(height: AppConstants.spacingLarge),
              const TextField(
                decoration: InputDecoration(
                  hintText: AppConstants.search,
                  hintStyle: TextStyle(color: AppConstants.white54),
                  prefixIcon: Icon(Icons.search, color: AppConstants.white54),
                  filled: true,
                  fillColor: Color.fromRGBO(255, 255, 255, 0.1),
                  border: OutlineInputBorder(
                    borderRadius: BorderRadius.all(Radius.circular(12.0)),
                    borderSide: BorderSide.none,
                  ),
                ),
              ),
              const SizedBox(height: AppConstants.spacingLarge),
              Expanded(
                child: ListView.builder(
                  itemCount: contacts.length,
                  itemBuilder: (context, index) {
                    final contact = contacts[index];
                    return ListTile(
                      contentPadding: EdgeInsets.zero, // Adjust padding
                      leading: CircleAvatar(
                        // You can add placeholder images later
                        backgroundColor: AppConstants.white24,
                        child: Text(contact.name[0]),
                      ),
                      title: Text(
                        contact.name,
                        style: const TextStyle(color: AppConstants.white),
                      ),
                      trailing: ElevatedButton(
                        onPressed: () {},
                        style: ElevatedButton.styleFrom(
                          backgroundColor: contact.isUser
                              ? AppConstants.white10
                              : AppConstants.white,
                          foregroundColor: contact.isUser
                              ? AppConstants.white
                              : AppConstants.primaryPurple,
                        ),
                        child: Text(
                          contact.isUser
                              ? AppConstants.add
                              : AppConstants.invite,
                        ),
                      ),
                    );
                  },
                ),
              ),
              Padding(
                padding: const EdgeInsets.symmetric(
                  vertical: AppConstants.spacingLarge,
                ),
                child: SizedBox(
                  width: double.infinity,
                  child: ElevatedButton(
                    onPressed: () {
                      Navigator.pushNamed(context, AppRoutes.messages);
                    },
                    style: ElevatedButton.styleFrom(
                      backgroundColor: AppConstants.white,
                      padding: const EdgeInsets.symmetric(vertical: 15),
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(8.0),
                      ),
                    ),
                    child: const Text(
                      AppConstants.cont,
                      style: TextStyle(color: AppConstants.black, fontSize: 18),
                    ),
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
