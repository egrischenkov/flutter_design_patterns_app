import 'package:flutter/material.dart';

import '../../../logic/navigation/app_router.dart';
import '../../../utils/app_colors.dart';
import '../../../utils/utils.dart';
import '../horizontal_space.dart';

class StandardAppBarWidget extends StatelessWidget {
  final Color backgroundColor;
  final String title;

  StandardAppBarWidget({required this.title, required this.backgroundColor});

  @override
  Widget build(BuildContext context) {
    return AppBar(
      backgroundColor: backgroundColor,
      title: Text(
        title,
        style: TextStyle(color: appBarTextLightColor),
      ),
      actions: [
        Switch(
          value: true,
          onChanged: (_) {},
        ),
        HorizontalSpace(32),
        IconButton(
          icon: Icon(Icons.favorite_border),
          onPressed: () {
            navigate(
              Navigation.favoriteRoute,
              argument: {'color': favoritePageBackgroundColorLight},
            );
          },
        ),
        HorizontalSpace(32),
      ],
    );
  }
}
