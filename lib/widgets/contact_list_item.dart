import 'package:flutter/material.dart';
import 'package:messaging_app/utils/app_constants.dart';

class ContactListItem extends StatelessWidget {
  final String name;
  final String? imageUrl;
  final String? subtitle;
  final Widget? trailingWidget;
  final VoidCallback? onTap;

  const ContactListItem({
    super.key,
    required this.name,
    this.imageUrl,
    this.subtitle,
    this.trailingWidget,
    this.onTap,
  });

  @override
  Widget build(BuildContext context) {
    return ListTile(
      contentPadding: EdgeInsets.zero,
      leading: CircleAvatar(
        backgroundColor: AppConstants.blueGrey,
        backgroundImage: imageUrl != null && imageUrl!.isNotEmpty
            ? NetworkImage(imageUrl!)
            : null,
        child: Text(
          imageUrl != null && imageUrl!.isNotEmpty ? '' : name[0],
          style: const TextStyle(color: AppConstants.white),
        ),
      ),
      title: Text(name, style: const TextStyle(fontWeight: FontWeight.bold)),
      subtitle: subtitle != null
          ? Text(subtitle!, style: const TextStyle(color: AppConstants.grey))
          : null,
      trailing: trailingWidget,
      onTap: onTap,
    );
  }
}
