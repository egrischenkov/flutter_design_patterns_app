import 'package:meta/meta.dart';

import '../log_level.dart';

abstract class BaseLogger {
  @protected
  final LogLevel logLevel;
  final BaseLogger? _nextLogger;

  const BaseLogger(this.logLevel, [this._nextLogger]);

  void log(String message);


  void logMessage(LogLevel level, String message) {
    if (logLevel <= level) {
      log(message);
    }

    if (_nextLogger != null) {
      _nextLogger!.logMessage(level, message);
    }
  }

  void logDebug(String message) => logMessage(LogLevel.Debug, message);
  void logInfo(String message) => logMessage(LogLevel.Info, message);
  void logError(String message) => logMessage(LogLevel.Error, message);
}