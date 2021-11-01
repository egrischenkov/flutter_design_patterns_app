import '../log_bloc.dart';
import '../log_level.dart';
import '../log_message.dart';
import 'base_logger.dart';

class DebugLogger extends BaseLogger {
  final LogBloc logBloc;

  const DebugLogger(this.logBloc, [BaseLogger? nextLogger])
      : super(LogLevel.Debug, nextLogger);

  @override
  void log(String message) {
    final logMessage = LogMessage(logLevel: logLevel, message: message);

    logBloc.log(logMessage);
  }
}
