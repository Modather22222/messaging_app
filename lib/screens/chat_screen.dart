import 'package:flutter/material.dart';
import 'package:messaging_app/utils/app_constants.dart';

class Message {
  final String text;
  final bool isMe; // true if the message is from the current user

  Message({required this.text, required this.isMe});
}

class ChatScreen extends StatelessWidget {
  ChatScreen({super.key});

  final List<Message> messages = [
    Message(text: 'What do you mean?', isMe: true),
    Message(
      text: 'I think the idea that things are chaning isnt good.',
      isMe: false,
    ),
    Message(text: 'What do you mean?', isMe: true),
    Message(
      text: 'I think the idea that things are chaning isnt good.',
      isMe: false,
    ),
    Message(text: 'What do you mean?', isMe: true),
    Message(
      text: 'I think the idea that things are chaning isnt good.',
      isMe: false,
    ),
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppConstants.white,
      appBar: AppBar(
        backgroundColor: AppConstants.primaryPurple,
        elevation: 0,
        leading: IconButton(
          icon: const Icon(Icons.arrow_back, color: AppConstants.white),
          onPressed: () => Navigator.of(context).pop(),
        ),
        title: const Text(
          'Cameron',
          style: TextStyle(
            color: AppConstants.white,
            fontSize: 24,
            fontWeight: FontWeight.bold,
          ),
        ),
        centerTitle: false,
        titleSpacing: 0.0,
      ),
      body: SafeArea(
        child: Column(
          children: [
            Expanded(
              child: ListView.builder(
                padding: const EdgeInsets.all(AppConstants.paddingMedium),
                itemCount: messages.length,
                itemBuilder: (context, index) {
                  final message = messages[index];
                  return Align(
                    alignment: message.isMe
                        ? Alignment.centerRight
                        : Alignment.centerLeft,
                    child: Container(
                      margin: const EdgeInsets.symmetric(
                        vertical: AppConstants.spacingSmall,
                      ),
                      padding: const EdgeInsets.all(AppConstants.paddingMedium),
                      decoration: BoxDecoration(
                        color: message.isMe
                            ? AppConstants.primaryPurple
                            : AppConstants.grey300,
                        borderRadius: BorderRadius.circular(
                          AppConstants.paddingMedium,
                        ),
                      ),
                      child: Text(
                        message.text,
                        style: TextStyle(
                          color: message.isMe
                              ? AppConstants.white
                              : AppConstants.black,
                        ),
                      ),
                    ),
                  );
                },
              ),
            ),
            Padding(
              padding: const EdgeInsets.all(AppConstants.paddingMedium),
              child: Row(
                children: [
                  Expanded(
                    child: TextField(
                      decoration: InputDecoration(
                        hintText: AppConstants.typeMessage,
                        hintStyle: const TextStyle(color: AppConstants.grey),
                        filled: true,
                        fillColor: AppConstants.grey200,
                        border: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(
                            AppConstants.paddingLarge,
                          ),
                          borderSide: BorderSide.none,
                        ),
                        contentPadding: const EdgeInsets.symmetric(
                          horizontal: AppConstants.spacingLarge,
                          vertical: AppConstants.spacingMedium,
                        ),
                      ),
                    ),
                  ),
                  const SizedBox(width: AppConstants.spacingSmall),
                  CircleAvatar(
                    backgroundColor: AppConstants.primaryPurple,
                    radius: 24,
                    child: IconButton(
                      icon: const Icon(Icons.mic, color: AppConstants.white),
                      onPressed: () {
                        // TODO: Handle voice message
                      },
                    ),
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
