import 'package:day_night_switcher/day_night_switcher.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import '../../../logic/navigation/app_router.dart';
import '../../../logic/provider/theme_model.dart';
import '../../../utils/app_colors.dart';
import '../../../utils/utils.dart';
import '../horizontal_space.dart';

class StandardAppBarWidget extends StatelessWidget {
  final Color backgroundColor;
  final String title;
  final bool isFavoritePage;

  StandardAppBarWidget(
      {required this.title,
      required this.backgroundColor,
      this.isFavoritePage = false});

  @override
  Widget build(BuildContext context) {
    final themeModel = context.watch<ThemeModel>();
    return AppBar(
      backgroundColor: backgroundColor,
      title: Text(
        title,
        style: TextStyle(color: appBarTextLightColor),
      ),
      actions: [
        SizedBox(
          height: 40,
          width: 60,
          child: FittedBox(
            child: DayNightSwitcher(
              isDarkModeEnabled: !themeModel.isLight,
              onStateChanged: (isDarkModeEnabled) {
                themeModel.setIsLight(!isDarkModeEnabled);
              }
            ),
          ),
        ),
        HorizontalSpace(32),
        if (!isFavoritePage)
          IconButton(
            icon: Icon(Icons.favorite_border),
            onPressed: () {
              navigate(
                Navigation.favoriteRoute,
                argument: {'color': mainBackgroundColor},
              );
            },
          ),
        HorizontalSpace(32),
      ],
    );
  }
}
