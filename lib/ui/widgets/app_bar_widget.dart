import 'package:flutter/material.dart';

class AppBarWidget extends StatelessWidget {
  final String title;

  AppBarWidget(this.title);

  @override
  Widget build(BuildContext context) {
    return AppBar(
       title: Text(title),
    );
  }
}