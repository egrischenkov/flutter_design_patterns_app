import 'package:flutter/material.dart';

import '../custom_alert_dialog.dart';

class AndroidAlertDialog extends CustomAlertDialog {
  @override
  String getTitle() => 'Android Alert Dialog';

  @override
  Widget create(BuildContext context) {
    return AlertDialog(
      title: Text(getTitle()),
      content: Text('This is the material-style alert dialog'),
      actions: [
        TextButton(
          onPressed: () => Navigator.of(context).pop(),
          child: Text('Close'),
        ),
      ],
    );
  }
}
