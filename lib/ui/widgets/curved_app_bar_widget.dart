import 'package:flutter/material.dart';
import '../items/app_bar_item.dart';
import 'horizontal_space.dart';

class CurvedAppBar extends StatelessWidget {
  final Color backgroundColor;
  final Color color;

  const CurvedAppBar({
    required this.color,
    required this.backgroundColor,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      color: backgroundColor,
      child: Container(
        decoration: BoxDecoration(
          color: color,
          borderRadius: const BorderRadius.only(
            bottomLeft: Radius.circular(90.0),
          ),
        ),
        padding: const EdgeInsets.symmetric(
          vertical: 32,
          horizontal: 64,
        ),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.start,
          crossAxisAlignment: CrossAxisAlignment.end,
          children: [
            AppBarItem(Switch(onChanged: (_){}, value: true, ), 'Theme'),
            HorizontalSpace(32),
            AppBarItem(Icon(Icons.favorite_border,), 'Favorite'),
          ],
        ),
      ),
    );
  }
}
