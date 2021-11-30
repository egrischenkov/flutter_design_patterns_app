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
import '../../../widgets/platform_progress_indicator.dart';
import '../../../widgets/vertical_space.dart';
import '../i_state.dart';
import '../state_context.dart';
import '../states/no_results_state.dart';

class StatePatternWidget extends StatefulWidget {
  @override
  _StatePatternWidgetState createState() => _StatePatternWidgetState();
}

class _StatePatternWidgetState extends State<StatePatternWidget> {
  final StateContext _stateContext = StateContext();

  Future _changeState() {
    return _stateContext.nextState();
  }

  @override
  void dispose() {
    _stateContext.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      padding: EdgeInsets.symmetric(horizontal: 16),
      child: Column(
        children: [
          CommonElevatedButton(
            title: 'Load names',
            onTap:  () async => await _changeState(),
          ),
          VerticalSpace(16),
          StreamBuilder<IState>(
            initialData: NoResultsState(),
            stream: _stateContext.outState,
            builder: (_, snapshot) {
              return snapshot.data?.render() ?? PlatformProgressIndicator();
            }
          ),
        ],
      ),
    );
  }
}
