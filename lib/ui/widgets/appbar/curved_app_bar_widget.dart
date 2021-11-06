import 'package:flutter/material.dart';

import '../../../logic/navigation/app_router.dart';
import '../../../utils/app_colors.dart';
import '../../../utils/utils.dart';
import '../../items/app_bar_item.dart';
import '../horizontal_space.dart';
import '../vertical_space.dart';

class CurvedAppBarWidget extends StatelessWidget {
  final String title;
  final Color backgroundColor;
  final Color color;

  const CurvedAppBarWidget({
    required this.title,
    required this.color,
    required this.backgroundColor,
  });

  @override
  Widget build(BuildContext context) {
    return Material(
      child: Container(
        color: backgroundColor,
        child: Container(
          decoration: BoxDecoration(
            color: color,
            borderRadius: const BorderRadius.only(
              bottomLeft: Radius.circular(90.0),
            ),
          ),
          padding: const EdgeInsets.symmetric(
            vertical: 16,
            horizontal: 64,
          ),
          child: Padding(
            padding: const EdgeInsets.only(top: 32),
            child: Column(
              mainAxisSize: MainAxisSize.min,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  title,
                  style: TextStyle(fontSize: 32, fontWeight: FontWeight.bold),
                ),
                VerticalSpace(32),
                Row(
                  mainAxisAlignment: MainAxisAlignment.start,
                  crossAxisAlignment: CrossAxisAlignment.end,
                  children: [
                    AppBarItem(
                      Switch(
                        onChanged: (_) {},
                        value: true,
                      ),
                      'Theme',
                      () => {
                        print('onTap')
                      },
                    ),
                    HorizontalSpace(32),
                    AppBarItem(
                      Icon(
                        Icons.favorite_border,
                      ),
                      'Favorite',
                      () {
                        navigate(
                          Navigation.favoriteRoute,
                          argument: {'color': favoritePageBackgroundColorLight},
                        );
                      },
                    ),
                  ],
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
