import 'package:flutter/material.dart';
import '../../../utils/app_colors.dart';

import '../horizontal_space.dart';

class StandardAppBarWidget extends StatelessWidget {
  final Color backgroundColor;
  final String title;

  StandardAppBarWidget({required this.title, required this.backgroundColor});

  @override
  Widget build(BuildContext context) {
    return AppBar(
      backgroundColor: backgroundColor,
      title: Text(title, style: TextStyle(color: appBarTextLightColor),),
      actions: [
        //TODO: (GeorgeOblomov) need to fix it!
        Hero(tag: 'theme_switch_widget',child: Switch(value: true, onChanged: (_) {},)),
        HorizontalSpace(32),
        Hero(tag: 'favorite_widget',child: IconButton(icon: Icon(Icons.favorite_border), onPressed: () {  },)),
        HorizontalSpace(32),
      ],
    );
  }
}