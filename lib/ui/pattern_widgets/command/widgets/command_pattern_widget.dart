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
