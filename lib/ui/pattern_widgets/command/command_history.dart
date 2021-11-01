import 'dart:collection';

import 'commands/i_command.dart';

class CommandHistory {
  final ListQueue<ICommand> _commandsList = ListQueue<ICommand>();

  bool get isEmpty => _commandsList.isEmpty;

  List<String> get commandHistoryList {
    return _commandsList.map((command) => command.getTitle()).toList();
  }

  void add(ICommand command) => _commandsList.add(command);

  void undo() {
    if (_commandsList.isNotEmpty) {
      var command = _commandsList.removeLast();
      command.undo();
    }
  }
}