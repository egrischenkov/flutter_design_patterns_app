import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import '../../../../utils/app_colors.dart';

import '../custom_alert_dialog.dart';

class IosAlertDialog extends CustomAlertDialog {
  @override
  Widget create(BuildContext context) {
    return CupertinoAlertDialog(
      title: Text(getTitle()),
      content: Text('This is cupertino-style alert dialog'),
      actions: [
        CupertinoButton(
          child: Text('Close', style: TextStyle(color: textColor)),
          onPressed: () => Navigator.of(context).pop(),
        )
      ],
    );
  }

  @override
  String getTitle() => 'IOS Alert Dialog';
}
