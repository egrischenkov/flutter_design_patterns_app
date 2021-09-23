import 'package:flutter/material.dart';
import '../../utils/app_colors.dart';

class CommonElevatedButton extends StatelessWidget {
  final String title;
  final VoidCallback onTap;

  CommonElevatedButton({required this.title, required this.onTap});

  @override
  Widget build(BuildContext context) {
    return ElevatedButton(
      style: ButtonStyle(
        backgroundColor: MaterialStateProperty.all(mainPageBackgroundColorLight),
      ),
      onPressed: onTap,
      child: Text(title, style: TextStyle(fontSize: 20,)),
    );
  }
}
