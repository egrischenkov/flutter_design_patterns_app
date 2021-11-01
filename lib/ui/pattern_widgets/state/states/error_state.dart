import 'package:flutter/material.dart';

import '../i_state.dart';
import '../state_context.dart';
import 'loading_state.dart';

class ErrorState implements IState {
  @override
  Future nextState(StateContext stateContext) async {
    stateContext.setState(LoadingState());
  }

  @override
  Widget render() {
    return Text(
      'Oops! Something went wrong...',
      style: TextStyle(
        color: Colors.red,
        fontSize: 24.0,
      ),
      textAlign: TextAlign.center,
    );
  }
}