import '../log_bloc.dart';
import '../log_level.dart';
import '../log_message.dart';

class ExternalLoggingService {
  final LogBloc logBloc;

  ExternalLoggingService(this.logBloc);

  void logMessage(LogLevel logLevel, String message) {
    final logMessage = LogMessage(logLevel: logLevel, message: message);
    /// Suppose here we want send log message to external logging service
    ///
    /// Send event to Bloc for visualizing chain of messages
    logBloc.log(logMessage);
  }
}