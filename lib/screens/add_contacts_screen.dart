import 'package:flutter/material.dart';

// Simple model for a contact
class Contact {
  final String name;
  final String imageUrl;
  final bool isUser; // To differentiate between "Add" and "Invite"

  Contact({required this.name, required this.imageUrl, this.isUser = false});
}

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
      backgroundColor: const Color(0xFF4A3F69),
      appBar: AppBar(
        backgroundColor: Colors.transparent,
        elevation: 0,
        leading: IconButton(
          icon: const Icon(Icons.arrow_back, color: Colors.white),
          onPressed: () => Navigator.of(context).pop(),
        ),
        title: const Text(
          'Add Contacts',
          style: TextStyle(color: Colors.white, fontWeight: FontWeight.bold),
        ),
      ),
      body: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 20.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            const Text(
              'Add people who are already using the app or invite people to join',
              style: TextStyle(color: Colors.white70, fontSize: 16),
            ),
            const SizedBox(height: 20),
            const TextField(
              decoration: InputDecoration(
                hintText: 'Search',
                hintStyle: TextStyle(color: Colors.white54),
                prefixIcon: Icon(Icons.search, color: Colors.white54),
                filled: true,
                fillColor: Color.fromRGBO(255, 255, 255, 0.1),
                border: OutlineInputBorder(
                  borderRadius: BorderRadius.all(Radius.circular(12.0)),
                  borderSide: BorderSide.none,
                ),
              ),
            ),
            const SizedBox(height: 20),
            Expanded(
              child: ListView.builder(
                itemCount: contacts.length,
                itemBuilder: (context, index) {
                  final contact = contacts[index];
                  return ListTile(
                    leading: CircleAvatar(
                      // You can add placeholder images later
                      backgroundColor: Colors.white24,
                      child: Text(contact.name[0]),
                    ),
                    title: Text(
                      contact.name,
                      style: const TextStyle(color: Colors.white),
                    ),
                    trailing: ElevatedButton(
                      onPressed: () {},
                      style: ElevatedButton.styleFrom(
                        backgroundColor: contact.isUser
                            ? Colors.white10
                            : Colors.white,
                        foregroundColor: contact.isUser
                            ? Colors.white
                            : const Color(0xFF4A3F69),
                      ),
                      child: Text(contact.isUser ? 'Add' : 'Invite'),
                    ),
                  );
                },
              ),
            ),
            Padding(
              padding: const EdgeInsets.symmetric(vertical: 20.0),
              child: SizedBox(
                width: double.infinity,
                child: ElevatedButton(
                  onPressed: () {
                    // TODO: Handle Continue
                  },
                  style: ElevatedButton.styleFrom(
                    backgroundColor: Colors.white,
                    padding: const EdgeInsets.symmetric(vertical: 15),
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(8.0),
                    ),
                  ),
                  child: const Text(
                    'Continue',
                    style: TextStyle(color: Colors.black87, fontSize: 18),
                  ),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
