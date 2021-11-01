import 'package:flutter/material.dart';

import '../i_state.dart';
import '../state_context.dart';
import 'loading_state.dart';

class NoResultsState implements IState {
  @override
  Future nextState(StateContext stateContext) async {
    stateContext.setState(LoadingState());
  }

  @override
  Widget render() {
    return Text(
      'No Results',
      style: TextStyle(fontSize: 24),
      textAlign: TextAlign.center,
    );
  }
}