import 'package:flutter/material.dart';
import 'package:sweetchat/l10n/l10n.dart';
import 'package:sweetchat/providers/locale.dart';
import 'package:sweetchat/pages/home/widgets/chat_preview.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';
import 'package:provider/provider.dart';

class ChatsTab extends StatelessWidget {
  const ChatsTab({
    Key? key,
    required this.appLocalizations,
  }) : super(key: key);

  final AppLocalizations appLocalizations;

  static const List<Map<String, dynamic>> demoUsers = [
    {
      "name": "Mike Quemu",
      "last_message": "I don't remember saying that, are you sure?",
      "profile_pic": "assets/images/profile1.jpg",
      "new_message_count": 0,
    },
    {
      "name": "Jessie",
      "last_message": "Next up is a party at Jimmys house!",
      "profile_pic": "assets/images/profile2.jpg",
      "new_message_count": 1,
    },
    {
      "name": "Lucy van Harden",
      "last_message": "No, I'm telling you, I did not do it, it was Mi...",
      "profile_pic": "assets/images/profile3.jpg",
      "new_message_count": 2,
    },
  ];

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        // chat item
        ...demoUsers
            .map(
              (user) => ChatPreview(
                name: user["name"],
                lastMessage: user["last_message"],
                profilePicture: user["profile_pic"],
                newMessageCount: user["new_message_count"],
              ),
            )
            .toList(),

        // other stuff
        const SizedBox(height: 50),
        Center(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: <Widget>[
              Text(
                appLocalizations.pushedBtn,
              ),
              MaterialButton(
                onPressed: () {
                  final provider = Provider.of<LocaleProvider>(
                    context,
                    listen: false,
                  );

                  provider.setLocale(
                    appLocalizations.language == "English"
                        ? L10n.all[1]
                        : L10n.all[0],
                  );
                },
                child: Text(
                  appLocalizations.switchLanguageBtn(appLocalizations.language),
                ),
              )
            ],
          ),
        ),
      ],
    );
  }
}
