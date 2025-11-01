import 'package:flutter/material.dart';
import 'package:messaging_app/models/contact_model.dart';
import 'package:messaging_app/utils/app_routes.dart';
import 'package:messaging_app/utils/app_constants.dart';

class NewChatScreen extends StatelessWidget {
  NewChatScreen({super.key});

  // Placeholder data for contacts, including phone numbers
  final Map<String, List<Contact>> categorizedContacts = {
    'A': [
      Contact(name: 'Alice Smith', imageUrl: '', isUser: true),
      Contact(name: 'Amanda Jones', imageUrl: '', isUser: true),
    ],
    'B': [
      Contact(name: 'Bob Johnson', imageUrl: '', isUser: true),
      Contact(name: 'Brenda Lee', imageUrl: '', isUser: true),
    ],
    'C': [
      Contact(name: 'Cameron Williamson', imageUrl: '', isUser: true),
      Contact(name: 'Charlie Brown', imageUrl: '', isUser: true),
    ],
    // Add more categories and contacts as needed
  };

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppConstants.white,
      appBar: AppBar(
        backgroundColor: AppConstants.white,
        elevation: 0,
        leading: IconButton(
          icon: const Icon(
            Icons.close,
            color: AppConstants.black,
          ), // Close button
          onPressed: () => Navigator.of(context).pop(),
        ),
        title: const Text(
          AppConstants.newChat,
          style: TextStyle(
            color: AppConstants.black,
            fontSize: 24,
            fontWeight: FontWeight.bold,
          ),
        ),
        centerTitle: false,
        titleSpacing: 0.0,
      ),
      body: SafeArea(
        child: ListView.builder(
          itemCount: categorizedContacts.keys.length,
          itemBuilder: (context, categoryIndex) {
            String category = categorizedContacts.keys.elementAt(categoryIndex);
            List<Contact> contacts = categorizedContacts[category]!;

            return Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Padding(
                  padding: const EdgeInsets.symmetric(
                    horizontal: AppConstants.paddingMedium,
                    vertical: AppConstants.paddingSmall,
                  ),
                  child: Text(
                    category,
                    style: const TextStyle(
                      color: AppConstants.grey,
                      fontSize: 18,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                ),
                ListView.builder(
                  shrinkWrap: true,
                  physics: const NeverScrollableScrollPhysics(),
                  itemCount: contacts.length,
                  itemBuilder: (context, contactIndex) {
                    final contact = contacts[contactIndex];
                    return ListTile(
                      leading: CircleAvatar(
                        backgroundColor: AppConstants.blueGrey,
                        child: Text(
                          contact.name[0],
                          style: const TextStyle(color: AppConstants.white),
                        ),
                      ),
                      title: Text(
                        contact.name,
                        style: const TextStyle(fontWeight: FontWeight.bold),
                      ),
                      subtitle: const Text(
                        '+1 123 456 7890',
                        style: TextStyle(color: AppConstants.grey),
                      ), // Placeholder phone number
                      onTap: () {
                        // Navigate to chat screen with the selected contact
                        Navigator.pushNamed(context, AppRoutes.chat);
                      },
                    );
                  },
                ),
              ],
            );
          },
        ),
      ),
    );
  }
}
