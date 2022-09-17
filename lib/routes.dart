import 'package:sweetchat/pages/chat/chat.dart';
import 'package:sweetchat/pages/home/home.dart';
import 'package:sweetchat/pages/login/login.dart';
import 'package:sweetchat/pages/profile/profile.dart';
import 'package:sweetchat/pages/settings/settings.dart';
import 'package:flutter/material.dart';

Map<String, Widget Function(BuildContext)> routes = {
  "/": (context) => const HomePage(title: 'DataFree Chat'),
  "/chat": (context) => const ChatPage(),
  "/profile": (context) => const ProfilePage(title: "Your Profile"),
  "/settings": (context) => const SettingsPage(title: "Settings"),
  "/login": (context) => const LoginPage(),
};
