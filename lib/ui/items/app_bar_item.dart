import 'package:flutter/material.dart';
import '../../utils/app_colors.dart';
import '../widgets/vertical_space.dart';

class AppBarItem extends StatelessWidget {
  final Widget widget;
  final String title;

  AppBarItem(this.widget, this.title);

  @override
  Widget build(BuildContext context) {
    return Material(
      borderRadius: BorderRadius.circular(20),
      child: InkWell(
        borderRadius: BorderRadius.circular(20),
        onTap: () => print('onTap'),
        child: Padding(
          padding: EdgeInsets.all(8),
          child: Column(
            mainAxisSize: MainAxisSize.min,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              SizedBox(
                height: 40,
                child: FittedBox(child: widget),
              ),
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