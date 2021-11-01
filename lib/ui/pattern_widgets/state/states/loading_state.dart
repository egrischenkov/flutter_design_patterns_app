import 'package:flutter/material.dart';

import '../fake_api.dart';
import '../i_state.dart';
import '../state_context.dart';
import 'error_state.dart';
import 'loaded_state.dart';
import 'no_results_state.dart';

class LoadingState implements IState {
  final FakeApi _api = FakeApi();

  @override
  Future nextState(StateContext stateContext) async {
    try {
      var resultList = await _api.getNames();

      if (resultList.isEmpty) {
        stateContext.setState(NoResultsState());
      } else {
        stateContext.setState(LoadedState(resultList));
      }
    } on Exception {
      stateContext.setState(ErrorState());
    }
  }

  @override
  Widget render() {
    return CircularProgressIndicator(
      backgroundColor: Colors.transparent,
      valueColor: AlwaysStoppedAnimation<Color>(Colors.black),
    );
  }

}