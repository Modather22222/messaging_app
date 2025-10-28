import 'package:flutter/material.dart';
import 'package:messaging_app/screens/splash_screen.dart';
import 'package:messaging_app/screens/name_screen.dart';
import 'package:messaging_app/screens/phone_screen.dart';
import 'package:messaging_app/screens/verification_screen.dart';
import 'package:messaging_app/screens/add_contacts_screen.dart';

class AppRoutes {
  static const String splash = '/';
  static const String name = '/name';
  static const String phone = '/phone';
  static const String verification = '/verification';
  static const String addContacts = '/add-contacts';

  static Route<dynamic> onGenerateRoute(RouteSettings settings) {
    switch (settings.name) {
      case splash:
        return MaterialPageRoute(builder: (_) => const SplashScreen());
      case name:
        return MaterialPageRoute(builder: (_) => const NameScreen());
      case phone:
        return MaterialPageRoute(builder: (_) => const PhoneScreen());
      case verification:
        return MaterialPageRoute(builder: (_) => const VerificationScreen());
      case addContacts:
        return MaterialPageRoute(builder: (_) => AddContactsScreen());
      default:
        return MaterialPageRoute(builder: (_) => const SplashScreen());
    }
  }
}
