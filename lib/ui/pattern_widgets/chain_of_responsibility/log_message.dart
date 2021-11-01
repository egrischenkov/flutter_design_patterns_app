import 'package:flutter/material.dart';

import 'log_level.dart';

class LogMessage {
  final LogLevel logLevel;
  final String message;

  LogMessage({required this.logLevel, required this.message});

  String get _logLevelString {
    return logLevel.toString().split('.').last.toUpperCase();
  }

  Color get _logEntryColor {
    switch (logLevel) {
      case LogLevel.Debug:
        return Colors.grey;
      case LogLevel.Info:
        return Colors.blue;
      case LogLevel.Error:
        return Colors.red;
      default:
        throw Exception('LogLevel $logLevel is not supported');
    }
  }

  Widget getFormattedMessageWidget() {
    return Text(
      '$_logLevelString: $message',
      textAlign: TextAlign.justify,
      //TODO: (Egor) don't forget to remove it
      overflow: TextOverflow.ellipsis,
      maxLines: 2,
      style: TextStyle(color: _logEntryColor),
    );
  }
}