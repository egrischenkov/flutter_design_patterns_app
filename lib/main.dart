import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

import 'logic/navigation/app_router.dart';
import 'utils/const.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await SystemChrome.setPreferredOrientations([DeviceOrientation.portraitUp]);

  runApp(App());
}

class App extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Design Patterns App',
      navigatorKey: globalKey,
      onGenerateRoute: AppRouter.generateRoute,
    );
  }
}
