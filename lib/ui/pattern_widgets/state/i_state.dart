import 'package:flutter/material.dart';

import 'state_context.dart';

abstract class IState {
  Future nextState(StateContext stateContext);
  Widget render();
}