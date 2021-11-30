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
import '../../command/command_history.dart';
import '../../command/commands/i_command.dart';
import '../commands/randomise_properties_command.dart';
import '../originator.dart';
import '../shape_container.dart';

class MementoPatternWidget extends StatefulWidget {
  @override
  _MementoPatternWidgetState createState() => _MementoPatternWidgetState();
}

class _MementoPatternWidgetState extends State<MementoPatternWidget> {
  final CommandHistory _commandHistory = CommandHistory();
  final Originator _originator = Originator();

  void _randomiseProperties() {
    final command = RandomisePropertiesCommand(_originator);
    _executeCommand(command);
  }

  void _executeCommand(ICommand command) {
    setState(() {
      command.execute();
      _commandHistory.add(command);
    });
  }

  void _undo() {
    setState(_commandHistory.undo);
  }

  @override
  Widget build(BuildContext context) {
    return ScrollConfiguration(
      behavior: const ScrollBehavior(),
      child: SingleChildScrollView(
        padding: EdgeInsets.symmetric(horizontal: 16),
        child: Column(
          children: <Widget>[
            ShapeContainer(
              shape: _originator.state,
            ),
            VerticalSpace(16),
            CommonElevatedButton(
              onTap: _randomiseProperties,
              title: 'Randomise properties',
            ),
            const Divider(),
            CommonElevatedButton(
              onTap: _commandHistory.isEmpty ? () {} : _undo,
              title: 'Undo',
            ),
            VerticalSpace(16),
          ],
        ),
      ),
    );
  }
}
