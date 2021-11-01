import '../log_bloc.dart';
import '../log_level.dart';
import '../services/mail_service.dart';
import 'base_logger.dart';

class ErrorLogger extends BaseLogger {
  late MailService _mailService;

  ErrorLogger(LogBloc logBloc, [BaseLogger? baseLogger]) : super(LogLevel.Error, baseLogger) {
    _mailService = MailService(logBloc);
  }

  @override
  void log(String message) {
    _mailService.sendErrorMail(logLevel, message);
  }
}