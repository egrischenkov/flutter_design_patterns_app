import 'package:flutter/material.dart';

abstract class CustomAlertDialog {
  String getTitle();

  Widget create(BuildContext context);

  Future<void> show(BuildContext context) {
    var dialog = create(context);

    return showDialog<void>(
      context: context,
      barrierDismissible: false,
      builder: (context) => dialog,
    );
  }
}