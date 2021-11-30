/*
Copyright (c) 2019 Mangirdas Kazlauskas

Permission is hereby granted, free of charge, to any person obtaining a copy
of this software and associated documentation files (the "Software"), to deal
in the Software without restriction, including without limitation the rights
to use, copy, modify, merge, publish, distribute, sublicense, and/or sell
copies of the Software, and to permit persons to whom the Software is
furnished to do so, subject to the following conditions:

The above copyright notice and this permission notice shall be included in all
copies or substantial portions of the Software.

THE SOFTWARE IS PROVIDED "AS IS", WITHOUT WARRANTY OF ANY KIND, EXPRESS OR
IMPLIED, INCLUDING BUT NOT LIMITED TO THE WARRANTIES OF MERCHANTABILITY,
FITNESS FOR A PARTICULAR PURPOSE AND NONINFRINGEMENT. IN NO EVENT SHALL THE
AUTHORS OR COPYRIGHT HOLDERS BE LIABLE FOR ANY CLAIM, DAMAGES OR OTHER
LIABILITY, WHETHER IN AN ACTION OF CONTRACT, TORT OR OTHERWISE, ARISING FROM,
OUT OF OR IN CONNECTION WITH THE SOFTWARE OR THE USE OR OTHER DEALINGS IN THE
SOFTWARE.
*/

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
