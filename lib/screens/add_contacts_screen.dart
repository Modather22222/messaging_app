import 'package:flutter/material.dart';
import 'package:messaging_app/models/contact_model.dart';
import 'package:messaging_app/utils/app_routes.dart';
import 'package:messaging_app/utils/app_constants.dart';
import 'package:messaging_app/widgets/contact_list_item.dart';
import 'package:messaging_app/widgets/search_bar_widget.dart';

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
              const SearchBarWidget(hintText: AppConstants.search),
              const SizedBox(height: AppConstants.spacingLarge),
              Expanded(
                child: ListView.builder(
                  itemCount: contacts.length,
                  itemBuilder: (context, index) {
                    final contact = contacts[index];
                    return ContactListItem(
                      name: contact.name,
                      imageUrl: contact.imageUrl,
                      trailingWidget: ElevatedButton(
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
                      onTap: () {
                        // TODO: Handle contact tap
                      },
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
