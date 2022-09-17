import 'package:flutter/material.dart';
import 'package:sweetchat/l10n/l10n.dart';
import 'package:sweetchat/providers/locale.dart';
import 'package:sweetchat/pages/home/widgets/chat_preview.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';
import 'package:provider/provider.dart';

class GroupsTab extends StatelessWidget {
  const GroupsTab({
    Key? key,
    required this.appLocalizations,
  }) : super(key: key);

  final AppLocalizations appLocalizations;

  static const List<Map<String, dynamic>> demoUsers = [
    {
      "name": "The bois",
      "last_message": "I don't remember saying that, are you sure?",
      "profile_pic": "assets/images/profile1.jpg",
      "new_message_count": 453,
    },
    {
      "name": "Movie Night",
      "last_message": "Next up is a party at Jimmys house!",
      "profile_pic": "assets/images/profile2.jpg",
      "new_message_count": 0,
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
