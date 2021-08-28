import 'package:flutter/material.dart';
import '../widgets/vertical_space.dart';

class CurvedListItem extends StatelessWidget {
  final String title;
  final String subtitle;
  final String description;
  final Color nextColor;
  final Color color;

  const CurvedListItem({
    required this.title,
    required this.subtitle,
    required this.description,
    required this.color,
    required this.nextColor,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      color: nextColor,
      child: Container(
        decoration: BoxDecoration(
          color: color,
          borderRadius: const BorderRadius.only(
            bottomLeft: Radius.circular(90.0),
          ),
        ),
        padding: const EdgeInsets.only(
          left: 32,
          right: 32,
          top: 80.0,
          bottom: 50,
        ),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: <Widget>[
            Text(
              subtitle,
              style: TextStyle(color: Colors.white, fontSize: 12),
            ),
            VerticalSpace(2),
            Text(
              title,
              style: TextStyle(color: Colors.white, fontSize: 22, fontWeight: FontWeight.bold),
            ),
            VerticalSpace(32),
            Text(description, style: TextStyle(color: Colors.white),),
          ],
        ),
      ),
    );
  }
}
