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

import '../singletons/state_base.dart';
import '../singletons/state_singleton_by_definition.dart';
import '../singletons/state_singleton_factory.dart';
import '../singletons/state_without_singleton.dart';
import 'state_card_widget.dart';

class SingletonPatternWidget extends StatefulWidget {
  @override
  _SingletonPatternWidgetState createState() => _SingletonPatternWidgetState();
}

class _SingletonPatternWidgetState extends State<SingletonPatternWidget> {
  final List<StateBase> _stateList = [
    StateSingletonFactory(),
    StateSingletonByDefinition.getInstance(),
    StateWithoutSingleton(),
  ];

  void _setTextValues([String text = 'Singleton']) {
    print('lol');
    for (final state in _stateList) {
      state.setStateText(text);
    }
    setState((){});
  }

  void _reset() {
    for (final state in _stateList) {
      state.reset();
    }
    setState(() {});
  }

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      child: Column(
        mainAxisSize: MainAxisSize.min,
        children: [
          for (final state in _stateList)
            StateCardWidget(text: state.currentText),
          const SizedBox(height:16),
          CommonElevatedButton(
            title: 'Change stateText to Singleton',
            onTap: _setTextValues,
          ),
          const SizedBox(height:16),
          CommonElevatedButton(
            title: 'Reset',
            onTap: _reset,
          ),
        ],
      ),
    );
  }
}
