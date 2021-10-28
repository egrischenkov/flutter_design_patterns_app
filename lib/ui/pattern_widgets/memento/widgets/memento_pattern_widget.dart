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
