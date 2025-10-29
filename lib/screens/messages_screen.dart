import 'package:flutter/material.dart';
import 'package:messaging_app/utils/app_routes.dart';

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
      backgroundColor: Colors.white,
      appBar: AppBar(
        backgroundColor: const Color(0xFF4A3F69),
        elevation: 0,
        title: const Text(
          'Messages',
          style: TextStyle(
            color: Colors.white,
            fontSize: 24,
            fontWeight: FontWeight.bold,
          ),
        ),
        centerTitle:
            false, // Align title to the left as per common messaging app UIs
        titleSpacing: 24.0, // Add spacing to the title
      ),
      body: SafeArea(
        child: Column(
          children: [
            Expanded(
              child: ListView.builder(
                padding: const EdgeInsets.symmetric(
                  horizontal: 16.0,
                  vertical: 8.0,
                ), // Add padding to the list
                itemCount: messageThreads.length,
                itemBuilder: (context, index) {
                  final thread = messageThreads[index];
                  return Padding(
                    padding: const EdgeInsets.symmetric(
                      vertical: 8.0,
                    ), // Add vertical padding between list items
                    child: Builder(
                      builder: (BuildContext innerContext) {
                        return ListTile(
                          leading: CircleAvatar(
                            backgroundColor: Colors.grey[300],
                            child: Text(thread.name[0]),
                          ),
                          title: Text(
                            thread.name,
                            style: const TextStyle(fontWeight: FontWeight.bold),
                          ),
                          subtitle: Text(
                            thread.message,
                            style: const TextStyle(color: Colors.grey),
                          ),
                          trailing: Column(
                            crossAxisAlignment: CrossAxisAlignment.end,
                            children: [
                              Text(
                                thread.time,
                                style: const TextStyle(
                                  fontSize: 12,
                                  color: Colors.grey,
                                ),
                              ),
                              if (thread.hasUnread)
                                const SizedBox(
                                  height: 4,
                                ), // Spacing between time and badge
                              if (thread.hasUnread)
                                Container(
                                  padding: const EdgeInsets.all(4),
                                  decoration: BoxDecoration(
                                    color: Colors.red,
                                    borderRadius: BorderRadius.circular(10),
                                  ),
                                  constraints: const BoxConstraints(
                                    minWidth: 18,
                                    minHeight: 18,
                                  ),
                                  child: const Text(
                                    '1',
                                    style: TextStyle(
                                      color: Colors.white,
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
        notchMargin: 16.0,
        child: Container(
          color: Colors.white, // Apply white background to the child container
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceAround,
            children: <Widget>[
              IconButton(
                icon: const Icon(Icons.chat_bubble, color: Color(0xFF4A3F69)),
                onPressed: () {
                  Navigator.pushNamedAndRemoveUntil(
                    context,
                    AppRoutes.messages,
                    (route) => false,
                  );
                },
              ),
              IconButton(
                icon: const Icon(Icons.phone, color: Colors.grey),
                onPressed: () {
                  Navigator.pushNamed(context, AppRoutes.calls);
                },
              ),
              IconButton(
                icon: const Icon(Icons.people, color: Colors.grey),
                onPressed: () {
                  // TODO: Navigate to Contacts
                },
              ),
              IconButton(
                icon: const Icon(Icons.settings, color: Colors.grey),
                onPressed: () {},
              ),
            ],
          ),
        ),
      ),
      floatingActionButton: FloatingActionButton(
        elevation: 8.0, // Added elevation to the FloatingActionButton
        onPressed: () {
          // TODO: Handle new message
        },
        child: const Icon(Icons.edit, color: Colors.white),
      ),
      floatingActionButtonLocation: FloatingActionButtonLocation.endDocked,
    );
  }
}
