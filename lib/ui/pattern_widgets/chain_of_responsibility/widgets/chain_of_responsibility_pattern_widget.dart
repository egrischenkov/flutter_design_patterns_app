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

import 'package:faker/faker.dart';
import 'package:flutter/material.dart';

import '../../../widgets/common_elevated_button.dart';
import '../log_bloc.dart';
import '../log_message.dart';
import '../loggers/base_logger.dart';
import '../loggers/debug_logger.dart';
import '../loggers/error_logger.dart';
import '../loggers/info_logger.dart';
import 'log_messages_column.dart';

class ChainOfResponsibilityPatternWidget extends StatefulWidget {
  @override
  _ChainOfResponsibilityPatternWidgetState createState() =>
      _ChainOfResponsibilityPatternWidgetState();
}

class _ChainOfResponsibilityPatternWidgetState
    extends State<ChainOfResponsibilityPatternWidget> {
  final LogBloc logBloc = LogBloc();

  late BaseLogger _logger;

  @override
  void initState() {
    super.initState();

    _logger = DebugLogger(
      logBloc,
      InfoLogger(
        logBloc,
        ErrorLogger(logBloc),
      ),
    );
  }

  @override
  void dispose() {
    logBloc.dispose();
    super.dispose();
  }

  String get _randomLog => faker.lorem.sentence();

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      padding: EdgeInsets.symmetric(horizontal: 16),
      child: Column(
        children: [
          CommonElevatedButton(title: 'Log debug', onTap: () => _logger.logDebug(_randomLog)),
          CommonElevatedButton(title: 'Log info', onTap: () => _logger.logInfo(_randomLog)),
          CommonElevatedButton(title: 'Log error', onTap: () => _logger.logError(_randomLog)),
          Divider(),
          StreamBuilder<List<LogMessage>>(
            initialData: [],
            stream: logBloc.outLogStream,
            builder: (_, snapshot) {
              return LogMessagesColumn(
                logMessages: snapshot.data!,
              );
            },
          ),
        ],
      ),
    );
  }
}
