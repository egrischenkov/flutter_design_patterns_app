import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:provider/provider.dart';

import 'logic/navigation/app_router.dart';
import 'logic/provider/favorite_model.dart';
import 'logic/provider/theme_model.dart';
import 'utils/app_colors.dart';
import 'utils/const.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await SystemChrome.setPreferredOrientations([DeviceOrientation.portraitUp]);
  runApp(App());
}

class App extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MultiProvider(
      providers: [
        ChangeNotifierProvider<ThemeModel>(create: (context) => ThemeModel()),
        ChangeNotifierProvider<FavoriteModel>(
            create: (context) => FavoriteModel()),
      ],
      builder: (context, child) {
        return Consumer<ThemeModel>(
          builder: (context, themeModel, child) {
            return MaterialApp(
              title: 'Flutter Design Patterns App',
              navigatorKey: globalKey,
              onGenerateRoute: AppRouter.generateRoute,
              themeMode: themeModel.isLight ? ThemeMode.light : ThemeMode.dark,
              theme: dayTheme(context),
              darkTheme: nightTheme(context),
            );
          },
        );
      },
    );
  }
}
