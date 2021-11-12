import 'package:flutter/material.dart';
import '../../../../utils/app_colors.dart';

class StateCardWidget extends StatelessWidget {
  final String text;

  const StateCardWidget({required this.text});

  @override
  Widget build(BuildContext context) {
    return Card(
      child: Container(
        height: 64,
        padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 8),
        child: Center(
          child: Text(
            text,
            textAlign: TextAlign.center,
            style: TextStyle(color: textColor),
          ),
        ),
      ),
    );
  }
}
