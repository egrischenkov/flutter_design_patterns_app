import 'package:flutter/material.dart';
import '../../utils/app_colors.dart';
import '../widgets/vertical_space.dart';

class AppBarItem extends StatelessWidget {
  final Widget widget;
  final String title;
  final VoidCallback onTap;

  AppBarItem(this.widget, this.title, this.onTap);

  @override
  Widget build(BuildContext context) {
    return Material(
      color: Colors.transparent,
      borderRadius: BorderRadius.circular(20),
      child: InkWell(
        borderRadius: BorderRadius.circular(20),
        onTap: onTap,
        child: Padding(
          padding: EdgeInsets.all(8),
          child: Column(
            mainAxisSize: MainAxisSize.min,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              widget,
              VerticalSpace(),
              Text(
                title,
                style: TextStyle(color: appBarItemColorLight),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
