import 'package:flutter/material.dart';

class CommonElevatedButton extends StatelessWidget {
  final String title;
  final VoidCallback onTap;

  CommonElevatedButton({required this.title, required this.onTap});

  @override
  Widget build(BuildContext context) {

    return TextButton(
      onPressed: onTap,
      child: Text(
        title,
      ),
    );
  }
}
