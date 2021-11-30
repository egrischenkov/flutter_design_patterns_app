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