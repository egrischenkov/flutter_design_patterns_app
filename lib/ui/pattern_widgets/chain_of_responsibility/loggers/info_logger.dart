import '../log_bloc.dart';
import '../log_level.dart';
import '../services/external_logging_service.dart';

import 'base_logger.dart';

class InfoLogger extends BaseLogger {
  late ExternalLoggingService _externalLoggingService;

  InfoLogger(LogBloc logBloc, [BaseLogger? baseLogger])
      : super(LogLevel.Info, baseLogger) {
    _externalLoggingService = ExternalLoggingService(logBloc);
  }

  @override
  void log(String message) {
    _externalLoggingService.logMessage(logLevel, message);
  }
}