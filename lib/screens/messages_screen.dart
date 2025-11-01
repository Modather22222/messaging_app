import 'package:flutter/material.dart';
import 'package:messaging_app/utils/app_routes.dart';
import 'package:messaging_app/utils/app_constants.dart';

class MessageThread {
  final String name;
  final String message;
  final String time;
  final String imageUrl;
  final bool hasUnread;

  MessageThread({
    required this.name,
    required this.message,
    required this.time,
    required this.imageUrl,
    this.hasUnread = false,
  });
}

class MessagesScreen extends StatefulWidget {
  const MessagesScreen({super.key});

  @override
  State<MessagesScreen> createState() => _MessagesScreenState();
}

class _MessagesScreenState extends State<MessagesScreen> {
  final List<MessageThread> messageThreads = [
    MessageThread(
      name: 'Cameron Williamson',
      message: 'Hey, how are you?',
      time: '14:32',
      imageUrl: '',
      hasUnread: true,
    ),
    MessageThread(
      name: 'Arlene McCoy',
      message: 'See you tomorrow!',
      time: 'Yesterday',
      imageUrl: '',
    ),
    MessageThread(
      name: 'Darlene Robertson',
      message: 'Sounds good!',
      time: 'Mon',
      imageUrl: '',
    ),
    MessageThread(
      name: 'Jenny Wilson',
      message: "Let's catch up soon.",
      time: 'Sun',
      imageUrl: '',
    ),
    MessageThread(
      name: 'Annette Black',
      message: 'Okay, thanks!',
      time: 'Sat',
      imageUrl: '',
    ),
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppConstants.white,
      appBar: AppBar(
        backgroundColor: AppConstants.primaryPurple,
        elevation: 0,
        title: const Text(
          AppConstants.messages,
          style: TextStyle(
            color: AppConstants.white,
            fontSize: 24,
            fontWeight: FontWeight.bold,
          ),
        ),
        centerTitle:
            false, // Align title to the left as per common messaging app UIs
        titleSpacing: AppConstants.paddingLarge, // Add spacing to the title
      ),
      body: SafeArea(
        child: Column(
          children: [
            Expanded(
              child: ListView.builder(
                padding: const EdgeInsets.symmetric(
                  horizontal: AppConstants.paddingMedium,
                  vertical: AppConstants.paddingSmall,
                ), // Add padding to the list
                itemCount: messageThreads.length,
                itemBuilder: (context, index) {
                  final thread = messageThreads[index];
                  return Padding(
                    padding: const EdgeInsets.symmetric(
                      vertical: AppConstants.paddingSmall,
                    ), // Add vertical padding between list items
                    child: Builder(
                      builder: (BuildContext innerContext) {
                        return ListTile(
                          leading: CircleAvatar(
                            backgroundColor: AppConstants.grey300,
                            child: Text(thread.name[0]),
                          ),
                          title: Text(
                            thread.name,
                            style: const TextStyle(fontWeight: FontWeight.bold),
                          ),
                          subtitle: Text(
                            thread.message,
                            style: const TextStyle(color: AppConstants.grey),
                          ),
                          trailing: Column(
                            crossAxisAlignment: CrossAxisAlignment.end,
                            children: [
                              Text(
                                thread.time,
                                style: const TextStyle(
                                  fontSize: 12,
                                  color: AppConstants.grey,
                                ),
                              ),
                              if (thread.hasUnread)
                                const SizedBox(
                                  height: AppConstants.spacingSmall,
                                ), // Spacing between time and badge
                              if (thread.hasUnread)
                                Container(
                                  padding: const EdgeInsets.all(
                                    AppConstants.paddingSmall,
                                  ),
                                  decoration: BoxDecoration(
                                    color: AppConstants.red,
                                    borderRadius: BorderRadius.circular(10),
                                  ),
                                  constraints: const BoxConstraints(
                                    minWidth: 18,
                                    minHeight: 18,
                                  ),
                                  child: const Text(
                                    '1',
                                    style: TextStyle(
                                      color: AppConstants.white,
                                      fontSize: 10,
                                    ),
                                    textAlign: TextAlign.center,
                                  ),
                                ),
                            ],
                          ),
                          onTap: () {
                            Navigator.pushNamed(innerContext, AppRoutes.chat);
                          },
                        );
                      },
                    ),
                  );
                },
              ),
            ),
          ],
        ),
      ),
      bottomNavigationBar: BottomAppBar(
        color: Colors.transparent, // Make BottomAppBar transparent
        elevation: 0, // Remove elevation to avoid shadows
        shape: const CircularNotchedRectangle(),
        notchMargin:
            AppConstants.paddingMedium, // Space between FAB and BottomAppBar
        child: Container(
          color: AppConstants
              .white, // Apply white background to the child container
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceAround,
            children: <Widget>[
              IconButton(
                icon: const Icon(
                  Icons.chat_bubble,
                  color: AppConstants.primaryPurple,
                ),
                onPressed: () {
                  Navigator.pushNamedAndRemoveUntil(
                    context,
                    AppRoutes.messages,
                    (route) => false,
                  );
                },
              ),
              IconButton(
                icon: const Icon(Icons.phone, color: AppConstants.grey),
                onPressed: () {
                  Navigator.pushNamed(context, AppRoutes.calls);
                },
              ),
              IconButton(
                icon: const Icon(Icons.people, color: AppConstants.grey),
                onPressed: () {
                  // TODO: Navigate to Contacts
                },
              ),
              IconButton(
                icon: const Icon(Icons.settings, color: AppConstants.grey),
                onPressed: () {},
              ),
            ],
          ),
        ),
      ),
      floatingActionButton: FloatingActionButton(
        elevation: AppConstants
            .paddingSmall, // Added elevation to the FloatingActionButton
        onPressed: () {
          Navigator.pushNamed(context, AppRoutes.newChat);
        },
        backgroundColor: AppConstants.primaryPurple,
        child: const Icon(Icons.edit, color: AppConstants.white),
      ),
      floatingActionButtonLocation: FloatingActionButtonLocation.endDocked,
    );
  }
}
