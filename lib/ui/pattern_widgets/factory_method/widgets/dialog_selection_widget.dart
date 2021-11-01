import 'package:flutter/material.dart';

import '../custom_alert_dialog.dart';

class DialogSelectionWidget extends StatelessWidget {
  final List<CustomAlertDialog> customDialogList;
  final int selectedIndex;
  final ValueSetter<int?> onChanged;

  const DialogSelectionWidget({
    required this.customDialogList,
    required this.selectedIndex,
    required this.onChanged,
  });

  @override
  Widget build(BuildContext context) {
    return ListView.builder(
      shrinkWrap: true,
      itemCount: customDialogList.length,
      itemBuilder: (context, index) {
        return RadioListTile(
          title: Text(customDialogList[index].getTitle()),
          value: index,
          groupValue: selectedIndex,
          selected: index == selectedIndex,
          activeColor: Colors.black,
          controlAffinity: ListTileControlAffinity.platform,
          onChanged: onChanged,
        );
      },
    );
  }
}
