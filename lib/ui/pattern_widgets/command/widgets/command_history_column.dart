import 'package:flutter/material.dart';
import '../../../widgets/vertical_space.dart';

class CommandHistoryColumn extends StatelessWidget {
  final List<String> commandList;

  const CommandHistoryColumn({
    required this.commandList,
  });

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.stretch,
      children: <Widget>[
        Text(
          'Command history:',
          style: Theme.of(context).textTheme.headline6,
        ),
        VerticalSpace(8),
        if (commandList.isEmpty) const Text('Command history is empty.'),
        for (var i = 0; i < commandList.length; i++)
          Text('${i + 1}. ${commandList[i]}'),
      ],
    );
  }
}
