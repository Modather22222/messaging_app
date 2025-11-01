import 'package:appwrite/appwrite.dart';
import 'package:flutter_dotenv/flutter_dotenv.dart';

class AppwriteConstants {
  static String get endPoint => dotenv.env['APPWRITE_ENDPOINT']!;
  static String get projectId => dotenv.env['APPWRITE_PROJECT_ID']!;

  static Client get client {
    Client client = Client();
    client
        .setEndpoint(endPoint)
        .setProject(projectId)
        .setSelfSigned(
          status: true,
        ); // For self-signed certificates, remove in production
    return client;
  }
}
