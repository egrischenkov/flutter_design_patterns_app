import 'package:flutter/material.dart';

import '../i_state.dart';
import '../state_context.dart';
import 'loading_state.dart';

class LoadedState implements IState {
  final List<String> names;

  LoadedState(this.names);

  @override
  Future nextState(StateContext stateContext) async {
    stateContext.setState(LoadingState());
  }

  @override
  Widget render() {
    return Column(
      children: names.map((name) {
        return Card(
          child: ListTile(
            leading: CircleAvatar(
              backgroundColor: Colors.grey,
              foregroundColor: Colors.white,
              child: Text(name[0]),
            ),
            title: Text(name),
          ),
        );
      }).toList(),
    );
  }

}