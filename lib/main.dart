import 'package:sweetchat/l10n/l10n.dart';
import 'package:provider/provider.dart';
import 'package:sweetchat/providers/locale.dart';
import 'package:sweetchat/routes.dart';
import 'package:sweetchat/utils/theme.dart';
import 'package:flutter/material.dart';
import 'package:flutter_localizations/flutter_localizations.dart';
import 'package:get/get_navigation/get_navigation.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';

void main() {
  runApp(ChangeNotifierProvider(
    create: (context) => LocaleProvider(),
    child: const MyApp(),
  ));
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final provider = Provider.of<LocaleProvider>(context);

    return GetMaterialApp(
      title: 'Data Free Chat',
      theme: lightThemeData,
      locale: provider.locale,
      darkTheme: darkThemeData,
      routes: routes,
      themeMode: ThemeMode.dark,
      localizationsDelegates: const [
        // the auto generated language file
        AppLocalizations.delegate,
        GlobalMaterialLocalizations.delegate,
        // will make sure all languages that goes from right to left
        // are still supported by the widgets
        GlobalWidgetsLocalizations.delegate,
        GlobalCupertinoLocalizations.delegate,
      ],
      supportedLocales: L10n.all,
    );
  }
}
