import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:provider/provider.dart';

import 'logic/navigation/app_router.dart';
import 'logic/providers/json_config_model.dart';

void main() async {
  await SystemChrome.setPreferredOrientations([DeviceOrientation.portraitUp]);

  runApp(App());
}

class App extends StatelessWidget {

  @override
  Widget build(BuildContext context) {
    return ChangeNotifierProvider<JsonConfigModel>(
      create: (context) => JsonConfigModel(),
      builder: (context, child) {
        return MaterialApp(
          title: 'Flutter Design Patterns App',
          onGenerateRoute: AppRouter.generateRoute,
        );
      }
    );
  }
}
