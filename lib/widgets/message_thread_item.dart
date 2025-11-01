import 'package:flutter/material.dart';

import 'package:messaging_app/utils/app_constants.dart';
import 'package:messaging_app/utils/app_routes.dart';

class MessageThreadItem extends StatelessWidget {
  final String name;
  final String message;
  final String time;
  final String imageUrl;
  final bool hasUnread;

  const MessageThreadItem({
    super.key,
    required this.name,
    required this.message,
    required this.time,
    this.imageUrl = '',
    this.hasUnread = false,
  });

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: AppConstants.paddingSmall),
      child: ListTile(
        leading: CircleAvatar(
          backgroundColor: AppConstants.grey300,
          child: Text(name[0]),
        ),
        title: Text(name, style: const TextStyle(fontWeight: FontWeight.bold)),
        subtitle: Text(
          message,
          style: const TextStyle(color: AppConstants.grey),
        ),
        trailing: Column(
          crossAxisAlignment: CrossAxisAlignment.end,
          children: [
            Text(
              time,
              style: const TextStyle(fontSize: 12, color: AppConstants.grey),
            ),
          ],
        ),
        onTap: () {
          Navigator.pushNamed(context, AppRoutes.chat);
        },
      ),
    );
  }
}
