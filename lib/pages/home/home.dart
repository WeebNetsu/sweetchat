import 'package:sweetchat/pages/home/tabs/chats.dart';
import 'package:sweetchat/pages/home/tabs/groups.dart';
import 'package:sweetchat/widgets/menu_holder.dart';
import 'package:flutter/material.dart';
import 'package:focused_menu/modals.dart';
import 'package:get/get.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';

class HomePage extends StatefulWidget {
  const HomePage({Key? key, required this.title}) : super(key: key);

  final String title;

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  @override
  Widget build(BuildContext context) {
    // get if we're using light or dark theme
    // Theme.of(context).brightness ==  Brightness.dark;
    final bool isDarkTheme = Theme.of(context).brightness == Brightness.dark;
    final AppLocalizations appLocalizations = AppLocalizations.of(context)!;

    return DefaultTabController(
      length: 3,
      child: Scaffold(
        appBar: AppBar(
          title: Text(widget.title),
          bottom: TabBar(
            labelColor: Colors.white,
            tabs: [
              Tab(text: appLocalizations.chatTabChats.toUpperCase()),
              Tab(text: appLocalizations.chatTabGroups.toUpperCase()),
              Tab(text: appLocalizations.chatTabStatus.toUpperCase()),
            ],
          ),
          actions: [
            const Icon(Icons.search),
            const SizedBox(width: 15),
            MenuHolder(
              menuItems: [
                FocusedMenuItem(
                  title: Text(appLocalizations.profileText),
                  backgroundColor: isDarkTheme ? Colors.black54 : Colors.white,
                  trailingIcon: const Icon(Icons.account_circle),
                  onPressed: () => Navigator.pushNamed(context, "/profile"),
                ),
                FocusedMenuItem(
                  title: Text(appLocalizations.newGroupText),
                  backgroundColor: isDarkTheme ? Colors.black54 : Colors.white,
                  trailingIcon: const Icon(Icons.group),
                  onPressed: () {},
                ),
                FocusedMenuItem(
                  title: Text(appLocalizations.settingsText),
                  backgroundColor: isDarkTheme ? Colors.black54 : Colors.white,
                  trailingIcon: const Icon(Icons.settings),
                  onPressed: () => Navigator.pushNamed(context, "/settings"),
                ),
                FocusedMenuItem(
                  title: Text(appLocalizations.aboutText),
                  backgroundColor: isDarkTheme ? Colors.black54 : Colors.white,
                  trailingIcon: const Icon(Icons.question_mark_sharp),
                  onPressed: () {},
                ),
              ],
            ),
          ],
        ),
        body: TabBarView(
          children: [
            ChatsTab(appLocalizations: appLocalizations),
            GroupsTab(appLocalizations: appLocalizations),
            const Text("Tab 3"),
          ],
        ),
        floatingActionButton: FloatingActionButton(
          onPressed: () {
            Get.changeThemeMode(
                Get.isDarkMode ? ThemeMode.light : ThemeMode.dark);
          },
          tooltip: 'Increment',
          child: const Icon(Icons.chat_bubble_outline),
        ),
      ),
    );
  }
}
