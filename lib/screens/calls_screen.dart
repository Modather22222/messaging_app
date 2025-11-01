import 'package:flutter/material.dart';
import 'package:messaging_app/models/call_log_model.dart';
import 'package:messaging_app/utils/app_constants.dart';
import 'package:messaging_app/utils/app_routes.dart';
import 'package:messaging_app/widgets/search_bar_widget.dart';
import 'package:messaging_app/widgets/call_log_item.dart';

class CallsScreen extends StatelessWidget {
  CallsScreen({super.key});

  final List<CallLog> callLogs = [
    CallLog(
      name: 'Cameron Williamson',
      callType: 'Outgoing Video',
      time: '14:32',
      imageUrl: '',
    ),
    CallLog(
      name: 'Arlene McCoy',
      callType: 'Incoming',
      time: '14:32',
      imageUrl: '',
    ),
    CallLog(
      name: 'Theresa Webb',
      callType: 'Outgoing',
      time: '14:32',
      imageUrl: '',
    ),
    CallLog(
      name: 'Robert Fox',
      callType: 'Incoming',
      time: '14:32',
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
          AppConstants.calls,
          style: TextStyle(
            color: AppConstants.white,
            fontSize: 24,
            fontWeight: FontWeight.bold,
          ),
        ),
        centerTitle: false,
        titleSpacing: AppConstants.paddingLarge,
      ),
      body: SafeArea(
        child: Column(
          children: [
            Padding(
              padding: const EdgeInsets.all(AppConstants.paddingMedium),
              child: const SearchBarWidget(hintText: AppConstants.search),
            ),
            Expanded(
              child: ListView.builder(
                padding: const EdgeInsets.symmetric(
                  horizontal: AppConstants.paddingMedium,
                  vertical: AppConstants.paddingSmall,
                ),
                itemCount: callLogs.length,
                itemBuilder: (context, index) {
                  final call = callLogs[index];
                  return CallLogItem(callLog: call);
                },
              ),
            ),
          ],
        ),
      ),
      bottomNavigationBar: BottomAppBar(
        color: Colors.transparent,
        elevation: 0,
        shape: const CircularNotchedRectangle(),
        notchMargin: AppConstants.paddingMedium,
        child: Container(
          color: AppConstants.white,
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceAround,
            children: <Widget>[
              IconButton(
                icon: const Icon(Icons.chat_bubble, color: AppConstants.grey),
                onPressed: () {
                  Navigator.pushNamedAndRemoveUntil(
                    context,
                    AppRoutes.messages,
                    (route) => false,
                  );
                },
              ),
              IconButton(
                icon: const Icon(
                  Icons.phone,
                  color: AppConstants.primaryPurple,
                ),
                onPressed: () {
                  // This is the current screen
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
                onPressed: () {
                  // TODO: Navigate to Settings
                },
              ),
            ],
          ),
        ),
      ),
      floatingActionButton: FloatingActionButton(
        elevation: AppConstants.paddingSmall,
        onPressed: () {
          Navigator.pushNamed(context, AppRoutes.newCall);
        },
        backgroundColor: AppConstants.primaryPurple,
        child: const Icon(
          Icons.add,
          color: AppConstants.white,
        ), // Plus icon for new call
      ),
      floatingActionButtonLocation:
          FloatingActionButtonLocation.centerDocked, // Centered FAB
    );
  }
}
