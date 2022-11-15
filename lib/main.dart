import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';
import 'package:provider/provider.dart';

import 'locale_model.dart';
import 'logic/navigation/app_router/app_router.dart';
import 'logic/provider/favorite_model.dart';
import 'logic/provider/theme_model.dart';
import 'utils/app_colors.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await SystemChrome.setPreferredOrientations([DeviceOrientation.portraitUp]);
  runApp(App());
}

class App extends StatelessWidget {
  final _appRoute = AppRouter();

  @override
  Widget build(BuildContext context) {
    return MultiProvider(
      providers: [
        ChangeNotifierProvider<ThemeModel>(create: (context) => ThemeModel()),
        ChangeNotifierProvider<LocaleModel>(create: (context) => LocaleModel()),
        ChangeNotifierProvider<FavoriteModel>(create: (context) => FavoriteModel()),
      ],
      builder: (context, child) {
        return Consumer2<ThemeModel, LocaleModel>(
          builder: (context, themeModel, localeModel, child) {
            return MaterialApp.router(
              debugShowCheckedModeBanner: false,
              title: 'Flutter Design Patterns App',
              routerDelegate: _appRoute.delegate(),
              routeInformationParser: _appRoute.defaultRouteParser(),
              locale: localeModel.locale,
              localeResolutionCallback: _setUpDeviceLocaleForApp,
              localizationsDelegates: AppLocalizations.localizationsDelegates,
              supportedLocales: AppLocalizations.supportedLocales,
              themeMode: themeModel.isLight ? ThemeMode.light : ThemeMode.dark,
              theme: dayTheme(context),
              darkTheme: nightTheme(context),
            );
          },
        );
      },
    );
  }

  Locale _setUpDeviceLocaleForApp(Locale? userLocale, Iterable<Locale> supportedLocales) {
    for (var locale in supportedLocales) {
      if (locale.languageCode == userLocale?.languageCode && locale.countryCode == userLocale?.countryCode) {
        return userLocale!;
      }
    }

    return supportedLocales.first;
  }
}
