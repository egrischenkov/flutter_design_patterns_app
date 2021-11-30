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
import '../command_history.dart';
import '../commands/change_color_command.dart';
import '../commands/change_height_command.dart';
import '../commands/change_width_command.dart';
import '../commands/i_command.dart';
import '../shape.dart';
import 'command_history_column.dart';
import 'shape_container.dart';

class CommandPatternWidget extends StatefulWidget {
  @override
  _CommandPatternWidgetState createState() => _CommandPatternWidgetState();
}

class _CommandPatternWidgetState extends State<CommandPatternWidget> {
  final CommandHistory _commandHistory = CommandHistory();
  final Shape _shape = Shape.initial();

  void _executeCommand(ICommand command) {
    setState(() {
      command.execute();
      _commandHistory.add(command);
    });
  }

  void _changeColor() {
    final command = ChangeColorCommand(_shape);
    _executeCommand(command);
  }

  void _changeHeight() {
    final command = ChangeHeightCommand(_shape);
    _executeCommand(command);
  }

  void _changeWidth() {
    final command = ChangeWidthCommand(_shape);
    _executeCommand(command);
  }

  void _undo() {
    setState(_commandHistory.undo);
  }

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      padding: EdgeInsets.symmetric(horizontal: 16),
      child: Column(
        children: [
          ShapeContainer(shape: _shape),
          VerticalSpace(16),
          CommonElevatedButton(
            title: 'Change color',
            onTap: _changeColor,
          ),
          CommonElevatedButton(
            title: 'Change height',
            onTap: _changeHeight,
          ),
          CommonElevatedButton(
            title: 'Change width',
            onTap: _changeWidth,
          ),
          VerticalSpace(16),
          Divider(),
          CommonElevatedButton(
            title: 'Undo',
            onTap: _undo,
          ),
          VerticalSpace(8),
          CommandHistoryColumn(commandList: _commandHistory.commandHistoryList),
        ],
      ),
    );
  }
}
