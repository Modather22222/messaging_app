import 'package:flutter/material.dart';
import 'package:messaging_app/models/call_log_model.dart';
import 'package:messaging_app/utils/app_constants.dart';

class CallLogItem extends StatelessWidget {
  final CallLog callLog;

  const CallLogItem({super.key, required this.callLog});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: AppConstants.paddingSmall),
      child: ListTile(
        leading: CircleAvatar(
          backgroundColor: AppConstants.grey300,
          child: Text(callLog.name[0]),
        ),
        title: Text(
          callLog.name,
          style: const TextStyle(fontWeight: FontWeight.bold),
        ),
        subtitle: Row(
          children: [
            Icon(
              callLog.callType.contains('Outgoing')
                  ? Icons.call_made
                  : Icons.call_received,
              color: callLog.callType.contains('Video')
                  ? AppConstants.blue
                  : AppConstants.green,
              size: 16,
            ),
            const SizedBox(width: AppConstants.spacingSmall),
            Text(
              callLog.callType,
              style: const TextStyle(color: AppConstants.grey),
            ),
          ],
        ),
        trailing: Text(
          callLog.time,
          style: const TextStyle(fontSize: 12, color: AppConstants.grey),
        ),
        onTap: () {
          // TODO: Handle call log tap
        },
      ),
    );
  }
}
