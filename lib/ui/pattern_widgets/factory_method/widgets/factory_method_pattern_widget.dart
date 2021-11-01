import 'package:flutter/material.dart';
import '../../../widgets/common_elevated_button.dart';
import '../../../widgets/vertical_space.dart';
import '../alert_dialogs/android_alert_dialog.dart';
import '../alert_dialogs/ios_alert_dialog.dart';
import '../custom_alert_dialog.dart';
import 'dialog_selection_widget.dart';

class FactoryMethodPatternWidget extends StatefulWidget {
  @override
  _FactoryMethodPatternWidgetState createState() => _FactoryMethodPatternWidgetState();
}

class _FactoryMethodPatternWidgetState extends State<FactoryMethodPatternWidget> {
  final List<CustomAlertDialog> _dialogs = [
    AndroidAlertDialog(),
    IosAlertDialog(),
  ];

  var _selectedDialogIndex = 0;

  Future _showCustomDialog(BuildContext context) async {
    var selectedDialog = _dialogs[_selectedDialogIndex];

    await selectedDialog.show(context);
  }

  void _setSelectedDialogIndex(int index) {
    setState(() {
      _selectedDialogIndex = index;
    });
  }

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      child: Column(
        children: [
          DialogSelectionWidget(
            selectedIndex: _selectedDialogIndex,
            onChanged: (index) => _setSelectedDialogIndex(index ?? 0),
            customDialogList: _dialogs,
          ),
          VerticalSpace(32),
          CommonElevatedButton(
            title: 'Show Dialog',
            onTap: () => _showCustomDialog(context),
          ),
        ],
      ),
    );
  }
}
