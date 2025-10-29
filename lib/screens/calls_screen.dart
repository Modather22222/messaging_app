import 'package:flutter/material.dart';
import 'package:messaging_app/models/call_log_model.dart';
import 'package:messaging_app/utils/app_routes.dart';

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
      backgroundColor: Colors.white,
      appBar: AppBar(
        backgroundColor: const Color(0xFF4A3F69),
        elevation: 0,
        title: const Text(
          'Calls',
          style: TextStyle(
            color: Colors.white,
            fontSize: 24,
            fontWeight: FontWeight.bold,
          ),
        ),
        centerTitle: false,
        titleSpacing: 24.0,
      ),
      body: SafeArea(
        child: Column(
          children: [
            Padding(
              padding: const EdgeInsets.all(16.0),
              child: const TextField(
                decoration: InputDecoration(
                  hintText: 'Search',
                  hintStyle: TextStyle(color: Colors.grey),
                  prefixIcon: Icon(Icons.search, color: Colors.grey),
                  filled: true,
                  fillColor: Color.fromRGBO(
                    240,
                    240,
                    240,
                    1,
                  ), // Light grey for search bar
                  border: OutlineInputBorder(
                    borderRadius: BorderRadius.all(Radius.circular(12.0)),
                    borderSide: BorderSide.none,
                  ),
                ),
              ),
            ),
            Expanded(
              child: ListView.builder(
                padding: const EdgeInsets.symmetric(
                  horizontal: 16.0,
                  vertical: 8.0,
                ),
                itemCount: callLogs.length,
                itemBuilder: (context, index) {
                  final call = callLogs[index];
                  return Padding(
                    padding: const EdgeInsets.symmetric(vertical: 8.0),
                    child: ListTile(
                      leading: CircleAvatar(
                        backgroundColor: Colors.grey[300],
                        child: Text(call.name[0]),
                      ),
                      title: Text(
                        call.name,
                        style: const TextStyle(fontWeight: FontWeight.bold),
                      ),
                      subtitle: Row(
                        children: [
                          Icon(
                            call.callType.contains('Outgoing')
                                ? Icons.call_made
                                : Icons.call_received,
                            color: call.callType.contains('Video')
                                ? Colors.blue
                                : Colors.green,
                            size: 16,
                          ),
                          const SizedBox(width: 4),
                          Text(
                            call.callType,
                            style: const TextStyle(color: Colors.grey),
                          ),
                        ],
                      ),
                      trailing: Text(
                        call.time,
                        style: const TextStyle(
                          fontSize: 12,
                          color: Colors.grey,
                        ),
                      ),
                      onTap: () {
                        // TODO: Handle call log tap
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
        color: Colors.transparent,
        elevation: 0,
        shape: const CircularNotchedRectangle(),
        notchMargin: 16.0,
        child: Container(
          color: Colors.white,
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceAround,
            children: <Widget>[
              IconButton(
                icon: const Icon(Icons.chat_bubble, color: Colors.grey),
                onPressed: () {
                  Navigator.pushNamedAndRemoveUntil(
                    context,
                    AppRoutes.messages,
                    (route) => false,
                  );
                },
              ),
              IconButton(
                icon: const Icon(Icons.phone, color: Color(0xFF4A3F69)),
                onPressed: () {
                  // This is the current screen
                },
              ),
              IconButton(
                icon: const Icon(Icons.chat_bubble, color: Colors.grey),
                onPressed: () {
                  Navigator.pushNamedAndRemoveUntil(
                    context,
                    AppRoutes.messages,
                    (route) => false,
                  );
                },
              ),
              IconButton(
                icon: const Icon(Icons.settings, color: Colors.grey),
                onPressed: () {
                  // TODO: Navigate to Settings
                },
              ),
            ],
          ),
        ),
      ),
      floatingActionButton: FloatingActionButton(
        elevation: 8.0,
        onPressed: () {
          // TODO: Handle new call
        },
        backgroundColor: const Color(0xFF4A3F69),
        child: const Icon(
          Icons.add,
          color: Colors.white,
        ), // Plus icon for new call
      ),
      floatingActionButtonLocation:
          FloatingActionButtonLocation.centerDocked, // Centered FAB
    );
  }
}
